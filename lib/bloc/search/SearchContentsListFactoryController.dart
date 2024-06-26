

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/search/api/SearchContentsBloc.dart';
import 'package:foxschool/bloc/search/api/event/SearchContentsListEvent.dart';
import 'package:foxschool/bloc/search/api/state/SearchContentsListLoadedState.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchItemListCubit.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchTypeCubit.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/MoviePlayerScreen.dart';

import '../../common/Common.dart';
import '../../common/MainObserver.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../data/main/MainInformationResult.dart';
import '../../data/main/my_book/MyBookshelfResult.dart';
import '../../data/search/SearchListPagingResult.dart';
import '../../data/vocabulary/information/VocabularyInformationData.dart';
import '../../di/Dependencies.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import '../../enum/MyBooksType.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;

import '../../enum/VocabularyType.dart';
import '../../view/screen/QuizScreen.dart';
import '../../view/screen/VocabularyScreen.dart';
import '../../view/screen/webview/EbookScreen.dart';
import '../../view/screen/webview/GameCrosswordScreen.dart';
import '../../view/screen/webview/GameStarwordsScreen.dart';
import '../../view/screen/webview/TranslateScreen.dart';
import '../bookshelf/api/event/BookshelfContentsAddEvent.dart';
import '../bookshelf/api/state/BookshelfContentsAddState.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';

class SearchContentsListFactoryController extends BlocController
{
  late StreamSubscription _subscription;
  late MainInformationResult _mainData;
  SearchListPagingResult? _searchListPagingResult;
  List<ContentsBaseResult> _currentItemList = [];
  SearchType _currentSearchType = SearchType.ALL;
  String _currentKeyword = "";
  int _requestPagePosition = 1;
  bool isRequestLoading = false;

  final BuildContext context;
  SearchContentsListFactoryController({
    required this.context
  });

  @override
  void init() async
  {
    await _getMainData();
    _initCubitState();
    _settingSubscription();
  }

  void _initCubitState() {
    _initData();
    context.read<SearchTypeCubit>().init();
    context.read<SearchItemListCubit>().init();
  }

  void _settingSubscription()
  {
    var blocState;
    _subscription = BlocProvider.of<SearchContentsBloc>(context).stream.listen((state) async{

      Logger.d("state.runtimeType : ${state.runtimeType}");
      switch(state.runtimeType)
      {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case SearchListLoadingState:
          if(_searchListPagingResult != null)
          {
            context.read<SearchItemListCubit>().setSearchContentsList(true, _currentItemList);
          }
          else
          {
            context.read<SearchItemListCubit>().showLoading();
          }
          isRequestLoading = true;
          break;
        case SearchContentsListLoadedState:
          blocState = state as SearchContentsListLoadedState;
          _searchListPagingResult = blocState.data;
          await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), (){
          _settingSearchItemList();
          });
          isRequestLoading = false;
          break;
        case BookshelfContentsAddState:
          blocState = state as BookshelfContentsAddState;
          await _updateBookshelfData(blocState.data);

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
          if(_searchListPagingResult != null)
            {
              context.read<SearchItemListCubit>().init();
            }
          else
            {
              context.read<SearchItemListCubit>().setSearchContentsList(false, _currentItemList);
            }
          CommonUtils.getInstance(context).showErrorMessage(blocState.message);
          isRequestLoading = false;
          break;
      }
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


  void _settingSearchItemList()
  {
    Logger.d("_currentItemList size : ${_currentItemList.length}, pageIngResultList Size : ${_searchListPagingResult!.list.length}");
    _currentItemList.addAll(_searchListPagingResult!.list);
    context.read<SearchItemListCubit>().setSearchContentsList(false, _currentItemList);
  }

  void _initData()
  {
    _requestPagePosition = 1;
    _currentItemList.clear();
    _currentKeyword = "";
    _searchListPagingResult = null;
  }

  void _clearData()
  {
    _requestPagePosition = 1;
    _currentItemList.clear();
    _searchListPagingResult = null;
  }

  void _requestSearchList()
  {
    if(_searchListPagingResult != null)
    {
      if(_searchListPagingResult!.isLastPage())
        {
          CommonUtils.getInstance(context).showErrorMessage(getIt<FoxschoolLocalization>().data['message_last_page']);
          return;
        }
      else
        {
          _requestPagePosition = _searchListPagingResult!.getCurrentPageIndex() + 1;
        }
    }

    BlocProvider.of<SearchContentsBloc>(context).add(
      SearchContentsListEvent(
          type: _getSearchTypeText(_currentSearchType),
          keyword: _currentKeyword,
          currentPage: _requestPagePosition.toString()
      )
    );
  }

  String _getSearchTypeText(SearchType type)
  {
    switch(type)
    {
      case SearchType.ALL:
        return Common.CONTENT_TYPE_ALL;
      case SearchType.STORY:
        return Common.CONTENT_TYPE_STORY;
      default:
        return Common.CONTENT_TYPE_SONG;
    }
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
        break;
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
          BlocProvider.of<SearchContentsBloc>(context).add(
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

  void onClickSearchType(SearchType type)
  {
    if(_currentSearchType == type)
      {
        return;
      }
    _currentSearchType = type;
    context.read<SearchTypeCubit>().setSearchType(_currentSearchType);
    if(_currentKeyword != "")
      {
        _clearData();
        context.read<SearchItemListCubit>().setSearchContentsList(false, _currentItemList);
        _requestSearchList();
      }
  }

  void onClickSearchExecute(String keyword)
  {
    Logger.d("keyword : ${keyword}");
    if(keyword.trim().length < 2)
      {
        CommonUtils.getInstance(context).showErrorMessage(
          getIt<FoxschoolLocalization>().data['message_warning_search_input_2_or_more']
        );
        return;
      }
    _clearData();
    context.read<SearchItemListCubit>().setSearchContentsList(false, _currentItemList);
    _currentKeyword = keyword;
    _requestSearchList();
  }

  void onClickThumbnailItem(int index)
  {
    Logger.d("index : $index");
    List<ContentsBaseResult> list = [];
    list.add(_currentItemList[index]);
    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)));
  }

  void onClickOption(int index)
  {
    BottomContentDialog.showBottomContentItemDialog(
        context: context,
        data: _currentItemList[index],
        onItemTypeSelected: (type) async{

          Navigator.of(context).pop();

          await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORT), () {
            _goToNavigateScreen(type,  _currentItemList[index]);
          },);
        },);
  }

  void onFetchData()
  {
    Logger.d("isRequestLoading : ${isRequestLoading}");
    if(isRequestLoading)
      {
        return;
      }
    _requestSearchList();
  }


}