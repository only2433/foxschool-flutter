

import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/enum/SearchItemLoadType.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SearchUIState.freezed.dart';

@freezed
class SearchUIState with _$SearchUIState
{
  factory SearchUIState({
    required SearchType searchType,
    required SearchItemLoadType itemLoadType,
    required List<ContentsBaseResult> contentsList,
  }) = _SearchUIState;
}