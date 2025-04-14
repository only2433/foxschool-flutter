
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
import 'package:foxschool/data/model/main/series/base/SeriesBaseResult.dart';
import 'package:foxschool/data/model/story_category_contents/StoryCategoryContentsResult.dart';
import 'package:foxschool/presentation/controller/category_list/river_pod/CategoryListAPINotifier.dart';
import 'package:foxschool/presentation/controller/category_list/river_pod/CategoryListUINotifier.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/screen/SeriesContentListScreen.dart';

class CategoryListController extends BlocController
{
  late StoryCategoryContentsResult _storyCategoryContentsResult;
  late CategoryListAPINotifierProvider _repositoryProvider;
  final List<SeriesInformationResult> _currentCategoryItemList = [];
  Color _currentTitleColor = Colors.transparent;
  ScrollDirection _currentScrollDirection = ScrollDirection.idle;
  double _lastOffset  = 0.0;

  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;
  final ScrollController scrollController;
  final WidgetRef widgetRef;
  CategoryListController({
    required this.context,
    required this.currentSeriesBaseResult,
    required this.scrollController,
    required this.widgetRef
  });

  @override
  void init() async
  {
    _repositoryProvider = CategoryListAPINotifierProvider(getIt<FoxSchoolRepository>());
    Future.delayed(Duration.zero, (){
      widgetRef.read(categoryListUINotifierProvider.notifier).updateContentsLoadingState(isDataLoading: true);
      widgetRef.read(categoryListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
    });

    _settingRequestDataNotifier();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      widgetRef.read(_repositoryProvider.notifier).requestCategoryListData(currentSeriesBaseResult.id);
    });
    _initScrollerListener();
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state){
            state.maybeWhen(
                errorState: (message){
                  Fluttertoast.showToast(msg: message);
                  onBackPressed();
                },
                orElse: (){}
            );
          },
          contentsLoadedState: (data){
            widgetRef.read(categoryListUINotifierProvider.notifier).updateContentsLoadingState(isDataLoading: false);
            _storyCategoryContentsResult = data;
            _initCategoryList();
          });
    });
  }

  void _initCategoryList()
  {
    Logcats.message("_initCategoryList");
    _currentCategoryItemList.clear();
    _currentCategoryItemList.addAll(_storyCategoryContentsResult.itemList);
    widgetRef.read(categoryListUINotifierProvider.notifier).notifyCategoryList(_currentCategoryItemList);
  }

  void _initScrollerListener()
  {
    scrollController.addListener(() {
      if (_currentScrollDirection != scrollController.position.userScrollDirection) {
        _currentScrollDirection = scrollController.position.userScrollDirection;
        if (_currentScrollDirection == ScrollDirection.forward) {
          Logcats.message("아래로 스크롤");
        }
        else {
          Logcats.message("위로 스크롤");
        }
        _lastOffset = scrollController.offset;
      }
      double currentOffset = _lastOffset - scrollController.offset;


      if (_currentScrollDirection == ScrollDirection.reverse && currentOffset.toInt() <= -60)
      {
        if (_currentTitleColor != AppColors.color_ffffff)
        {
          _currentTitleColor = AppColors.color_ffffff;
          widgetRef.read(categoryListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
        }
      }
      else if (_currentScrollDirection == ScrollDirection.forward && currentOffset.toInt() > 60)
      {
        if (_currentTitleColor != Colors.transparent)
        {
          _currentTitleColor = Colors.transparent;
          widgetRef.read(categoryListUINotifierProvider.notifier).setTitleColor(_currentTitleColor);
        }
      }
    });
  }

  void onClickStorySeriesItem(SeriesInformationResult data, Widget widget)
  {
    Navigator.push(
        context,
        Page.getSeriesDetailListTransition(context, SeriesContentListScreen(seriesBaseResult: data))
    );
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
  }
}