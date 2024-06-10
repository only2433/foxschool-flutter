

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/search/api/SearchContentsBloc.dart';
import 'package:foxschool/bloc/search/api/event/SearchContentsListEvent.dart';
import 'package:foxschool/bloc/search/api/state/SearchContentsListLoadedState.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchItemListCubit.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchTypeCubit.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/SearchType.dart';

import '../../common/Common.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../data/search/SearchListPagingResult.dart';
import '../../di/Dependencies.dart';

class SearchContentsListFactoryController extends BlocController
{
  late StreamSubscription _subscription;

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
  void init()
  {
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
        case SearchContentsListLoadedState:
          blocState = state as SearchContentsListLoadedState;
          _searchListPagingResult = blocState.data;
          await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), (){
          _settingSearchItemList();
          });
          isRequestLoading = false;
          break;
        case LoadingState:
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