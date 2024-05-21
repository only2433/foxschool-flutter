
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

  @override
  List<Object?> get props => [pictureQuizSelectIndex, textQuizSelectIndex, isCorrect];
}