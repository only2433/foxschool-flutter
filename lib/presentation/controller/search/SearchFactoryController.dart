

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/movie/intent_data/PlayerIntentParamsObject.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/enum/SearchItemLoadType.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/controller/search/river_pod/SearchAPINotifier.dart';
import 'package:foxschool/presentation/controller/search/river_pod/SearchUINotifier.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/SeriesListUINotifier.dart';
import 'package:foxschool/presentation/view/screen/MoviePlayerScreen.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/search/SearchListPagingResult.dart';
import 'package:foxschool/data/model/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/presentation/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/view/screen/QuizScreen.dart';
import 'package:foxschool/presentation/view/screen/VocabularyScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/EbookScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameCrosswordScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/GameStarwordsScreen.dart';
import 'package:foxschool/presentation/view/screen/webview/TranslateScreen.dart';


class SearchFactoryController extends BlocController
{
  late MainInformationResult _mainData;
  late SearchAPINotifierProvider _repositoryProvider;
  SearchListPagingResult? _searchListPagingResult;
  final List<ContentsBaseResult> _currentItemList = [];
  SearchType _currentSearchType = SearchType.ALL;
  String _currentKeyword = "";
  int _requestPagePosition = 1;
  bool isRequestLoading = false;

  final BuildContext context;
  final WidgetRef widgetRef;
  SearchFactoryController({
    required this.context,
    required this.widgetRef
  });

  @override
  void init() async
  {
    _repositoryProvider = searchAPINotifierProvider(getIt<FoxSchoolRepository>());
    _initData();
    _settingRequestDataNotifier();
    await _getMainData();
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
                  if(_searchListPagingResult != null)
                  {
                    widgetRef.read(searchUINotifierProvider.notifier).updateItemLoadType(SearchItemLoadType.DEFAULT);
                  }
                  else
                  {
                    widgetRef.read(searchUINotifierProvider.notifier).updateLoadTypeAndItemList(
                        SearchItemLoadType.PAGING_LIST_COMPLETE,
                        _currentItemList);
                  }
                  CommonUtils.getInstance(context).showErrorMessage(message);
                  isRequestLoading = false;
                }, 
                authenticationErrorState: (isRestart, message) async{
                  if(isRestart == false)
                  {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );
                },
                orElse: (){}
                );
          }, 
          contentsLoadingState: (){
            if(_searchListPagingResult != null)
            {
              widgetRef.read(searchUINotifierProvider.notifier).updateLoadTypeAndItemList(
                  SearchItemLoadType.PAGING_LIST_LOADING,
                  _currentItemList);
            }
            else
            {
              widgetRef.read(searchUINotifierProvider.notifier).updateItemLoadType(SearchItemLoadType.INIT);
            }
            isRequestLoading = true;
          }, 
          contentsLoadedState: (data) async{
            _searchListPagingResult = data;
            await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG), (){
              _settingSearchItemList();
            });
            isRequestLoading = false;
          }, 
          bookshelfContentsAddState: (data) async{
           
            await _updateBookshelfData(data);
            widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
                MyBooksType.BOOKSHELF,
                _mainData.bookshelfList,
                _mainData.vocabularyList);
            MainObserver().update();
            LoadingDialog.dismiss(context);
            Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_save_contents_in_bookshelf']);
          });
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
    Logcats.message("_currentItemList size : ${_currentItemList.length}, pageIngResultList Size : ${_searchListPagingResult!.list.length}");
    _currentItemList.addAll(_searchListPagingResult!.list);
    widgetRef.read(searchUINotifierProvider.notifier).updateLoadTypeAndItemList(
        SearchItemLoadType.PAGING_LIST_COMPLETE,
        _currentItemList);
  }

  void _initData() async
  {
    _requestPagePosition = 1;
    _currentItemList.clear();
    _currentKeyword = "";
    _searchListPagingResult = null;

    Future.delayed(Duration.zero, (){
      widgetRef.read(searchUINotifierProvider.notifier).updateSearchType(SearchType.ALL);
      widgetRef.read(searchUINotifierProvider.notifier).updateItemLoadType(SearchItemLoadType.DEFAULT);
    });
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

    widgetRef.read(_repositoryProvider.notifier).requestSearchContentsData(
        _getSearchTypeText(_currentSearchType),
        _currentKeyword,
        _requestPagePosition.toString());
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

  void onClickSearchType(SearchType type)
  {
    if(_currentSearchType == type)
      {
        return;
      }
    _currentSearchType = type;
    widgetRef.read(searchUINotifierProvider.notifier).updateSearchType(_currentSearchType);
    if(_currentKeyword != "")
      {
        _clearData();
        widgetRef.read(searchUINotifierProvider.notifier).updateLoadTypeAndItemList(
            SearchItemLoadType.PAGING_LIST_COMPLETE,
            _currentItemList);
        _requestSearchList();
      }
  }

  void onClickSearchExecute(String keyword)
  {
    Logcats.message("keyword : $keyword");
    if(keyword.trim().length < 2)
      {
        CommonUtils.getInstance(context).showErrorMessage(
          getIt<FoxschoolLocalization>().data['message_warning_search_input_2_or_more']
        );
        return;
      }
    _clearData();
    widgetRef.read(searchUINotifierProvider.notifier).updateLoadTypeAndItemList(
        SearchItemLoadType.PAGING_LIST_COMPLETE,
        _currentItemList);
    _currentKeyword = keyword;
    _requestSearchList();
  }

  void onClickThumbnailItem(int index)
  {
    Logcats.message("index : $index");
    List<ContentsBaseResult> list = [_currentItemList[index]];
    PlayerIntentParamsObject data = PlayerIntentParamsObject(list: list);

    Navigator.push(context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playerIntentParamsObject: data)
        )
    );
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
    Logcats.message("isRequestLoading : $isRequestLoading");
    if(isRequestLoading)
      {
        return;
      }
    _requestSearchList();
  }


}