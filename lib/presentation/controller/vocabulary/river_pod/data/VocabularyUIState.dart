

import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'VocabularyUIState.freezed.dart';

@freezed
class VocabularyUIState with _$VocabularyUIState
{
  factory VocabularyUIState({
    required bool isContentsLoading,
    required List<VocabularyDataResult> itemList,
    required int intervalIndex,
    required bool isHaveSelectedItem,
    required int selectItemCount,
    required bool enableStudyTypeAll,
    required bool enableStudyTypeWord,
    required bool enableStudyTypeMean,
    required bool enableStudyTypeExample,
    required bool isPlaying
  }) = _VocabularyUIState;
}