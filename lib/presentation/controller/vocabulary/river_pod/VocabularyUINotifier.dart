

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/presentation/controller/vocabulary/river_pod/data/VocabularyUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'VocabularyUINotifier.g.dart';

@riverpod
class VocabularyUINotifier extends _$VocabularyUINotifier {
  @override
  VocabularyUIState build() {
    return VocabularyUIState(
        isContentsLoading: false,
        itemList: [],
        intervalIndex: 0,
        isHaveSelectedItem: false,
        selectItemCount: 0,
        enableStudyTypeAll: true,
        enableStudyTypeWord: true,
        enableStudyTypeMean: true,
        enableStudyTypeExample: true,
        isPlaying: false);
  }

  void enableContentsLoading(bool isEnable) {
    state = state.copyWith(
        isContentsLoading: isEnable
    );
  }

  void notifyVocabularyItemList(List<VocabularyDataResult> list) {
    state = state.copyWith(
        itemList: list
    );
  }

  void setPlayIntervalIndex(int index) {
    state = state.copyWith(
        intervalIndex: index
    );
  }

  void enableHaveSelectedItem(bool isSelected)
  {
    state = state.copyWith(
      isHaveSelectedItem: isSelected
    );
  }

  void setSelectItemCount(int count)
  {
    state = state.copyWith(
      selectItemCount: count
    );
  }

  void setPlayType({
    required bool isSelectAll ,
    required bool isSelectWord,
    required bool isSelectMean,
    required bool isSelectExample
})
  {
    state = state.copyWith(
      enableStudyTypeAll: isSelectAll,
      enableStudyTypeWord: isSelectWord,
      enableStudyTypeMean: isSelectMean,
      enableStudyTypeExample: isSelectExample
    );
  }

  void enablePlay(bool isEnable)
  {
    state = state.copyWith(
      isPlaying: isEnable
    );
  }

}