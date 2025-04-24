
import 'package:flutter/cupertino.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FlashcardUIState.freezed.dart';

@freezed
class FlashcardUIState with _$FlashcardUIState
{
  factory FlashcardUIState({
    required List<Widget> pageList,
    required bool isAutoMode,
    required bool isShuffleMode,
    required bool isBookmarked,
    required bool isShowHelpPage,
    required List<FlashcardDataResult> flashcardItemList,

  }) = _FlashcardUIState;
}