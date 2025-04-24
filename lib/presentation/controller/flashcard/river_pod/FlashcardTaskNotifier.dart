

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/data/FlashcardTaskState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'FlashcardTaskNotifier.g.dart';
@riverpod
class FlashcardTaskNotifier extends _$FlashcardTaskNotifier
{
  @override
  FlashcardTaskState build() {
    return FlashcardTaskState(
        currentStudyPage: 0,
        maxStudyPage: 0
    );
  }

  void setCurrentStatus(int currentPage, int totalStudyPage)
  {
    state = state.copyWith(
      currentStudyPage: currentPage,
      maxStudyPage: totalStudyPage
    );
  }
}