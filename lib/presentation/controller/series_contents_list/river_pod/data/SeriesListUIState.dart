
import 'package:flutter/material.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'SeriesListUIState.freezed.dart';

@freezed
class SeriesListUIState with _$SeriesListUIState
{
  factory SeriesListUIState({
    required bool isContentsLoading,
    required Color titleColor,
    required String seriesColor,
    required bool isFullName,
    required List<ContentsBaseResult> itemList,
    required int selectItemCount,
    required bool isEnableBottomSelectView,
  }) = _SeriesListUIState;
}