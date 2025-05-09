
import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Fluttertoast.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/movie/intent_data/PlayerIntentParamsObject.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';

import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/presentation/controller/bookshelf/river_pod/BookshelfListAPINotifier.dart';
import 'package:foxschool/presentation/controller/bookshelf/river_pod/BookshelfListUINotifier.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/view/screen/MoviePlayerScreen.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/data/model/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/presentation/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;

import 'package:foxschool/presentation/view/screen/QuizScreen.dart';
import 'package:foxschool/presentation/view/screen/VocabularyScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/EbookScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameCrosswordScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameStarwordsScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/TranslateScreen.dart';


class MyBookshelfFactoryController extends BlocController
{
  late List<ContentsBaseResult> _myBookshelfDataList;
  late List<ContentsBaseResult> _deleteDataList;
  late MainInformationResult _mainData;
  late BookshelfListAPINotifierProvider _repositoryProvider;

  final BuildContext context;
  final String myBookshelfID;
  final WidgetRef widgetRef;
  MyBookshelfFactoryController({
    required this.context,
    required this.myBookshelfID,
    required this.widgetRef
  });

  @override
  void init() async
  {
    Logcats.message("init");
    _repositoryProvider = bookshelfListAPINotifierProvider(getIt<FoxSchoolRepository>());
    Future.delayed(Duration.zero, (){
      widgetRef.read(bookshelfListUINotifierProvider.notifier).updateContentsLoadingState(isDataLoading: true);
    });

    _settingRequestDataNotifier();
    await _getMainData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG), () {
        Logcats.message("");
        widgetRef.read(_repositoryProvider.notifier).requestBookshelfContentsData(myBookshelfID);
      },);
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
                  Fluttertoast.showToast(msg: message);
                },
                authenticationErrorState: (isRestart, message) async{
                  if(isRestart == false)
                  {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  //Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );
                },
                orElse: (){}
            );
          },
          bookshelfContentsLoadedState: (data){
            _myBookshelfDataList = data;
            widgetRef.read(bookshelfListUINotifierProvider.notifier).notifyBookshelfItemList(_myBookshelfDataList);
          },
          bookshelfContentsDeleteState: (data){
            LoadingDialog.dismiss(context);
            _refreshContentsListData();
            disableBottomSelectViewMode();
            Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_delete_contents']);
          });
    });
  }


  void _syncContentsList()
  {
    Set<String> selectedContentsIDs = _deleteDataList.map((item) => item.id).toSet();
    _myBookshelfDataList.removeWhere((item) => selectedContentsIDs.contains(item.id));
  }

  void _refreshContentsListData() async
  {
    _syncContentsList();
    List<MyBookshelfResult> tempBookshelfList = _mainData.bookshelfList.toList();
    for(int i = 0; i < tempBookshelfList.length; i++)
    {
      if(myBookshelfID == tempBookshelfList[i].id)
      {
        tempBookshelfList[i] = tempBookshelfList[i].copyWith(contentsCount: _myBookshelfDataList.length);
        _mainData = _mainData.copyWith(bookshelfList: tempBookshelfList);
        break;
      }
    }

    widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
        MyBooksType.BOOKSHELF,
        _mainData.bookshelfList,
        _mainData.vocabularyList);

    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    MainObserver().update();

  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  void _setSelectAllItem(bool isSelected)
  {
    for(int i = 0;i < _myBookshelfDataList.length; i++)
    {
      _myBookshelfDataList[i] = _myBookshelfDataList[i].setSelected(isSelected);
    }
    widgetRef.read(bookshelfListUINotifierProvider.notifier).notifyBookshelfItemList(_myBookshelfDataList);
  }

  int _getItemSelectCount()
  {
    return _myBookshelfDataList.where((item) => item.isSelected).length;
  }

  List<ContentsBaseResult> _getSelectedList()
  {
    return _myBookshelfDataList.where((item) => item.isSelected).toList();
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
        _deleteItemInBookshelf(data);
        break;
      default:
        break;
    }
  }

  void _deleteItemInBookshelf(ContentsBaseResult data)
  {
    _deleteDataList = [];
    _deleteDataList.add(data);

    FoxSchoolDialog.showSelectDialog(
      context: context,
      message: getIt<FoxschoolLocalization>().data['message_question_delete_contents_in_bookshelf'],
      buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
      onSelected: () {
        widgetRef.read(_repositoryProvider.notifier).requestDeleteBookshelfContents(
            myBookshelfID, _deleteDataList
        );
      },);
  }

  @override
  void onBackPressed()
  {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {}

  void enableBottomSelectViewMode()
  {
    Logcats.message("");
    widgetRef.read(bookshelfListUINotifierProvider.notifier).enableBottomSelectView(true);
  }

  void disableBottomSelectViewMode()
  {
    Logcats.message("");
    widgetRef.read(bookshelfListUINotifierProvider.notifier).enableBottomSelectView(false);
    _setSelectAllItem(false);
    widgetRef.read(bookshelfListUINotifierProvider.notifier).setSelectItemCount(0);
  }

  void onSelectItem(int index)
  {
    Logcats.message("index : $index");
    int itemCount = 0;
    if(_myBookshelfDataList[index].isSelected)
    {
      _myBookshelfDataList[index] = _myBookshelfDataList[index].setSelected(false);
    }
    else
    {
      _myBookshelfDataList[index] = _myBookshelfDataList[index].setSelected(true);
    }
    widgetRef.read(bookshelfListUINotifierProvider.notifier).notifyBookshelfItemList(_myBookshelfDataList);
    itemCount = _getItemSelectCount();
    if(itemCount == 0)
    {
      disableBottomSelectViewMode();
    }
    else if(itemCount == 1)
    {
      enableBottomSelectViewMode();
    }
    widgetRef.read(bookshelfListUINotifierProvider.notifier).setSelectItemCount(itemCount);
  }

  void onSelectAll()
  {
    Logcats.message("");
    _setSelectAllItem(true);
    widgetRef.read(bookshelfListUINotifierProvider.notifier).setSelectItemCount(_myBookshelfDataList.length);
  }

  void onClickThumbnailItem(int index)
  {
    Logcats.message("index : $index");
    List<ContentsBaseResult> list = [_myBookshelfDataList[index]];
    PlayerIntentParamsObject data = PlayerIntentParamsObject(list: list);

    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playerIntentParamsObject: data)
        )
    );
  }

  void onClickSelectedListPlay()
  {
    Logcats.message("");
    List<ContentsBaseResult> list = [];
    for(int i = 0; i < _myBookshelfDataList.length; i++)
    {
      if(_myBookshelfDataList[i].isSelected)
      {
        list.add(_myBookshelfDataList[i].setSelected(false));
      }
    }
    PlayerIntentParamsObject data = PlayerIntentParamsObject(list: list);
    disableBottomSelectViewMode();
    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playerIntentParamsObject: data)
        )
    );
  }

  void onClickOption(int index)
  {
    Logcats.message("index : $index");
    BottomContentDialog.showBottomContentItemDialog(
      context: context,
      data: _myBookshelfDataList[index],
      isDeleteItemInBookshelf: true,
      onItemTypeSelected: (type) async{
        onBackPressed();
        await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORT), () {
          _goToNavigateScreen(type, _myBookshelfDataList[index]);
        },);
      },);
  }

  void onClickDeleteMyBookshelfItem()
  {

    _deleteDataList = _getSelectedList();

    if(_deleteDataList.isNotEmpty)
    {
      FoxSchoolDialog.showSelectDialog(
        context: context,
        message: getIt<FoxschoolLocalization>().data['message_question_delete_contents_in_bookshelf'],
        buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
        onSelected: () {
          widgetRef.read(_repositoryProvider.notifier).requestDeleteBookshelfContents(
              myBookshelfID, _deleteDataList
          );
        });
    }
    else
    {
      Logcats.message("-");
      Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_select_contents_delete_in_bookshelf']);
    }
  }
}