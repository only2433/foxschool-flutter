

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentsAddEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/SeriesContentsListBloc.dart';
import 'package:foxschool/bloc/series_contents_list/api/event/SeriesContentsDataEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/state/SeriesContentsDataLoadedState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsEnableBottomViewCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsSelectItemCountCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/SeriesTitleColorCubit.dart';
import 'package:foxschool/data/contents/DetailItemInformationResult.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/view/screen/MoviePlayerScreen.dart';
import 'package:foxschool/view/screen/QuizScreen.dart';
import 'package:foxschool/view/screen/VocabularyScreen.dart';
import 'package:foxschool/view/screen/webview/EbookScreen.dart';
import 'package:foxschool/view/screen/webview/GameCrosswordScreen.dart';
import 'package:foxschool/view/screen/webview/GameStarwordsScreen.dart';
import 'package:foxschool/view/screen/webview/TranslateScreen.dart';

import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../common/MainObserver.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../data/main/MainInformationResult.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/ContentsItemType.dart';
import '../../enum/MyBooksType.dart';
import '../../values/AppColors.dart';
import '../bookshelf/api/state/BookshelfContentsAddState.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';
import 'factory/cubit/ContentsItemListCubit.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;

class SeriesContentsListFactoryController extends BlocController {
  late StreamSubscription _subscription;
  late MainInformationResult _mainData;
  late DetailItemInformationResult _seriesContentsData;
  List<ContentsBaseResult> _currentContentsItemList = [];
  bool isStillOnSeries = false;

  Color _currentTitleColor = Colors.transparent;
  ScrollDirection _currentScrollDirection = ScrollDirection.idle;
  double _lastOffset  = 0.0;

  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;
  final ScrollController scrollController;
  SeriesContentsListFactoryController({
    required this.context,
    required this.currentSeriesBaseResult,
    required this.scrollController
  });



  @override
  void init() async{
    context.read<ContentsItemListCubit>().showLoading();
    context.read<SeriesTitleColorCubit>().setTitleColor(_currentTitleColor);
    await _getMainData();
    _settingSubscriptions();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      BlocProvider.of<SeriesContentsBloc>(context).add(
          SeriesContentsDataEvent(displayID: currentSeriesBaseResult.id)
      );
    });

    scrollController.addListener(() {
      if(_currentScrollDirection != scrollController.position.userScrollDirection)
        {
          _currentScrollDirection = scrollController.position.userScrollDirection;
          if(_currentScrollDirection == ScrollDirection.forward)
            {
              Logger.d("아래로 스크롤");
            }
          else
            {
              Logger.d("위로 스크롤");
            }
          _lastOffset = scrollController.offset;
        }
      double currentOffset = _lastOffset - scrollController.offset;


      if(_currentScrollDirection == ScrollDirection.reverse && currentOffset.toInt() <= -60)
        {
          if(_currentTitleColor != AppColors.color_ffffff)
          {
            _currentTitleColor = AppColors.color_ffffff;
            context.read<SeriesTitleColorCubit>().setTitleColor(_currentTitleColor);

          }
        }
      else if(_currentScrollDirection == ScrollDirection.forward && currentOffset.toInt() > 60)
        {
          if(_currentTitleColor != Colors.transparent)
          {
            _currentTitleColor = Colors.transparent;
            context.read<SeriesTitleColorCubit>().setTitleColor(_currentTitleColor);

          }
        }

    });
  }

  void _settingSubscriptions() {
    var blocState;

    _subscription = BlocProvider.of<SeriesContentsBloc>(context).stream.listen((state) async {
      Logger.d("state : ${state.toString()}");
      switch (state.runtimeType) {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case SeriesContentsDataLoadedState:
          blocState = state as SeriesContentsDataLoadedState;
          _seriesContentsData = blocState.data;
          if (_seriesContentsData.getSeriesID() != "")
          {
            if (_seriesContentsData.isSingleSeries() == false && _seriesContentsData.isStillOnSeries())
            {
              isStillOnSeries = true;
            }
          }
          _initContentsItemList();
          break;
        case BookshelfContentsAddState:
          blocState = state as BookshelfContentsAddState;
          await _updateBookshelfData(blocState.data);
          _setSelectAllItem(false);
          context.read<MainMyBooksTypeCubit>()
              .setMyBooksTypeData(
              MyBooksType.BOOKSHELF,
              _mainData.bookshelfList,
              _mainData.vocabularyList
          );
          MainObserver().update();
          LoadingDialog.dismiss(context);
          Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_save_contents_in_bookshelf']);
          break;
        case ErrorState:
          LoadingDialog.dismiss(context);
          break;
      }
    });
    _subscription.resume();
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
    context.read<ContentsItemListCubit>().showSeriesItemList(
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
    context.read<ContentsItemListCubit>().showSeriesItemList(
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
            Page.getScaleTransition(context,
                QuizScreen(
                    contentID: data.id,
                    title: data.name,
                    subTitle: data.subName
            ))
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
            Page.getScaleTransition(context,
                GamsStarwordsScreen(
                    starwordsID: data.id,
                    accessToken: accessToken
                )
            )
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
          BlocProvider.of<SeriesContentsBloc>(context).add(
              BookshelfContentsAddEvent(
                  bookshelfID: _mainData.bookshelfList[index].id,
                  data: list)
          );
        });

  }

  @override
  void dispose() {
    _subscription.cancel();
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void enableBottomSelectViewMode()
  {
    context.read<ContentsEnableBottomViewCubit>().enableBottomSelectView(true);
  }

  void disableBottomSelectViewMode()
  {
    context.read<ContentsEnableBottomViewCubit>().enableBottomSelectView(false);
    _setSelectAllItem(false);
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(0);
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

    context.read<ContentsItemListCubit>().showSeriesItemList(
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
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(itemCount);
  }

  void onSelectAll()
  {
    _setSelectAllItem(true);
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(_currentContentsItemList.length);
  }

  void onClickThumbnailItem(int index)
  {
    Logger.d("index : $index");
    List<ContentsBaseResult> list = [];
    list.add(_currentContentsItemList[index]);

    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)
        )
    );
  }

  void onClickSelectedListPlay()
  {
    List<ContentsBaseResult> list = _getSelectedList();
    disableBottomSelectViewMode();
    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)
        )
    );
  }

  void onClickOption(int index)
  {
    BottomContentDialog.showBottomContentItemDialog(
        context: context, data: _currentContentsItemList[index], onItemTypeSelected: (type) async {
          Logger.d("type : ${type}");

          Navigator.of(context).pop();

          await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORT), () {
            _goToNavigateScreen(type, _currentContentsItemList[index]);
          },);
        },);
  }

  void onClickAddMyBookshelf()
  {
    Logger.d("");
    List<ContentsBaseResult> list = _getSelectedList();
    if(list.isNotEmpty)
      {
        FoxSchoolDialog.showBottomAddBookshelfSelectDialog(
            context: context,
            list: _mainData.bookshelfList,
            onItemPressed: (index) {
              BlocProvider.of<SeriesContentsBloc>(context).add(
                BookshelfContentsAddEvent(
                    bookshelfID: _mainData.bookshelfList[index].id,
                    data: list)
              );
            });
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_not_add_selected_contents_bookshelf']);
      }
  }
}