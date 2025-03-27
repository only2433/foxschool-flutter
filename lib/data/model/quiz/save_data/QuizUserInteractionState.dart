
import 'package:equatable/equatable.dart';

class QuizUserInteractionState extends Equatable
{
  final int pictureQuizSelectIndex;
  final int textQuizSelectIndex;
  final bool isCorrect;
  final bool isSelectedComplete;
  QuizUserInteractionState({
    required this.pictureQuizSelectIndex,
    required this.textQuizSelectIndex,
    required this.isCorrect,
    required this.isSelectedComplete
  });

  QuizUserInteractionState.init(): this(
    pictureQuizSelectIndex: -1,
    textQuizSelectIndex: -1,
    isCorrect: false,
    isSelectedComplete: false
  );

  @override
  List<Object?> get props => [pictureQuizSelectIndex, textQuizSelectIndex, isCorrect];
}