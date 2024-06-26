
import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/bookshelf/api/MyBookshelfBloc.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentListEvent.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentsDeleteEvent.dart';
import 'package:foxschool/bloc/bookshelf/api/state/BookshelfContentListLoadedState.dart';
import 'package:foxschool/bloc/bookshelf/api/state/BookshelfContentsDeleteState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsEnableBottomViewCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsItemListCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsSelectItemCountCubit.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/view/screen/MoviePlayerScreen.dart';
import '../../common/Common.dart';
import '../../common/MainObserver.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../data/main/MainInformationResult.dart';
import '../../data/vocabulary/information/VocabularyInformationData.dart';
import '../../di/Dependencies.dart';
import '../../enum/MyBooksType.dart';
import '../../enum/VocabularyType.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;

import '../../view/screen/QuizScreen.dart';
import '../../view/screen/VocabularyScreen.dart';
import '../../view/screen/webview/EbookScreen.dart';
import '../../view/screen/webview/GameCrosswordScreen.dart';
import '../../view/screen/webview/GameStarwordsScreen.dart';
import '../../view/screen/webview/TranslateScreen.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';

class MyBookshelfFactoryController extends BlocController
{
  late StreamSubscription _subscription;
  late List<ContentsBaseResult> _myBookshelfDataList;
  late List<ContentsBaseResult> _deleteDataList;
  late MainInformationResult _mainData;

  final BuildContext context;
  final String myBookshelfID;
  MyBookshelfFactoryController({
    required this.context,
    required this.myBookshelfID
  });

  @override
  void init() async
  {
    Logger.d("init");
    context.read<ContentsItemListCubit>().showLoading();
    _settingSubscription();
    await _getMainData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      Logger.d("");
      await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
        Logger.d("");
        BlocProvider.of<MyBookshelfBloc>(context).add(
            BookshelfContentListEvent(id: myBookshelfID)
        );
      },);
    });

  }

  void _settingSubscription()
  {
    var blocState;
    _subscription = BlocProvider.of<MyBookshelfBloc>(context).stream.listen((state) async {

      Logger.d("state.runtimeType : ${state.runtimeType}");
      switch(state.runtimeType)
      {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case BookshelfContentListLoadedState:
          blocState = state as BookshelfContentListLoadedState;
          _myBookshelfDataList = blocState.data;
          context.read<ContentsItemListCubit>().showContentsItemList(_myBookshelfDataList);
          break;
        case BookshelfContentsDeleteState:
          LoadingDialog.dismiss(context);
          _refreshContentsListData();
          disableBottomSelectViewMode();
          Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_delete_contents']);
          break;
        case AuthenticationErrorState:
          blocState = state as AuthenticationErrorState;
          if(blocState.isAutoRestart == false)
          {
            await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
          }
          Fluttertoast.showToast(msg: blocState.message);
          Navigator.pushAndRemoveUntil(
            context,
            Page.getIntroTransition(context),
                (route) => false,
          );
          break;
        case ErrorState:
          blocState = state as ErrorState;
          LoadingDialog.dismiss(context);
          Fluttertoast.showToast(msg: blocState.message);
          break;
      }
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

    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        MyBooksType.BOOKSHELF,
        _mainData.bookshelfList,
        _mainData.vocabularyList
    );

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
    context.read<ContentsItemListCubit>().showContentsItemList(_myBookshelfDataList);
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
        BlocProvider.of<MyBookshelfBloc>(context).add(
            BookshelfContentsDeleteEvent(
                bookshelfID: myBookshelfID,
                data: _deleteDataList)
        );
      },);
  }

  @override
  void onBackPressed()
  {
    Navigator.of(context).pop();
  }

  @override
  void dispose()
  {
    _subscription.cancel();
  }

  void enableBottomSelectViewMode()
  {
    Logger.d("");
    context.read<ContentsEnableBottomViewCubit>().enableBottomSelectView(true);
  }

  void disableBottomSelectViewMode()
  {
    Logger.d("");
    context.read<ContentsEnableBottomViewCubit>().enableBottomSelectView(false);
    _setSelectAllItem(false);
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(0);
  }

  void onSelectItem(int index)
  {
    Logger.d("index : $index");
    int itemCount = 0;
    if(_myBookshelfDataList[index].isSelected)
      {
        _myBookshelfDataList[index] = _myBookshelfDataList[index].setSelected(false);
      }
    else
      {
        _myBookshelfDataList[index] = _myBookshelfDataList[index].setSelected(true);
      }
    context.read<ContentsItemListCubit>().showContentsItemList(_myBookshelfDataList);
    itemCount = _getItemSelectCount();
    if(itemCount == 0)
      {
        disableBottomSelectViewMode();
      }
    else if(itemCount == 1)
      {
        enableBottomSelectViewMode();
      }
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(itemCount);
  }

  void onSelectAll()
  {
    Logger.d("");
    _setSelectAllItem(true);
    context.read<ContentsSelectItemCountCubit>().setSelectItemCount(_myBookshelfDataList.length);
  }

  void onClickThumbnailItem(int index)
  {
    Logger.d("index : $index");
    List<ContentsBaseResult> list = [];
    list.add(_myBookshelfDataList[index]);

    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)
        )
    );
  }

  void onClickSelectedListPlay()
  {
    Logger.d("");
    List<ContentsBaseResult> list = [];
    for(int i = 0; i < _myBookshelfDataList.length; i++)
      {
        if(_myBookshelfDataList[i].isSelected)
          {
            list.add(_myBookshelfDataList[i].setSelected(false));
          }
      }
    disableBottomSelectViewMode();
    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)
        )
    );
  }

  void onClickOption(int index)
  {
    Logger.d("index : $index");
    BottomContentDialog.showBottomContentItemDialog(
        context: context,
        data: _myBookshelfDataList[index],
        isDeleteItemInBookshelf: true,
        onItemTypeSelected: (type) async{
          onBackPressed();
          await Future.delayed(Duration(milliseconds: Common.DURATION_SHORT), () {
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
              BlocProvider.of<MyBookshelfBloc>(context).add(
                BookshelfContentsDeleteEvent(
                    bookshelfID: myBookshelfID,
                    data: _deleteDataList)
              );
            },);
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_select_contents_delete_in_bookshelf']);
      }
  }
}