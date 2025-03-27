

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/data/QuizTaskState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'QuizTaskNotifier.g.dart';

@riverpod
class QuizTaskNotifier extends _$QuizTaskNotifier
{
  @override
  QuizTaskState build() {
    return QuizTaskState(
        remainTimeText: "00:00");
  }

  void setRemainTime(String time)
  {
    state = state.copyWith(
        remainTimeText: time
    );
  }
}