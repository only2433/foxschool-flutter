

import 'package:flutter/cupertino.dart';
import 'package:foxschool/presentation/bloc/quiz/factory/state/QuizUserInteractionState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuizUIState.freezed.dart';
@freezed
class QuizUIState with _$QuizUIState
{
  factory QuizUIState({
    required bool isContentsLoading,
    required List<Widget> widgetList,
    required bool enableTaskbox,
    required bool enableAnswerReportButton,
    required int correctCount,
    required int totalCount,
    required QuizUserInteractionState userInteractionState
  }) = _QuizUIState;
}
