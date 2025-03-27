
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuizTaskState.freezed.dart';

@freezed
class QuizTaskState with _$QuizTaskState
{
  factory QuizTaskState({
    required String remainTimeText
  }) = _QuizTaskState;
}