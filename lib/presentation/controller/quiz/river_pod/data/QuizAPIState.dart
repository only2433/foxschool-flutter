

import 'package:foxschool/data/model/quiz/QuizInformationResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuizAPIState.freezed.dart';

@freezed
abstract class QuizAPIState with _$QuizAPIState
{
  const factory QuizAPIState.common(CommonAPIState state) = _Common;
  const factory QuizAPIState.contentsLoadedState(QuizInformationResult data) = _ContentsLoadedState;
  const factory QuizAPIState.saveQuizSuccessState() = _SaveQuizSuccessState;
}