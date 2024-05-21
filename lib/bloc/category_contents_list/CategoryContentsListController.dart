
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/category_contents_list/api/CategoryContentsDataBloc.dart';
import 'package:foxschool/bloc/category_contents_list/api/state/CategoryContentsLoadedState.dart';
import 'package:foxschool/bloc/category_contents_list/factory/cubit/CategoryItemListCubit.dart';
import 'package:foxschool/bloc/category_contents_list/factory/cubit/CategoryTitleColorCubit.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import '../../common/Common.dart';
import '../../data/main/series/SeriesInformationResult.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import '../../data/story_category_contents/StoryCategoryContentsResult.dart';
import '../../values/AppColors.dart';
import '../../view/screen/SeriesContentListScreen.dart';
import 'api/event/CategoryContentsEvent.dart';

class CategoryContentsListController extends BlocController
{
  late StreamSubscription _subscription;
  late StoryCategoryContentsResult _storyCategoryContentsResult;
  List<SeriesInformationResult> _currentCategoryItemList = [];
  Color _currentTitleColor = Colors.transparent;
  ScrollDirection _currentScrollDirection = ScrollDirection.idle;
  double _lastOffset  = 0.0;

  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;
  final ScrollController scrollController;
  CategoryContentsListController({
    required this.context,
    required this.currentSeriesBaseResult,
    required this.scrollController
  });

  @override
  void init()
  {
    context.read<CategoryItemListCubit>().showLoading();
    context.read<CategoryTitleColorCubit>().setTitleColor(_currentTitleColor);
    _settingSubscription();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      BlocProvider.of<CategoryContentsDataBloc>(context).add(
        CategoryContentsEvent(displayID: currentSeriesBaseResult.id)
      );
    });

    scrollController.addListener(() {
      if (_currentScrollDirection != scrollController.position.userScrollDirection) {
        _currentScrollDirection = scrollController.position.userScrollDirection;
        if (_currentScrollDirection == ScrollDirection.forward) {
          Logger.d("아래로 스크롤");
        }
        else {
          Logger.d("위로 스크롤");
        }
        _lastOffset = scrollController.offset;
      }
      double currentOffset = _lastOffset - scrollController.offset;


      if (_currentScrollDirection == ScrollDirection.reverse && currentOffset.toInt() <= -60) {
        if (_currentTitleColor != AppColors.color_ffffff) {
          _currentTitleColor = AppColors.color_ffffff;
          context.read<CategoryTitleColorCubit>().setTitleColor(_currentTitleColor);
        }
      }
      else if (_currentScrollDirection == ScrollDirection.forward && currentOffset.toInt() > 60) {
        if (_currentTitleColor != Colors.transparent) {
          _currentTitleColor = Colors.transparent;
          context.read<CategoryTitleColorCubit>().setTitleColor(_currentTitleColor);
        }
      }
    });

  }

  void _settingSubscription()
  {
    var blocState;
    _subscription = BlocProvider.of<CategoryContentsDataBloc>(context).stream.listen((state) async {
      switch(state.runtimeType)
      {
        case CategoryContentsLoadedState:
          blocState = state as CategoryContentsLoadedState;
          _storyCategoryContentsResult = blocState.data;
          _initCategoryList();
          break;
      }
    });
  }

  void _initCategoryList()
  {
    _currentCategoryItemList.clear();
    _currentCategoryItemList.addAll(_storyCategoryContentsResult.itemList);
    context.read<CategoryItemListCubit>().setCategoryItemList(_currentCategoryItemList);
  }

  void onClickStorySeriesItem(SeriesInformationResult data, Widget widget)
  {
    Navigator.push(
        context,
        Page.getSeriesDetailListTransition(context, SeriesContentListScreen(seriesBaseResult: data))
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

}