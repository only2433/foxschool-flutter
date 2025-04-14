
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/data/SeriesListUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SeriesListUINotifier.g.dart';

@riverpod
class SeriesListUINotifier extends _$SeriesListUINotifier
{
  @override
  SeriesListUIState build() {
    return SeriesListUIState(
        isContentsLoading: false,
        titleColor: Colors.transparent,
        seriesColor: "",
        isFullName: false,
        itemList: [],
        selectItemCount: 0,
        isEnableBottomSelectView: false);
  }

  void updateContentsLoadingState({required bool isDataLoading})
  {
    state = state.copyWith(
      isContentsLoading: isDataLoading
    );
  }

  void setTitleColor(Color color)
  {
    state = state.copyWith(
      titleColor: color
    );
  }

  void notifySeriesItemList(String color, bool isEnable, List<ContentsBaseResult> list)
  {
    state = state.copyWith(
      isContentsLoading: false,
      seriesColor: color,
      isFullName: isEnable,
        itemList: list
    );
  }

  void setSelectItemCount(int count)
  {
    state = state.copyWith(
        selectItemCount: count
    );
  }

  void enableBottomSelectView(bool isEnable)
  {
    state = state.copyWith(
      isEnableBottomSelectView: isEnable
    );
  }

}