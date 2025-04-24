

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataResult.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/data/FlashcardUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'FlashcardUINotifier.g.dart';

@riverpod
class FlashcardUINotifier extends _$FlashcardUINotifier
{
  @override
  FlashcardUIState build() {
    return FlashcardUIState(
        pageList: [],
        isAutoMode: false,
        isShuffleMode: false,
        isBookmarked: false,
        isShowHelpPage: false,
        flashcardItemList: []
    );
  }

  void setScreenWidgetList(List<Widget> list)
  {
    state = state.copyWith(
      pageList: list
    );
  }

  void setAutoMode(bool isEnable)
  {
    state = state.copyWith(
      isAutoMode: isEnable
    );
  }

  void setShuffleMode(bool isEnable)
  {
    state = state.copyWith(
      isShuffleMode: isEnable
    );
  }

  void setBookmarkPlayMode(bool isEnable)
  {
    state = state.copyWith(
      isBookmarked: isEnable
    );
  }

  void showHelpPage(bool isEnable)
  {
    state = state.copyWith(
      isShowHelpPage: isEnable
    );
  }

  void notifyStudyFlashcardList(List<FlashcardDataResult> list)
  {
    state = state.copyWith(
        flashcardItemList: list
    );
  }
}