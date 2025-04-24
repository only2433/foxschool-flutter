

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataObject.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/data/model/main/series/base/SeriesBaseResult.dart';
import 'package:foxschool/data/model/movie/intent_data/PlayerIntentParamsObject.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';
import 'package:foxschool/data/model/contents/DetailItemInformationResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/SeriesListAPINotifier.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/SeriesListUINotifier.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/screen/FlashcardScreen.dart';
import 'package:foxschool/presentation/view/screen/MoviePlayerScreen.dart';
import 'package:foxschool/presentation/view/screen/QuizScreen.dart';
import 'package:foxschool/presentation/view/screen/VocabularyScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/EbookScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameCrosswordScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameStarwordsScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/TranslateScreen.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/presentation/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;

class SeriesContentsListFactoryController extends BlocController {

  late MainInformationResult _mainData;
  late DetailItemInformationResult _seriesContentsData;
  List<ContentsBaseResult> _currentContentsItemList = [];
  bool isStillOnSeries = false;

  Color _currentTitleColor = Colors.transparent;
  ScrollDirection _currentScrollDirection = ScrollDirection.idle;
  double _lastOffset  = 0.0;
  late SeriesListAPINotifierProvider _repositoryProvider;

  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;
  final ScrollController scrollController;
  final WidgetRef widgetRef;
  SeriesContentsListFactoryController({
    required this.context,
    required this.currentSeriesBaseResult,
    required this.scrollController,
    required this.widgetRef
  });



  @override
  void init() async {
    _repositoryProvider = seriesListAPINotifierProvider(getIt<FoxSchoolRepository>());

    Future.delayed(Duration.zero, () {
      widgetRef.read(seriesListUINotifierProvider.notifier).updateContentsLoadingState(isDataLoading: true);
      widgetRef.read(seriesListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
    });
    await _getMainData();
    _settingRequestDataNotifier();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      widgetRef.read(_repositoryProvider.notifier).requestSeriesContentsData(
          currentSeriesBaseResult.id
      );
    });

    scrollController.addListener(() {
      if(_currentScrollDirection != scrollController.position.userScrollDirection)
        {
          _currentScrollDirection = scrollController.position.userScrollDirection;
          if(_currentScrollDirection == ScrollDirection.forward)
            {
              Logcats.message("아래로 스크롤");
            }
          else
            {
              Logcats.message("위로 스크롤");
            }
          _lastOffset = scrollController.offset;
        }
      double currentOffset = _lastOffset - scrollController.offset;


      if(_currentScrollDirection == ScrollDirection.reverse && currentOffset.toInt() <= -60)
        {
          if(_currentTitleColor != AppColors.color_ffffff)
          {
            _currentTitleColor = AppColors.color_ffffff;
            widgetRef.read(seriesListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
          }
        }
      else if(_currentScrollDirection == ScrollDirection.forward && currentOffset.toInt() > 60)
        {
          if(_currentTitleColor != Colors.transparent)
          {
            _currentTitleColor = Colors.transparent;
            widgetRef.read(seriesListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
          }
        }

    });
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state){
            state.maybeWhen(
                loadingState: (){
                  LoadingDialog.show(context);
                },
                errorState: (message){
                  LoadingDialog.dismiss(context);
                 // Fluttertoast.showToast(msg: message);
                },
                orElse: (){}
                );
          },
          seriesContentsDataLoadedState: (data){
            _seriesContentsData = data;
            if (_seriesContentsData.getSeriesID() != "")
            {
              if (_seriesContentsData.isSingleSeries() == false && _seriesContentsData.isStillOnSeries())
              {
                isStillOnSeries = true;
              }
            }
            _initContentsItemList();
          },
          bookshelfContentsAddState: (data) async{
            await _updateBookshelfData(data);
            _setSelectAllItem(false);

/*            //추후 제거
            context.read<MainMyBooksTypeCubit>()
                .setMyBooksTypeData(
                MyBooksType.BOOKSHELF,
                _mainData.bookshelfList,
                _mainData.vocabularyList
            );*/
            widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
                MyBooksType.BOOKSHELF,
                _mainData.bookshelfList,
                _mainData.vocabularyList);

            MainObserver().update();
            LoadingDialog.dismiss(context);
            //Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_save_contents_in_bookshelf']);
          }
      );
    });
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }


  Future<void> _updateBookshelfData(MyBookshelfResult data) async
  {
    await _getMainData();
    List<MyBookshelfResult> dataList = _mainData.bookshelfList.toList();
    for(int i = 0; i < _mainData.bookshelfList.length; i++)
      {
        if(_mainData.bookshelfList[i].id == data.id)
          {
            dataList[i] = data;
          }
      }
    _mainData = _mainData.copyWith(bookshelfList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
  }

  void _initContentsItemList() {
    _currentContentsItemList.clear();
    _currentContentsItemList.addAll(_seriesContentsData.contentsList);
    if (isStillOnSeries) {
      _currentContentsItemList = List.from(_currentContentsItemList.reversed);
    }

    widgetRef.read(seriesListUINotifierProvider.notifier).notifySeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);
  }


  String _getSeriesColor() {
    String result = "";
    if (currentSeriesBaseResult.seriesType != Common.CONTENT_TYPE_SONG
        && _seriesContentsData.isSingleSeries() == false) {
      result = currentSeriesBaseResult.getStatusColor();
    }
    return result;
  }

  void _setSelectAllItem(bool isSelected)
  {
    for (int i = 0; i < _currentContentsItemList.length ; i++)
    {
      _currentContentsItemList[i] = _currentContentsItemList[i].setSelected(isSelected);
    }
    widgetRef.read(seriesListUINotifierProvider.notifier).notifySeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);
  }

  int _getItemSelectCount()
  {
    return _currentContentsItemList.where((item) => item.isSelected).length;
  }

  List<ContentsBaseResult> _getSelectedList()
  {
    return _currentContentsItemList.where((item) => item.isSelected).toList();
  }

  void _goToNavigateScreen(ContentsItemType type, ContentsBaseResult data) async
  {
    switch(type)
    {
      case ContentsItemType.QUIZ:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return  QuizScreen(
                  contentID: data.id,
                  title: data.name,
                  subTitle: data.subName);
            })
        );
        break;
      case ContentsItemType.FLASHCARD:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              final item = FlashcardDataObject(
                  contentsID: data.id,
                  title: data.name,
                  subTitle: data.subName,
                  vocabularyType: VocabularyType.VOCABULARY_CONTENTS);
              return  FlashcardScreen(
                flashcardDataObject: item
              );
            })
        );
        break;
      case ContentsItemType.VOCABULARY:
        VocabularyInformationData vocabularyInformationData = VocabularyInformationData(
            id: data.id,
            type: VocabularyType.VOCABULARY_CONTENTS,
            title: data.getSubName());
        Navigator.push(
            context,
            Page.getDefaultTransition(context,
                VocabularyScreen(
                  data: vocabularyInformationData)
            )
        );
        break;
      case ContentsItemType.CROSSWORD:
        String accessToken = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
        Navigator.push(
            context,
            Page.getDefaultTransition(context,
                GameCrosswordScreen(
                    crosswordID: data.id,
                    accessToken: accessToken)
            )
        );
        break;
      case ContentsItemType.STARWORDS:
        String accessToken = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return GamsStarwordsScreen(
                  starwordsID: data.id,
                  accessToken: accessToken
              );
            })
        );
        break;
      case ContentsItemType.TRANSLATE:
        String accessToken = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
        Navigator.push(
            context,
            Page.getDefaultTransition(context,
                TranslateScreen(
                    translateID: data.id,
                    accessToken: accessToken)
            )
        );
        break;
      case ContentsItemType.EBOOK:
        String accessToken = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
        Navigator.push(
            context,
            Page.getDefaultTransition(context,
                EbookScreen(
                    ebookID: data.id,
                    accessToken: accessToken)
            )
        );
      case ContentsItemType.BOOKSHELF:
        _addItemInBookshelf(data);
        break;
      default:
        break;
    }
  }

  void _addItemInBookshelf(ContentsBaseResult data)
  {
    List<ContentsBaseResult> list = [];
    list.add(data);

    FoxSchoolDialog.showBottomAddBookshelfSelectDialog(
        context: context,
        list: _mainData.bookshelfList,
        onItemPressed: (index) {
          widgetRef.read(_repositoryProvider.notifier).requestAddBookshelfContents(
              _mainData.bookshelfList[index].id,
              list);
        });

  }

  @override
  void dispose() {
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void enableBottomSelectViewMode()
  {
    widgetRef.read(seriesListUINotifierProvider.notifier).enableBottomSelectView(true);
  }

  void disableBottomSelectViewMode()
  {
    widgetRef.read(seriesListUINotifierProvider.notifier).enableBottomSelectView(false);
    _setSelectAllItem(false);
    widgetRef.read(seriesListUINotifierProvider.notifier).setSelectItemCount(0);
  }

  void onSelectedItem(int index)
  {
    int itemCount = 0;
    if (_currentContentsItemList[index].isSelected)
    {
      _currentContentsItemList[index] = _currentContentsItemList[index].setSelected(false);
    }
    else
    {
      _currentContentsItemList[index] = _currentContentsItemList[index].setSelected(true);
    }

    widgetRef.read(seriesListUINotifierProvider.notifier).notifySeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);

    itemCount = _getItemSelectCount();

    if (itemCount == 0)
    {
      disableBottomSelectViewMode();
    }
    else if (itemCount == 1)
    {
      enableBottomSelectViewMode();
    }
    widgetRef.read(seriesListUINotifierProvider.notifier).setSelectItemCount(itemCount);
  }

  void onSelectAll()
  {
    _setSelectAllItem(true);
    widgetRef.read(seriesListUINotifierProvider.notifier).setSelectItemCount(_currentContentsItemList.length);
  }

  void onClickThumbnailItem(int index)
  {
    Logcats.message("index : $index");
    List<ContentsBaseResult> list = [_currentContentsItemList[index]];
    PlayerIntentParamsObject data = PlayerIntentParamsObject(list: list);

    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playerIntentParamsObject: data)
        )
    );
  }

  void onClickSelectedListPlay()
  {
    List<ContentsBaseResult> list = _getSelectedList();
    PlayerIntentParamsObject data = PlayerIntentParamsObject(list: list);
    disableBottomSelectViewMode();
    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playerIntentParamsObject: data)
        )
    );
  }

  void onClickOption(int index)
  {
    BottomContentDialog.showBottomContentItemDialog(
        context: context, data: _currentContentsItemList[index], onItemTypeSelected: (type) async {
          Logcats.message("type : $type");

          Navigator.of(context).pop();

          await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORT), () {
            _goToNavigateScreen(type, _currentContentsItemList[index]);
          },);
        },);
  }

  void onClickAddMyBookshelf()
  {
    Logcats.message("");
    List<ContentsBaseResult> list = _getSelectedList();
    if(list.isNotEmpty)
      {
        FoxSchoolDialog.showBottomAddBookshelfSelectDialog(
            context: context,
            list: _mainData.bookshelfList,
            onItemPressed: (index) {
              widgetRef.read(_repositoryProvider.notifier).requestAddBookshelfContents(
                  _mainData.bookshelfList[index].id,
                  list);
            });
      }
    else
      {
        //Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_not_add_selected_contents_bookshelf']);
      }
  }
}