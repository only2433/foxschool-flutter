
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/category_contents_list/api/CategoryContentsDataBloc.dart';
import 'package:foxschool/bloc/category_contents_list/api/state/CategoryContentsLoadedState.dart';
import 'package:foxschool/bloc/category_contents_list/factory/cubit/CategoryItemListCubit.dart';
import 'package:foxschool/common/PageNaviagator.dart' as Page;
import '../../common/Common.dart';
import '../../data/main/series/SeriesInformationResult.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import '../../data/story_category_contents/StoryCategoryContentsResult.dart';
import '../../view/screen/SeriesContentListScreen.dart';
import 'api/event/GetCategoryContentsEvent.dart';

class CategoryContentsListController extends BlocController
{
  late StreamSubscription _subscription;
  late StoryCategoryContentsResult _storyCategoryContentsResult;
  List<SeriesInformationResult> _currentCategoryItemList = [];
  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;
  CategoryContentsListController({
    required this.context,
    required this.currentSeriesBaseResult
  });

  @override
  void init()
  {
    context.read<CategoryItemListCubit>().showLoading();
    _settingSubscription();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      context.read<CategoryContentsDataBloc>().add(
        GetCategoryContentsEvent(displayID: currentSeriesBaseResult.id)
      );
    });

  }

  void _settingSubscription()
  {
    var blocState;
    _subscription = context.read<CategoryContentsDataBloc>().stream.listen((state) async {
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
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _subscription.cancel();

  }

}