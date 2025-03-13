
import 'package:flutter/material.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'CategoryListUIState.freezed.dart';

@freezed
class CategoryListUIState with _$CategoryListUIState
{
  factory CategoryListUIState({
    required bool isContentsLoading,
    required Color titleColor,
    required List<SeriesInformationResult> contentsList
  }) = _CategoryListUIState;
}