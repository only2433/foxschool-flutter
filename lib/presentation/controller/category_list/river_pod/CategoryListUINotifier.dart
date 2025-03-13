

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
import 'package:foxschool/presentation/controller/category_list/river_pod/data/CategoryListUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'CategoryListUINotifier.g.dart';

@riverpod
class CategoryListUINotifier extends _$CategoryListUINotifier
{
  @override
  CategoryListUIState build() {
    return CategoryListUIState(
        isContentsLoading: false,
        titleColor: Colors.transparent,
        contentsList: []);
  }

  void enableContentLoading(bool isEnable)
  {
    state = state.copyWith(
      isContentsLoading: isEnable
    );
  }

  void setTitleColor(Color color)
  {
    state = state.copyWith(
      titleColor: color
    );
  }

  void notifyCategoryList(List<SeriesInformationResult> list)
  {
    state = state.copyWith(
      contentsList: list
    );
  }
}