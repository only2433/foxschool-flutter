

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/quiz/save_data/QuizUserInteractionState.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/data/QuizUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'QuizUINotifier.g.dart';

@riverpod
class QuizUINotifier extends _$QuizUINotifier
{
  @override
  QuizUIState build() {
    return QuizUIState(
        isContentsLoading: false,
        widgetList: [],
        enableTaskbox: false,
        enableAnswerReportButton: true,
        correctCount: 0,
        totalCount: 0,
        userInteractionState: QuizUserInteractionState.init()
    );
  }

  void initData()
  {
    state = state.copyWith(
      isContentsLoading: true,
      enableTaskbox: false,
    );
  }

  void enableContentsLoading(bool isEnable)
  {
    state = state.copyWith(
      isContentsLoading: isEnable
    );
  }

  void setWidgetList(List<Widget> list)
  {
    state = state.copyWith(
        widgetList: list
    );
  }

  void enableTaskBox(bool isEnable)
  {
    state = state.copyWith(
      enableTaskbox: isEnable
    );
  }

  void enableAnswerReportButton(bool isEnable)
  {
    state = state.copyWith(
      enableAnswerReportButton: isEnable
    );
  }

  void setUserAnswerData(int correctUserCount, int totalQuizCount)
  {
    state = state.copyWith(
        correctCount: correctUserCount,
        totalCount: totalQuizCount
    );
  }

  void initUserInteraction()
  {
    state = state.copyWith(
      userInteractionState: QuizUserInteractionState.init()
    );
  }

  void selectPictureQuizItem(int index, bool isCorrect)
  {
    state = state.copyWith(
      userInteractionState: QuizUserInteractionState(
        pictureQuizSelectIndex: index,
        textQuizSelectIndex: -1,
        isCorrect: isCorrect,
        isSelectedComplete: true
      )
    );
  }

  void selectTextQuizItem(int index, bool isCorrect)
  {
    state = state.copyWith(
      userInteractionState: QuizUserInteractionState(
        pictureQuizSelectIndex: -1,
        textQuizSelectIndex: index,
        isCorrect: isCorrect,
        isSelectedComplete: true
      )
    );
  }
}