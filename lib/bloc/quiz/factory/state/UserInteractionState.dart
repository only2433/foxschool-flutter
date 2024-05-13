
import 'package:equatable/equatable.dart';

class UserInteractionState extends Equatable
{
  final int pictureQuizSelectIndex;
  final int textQuizSelectIndex;
  final bool isCorrect;
  final bool isSelectedComplete;
  UserInteractionState({
    required this.pictureQuizSelectIndex,
    required this.textQuizSelectIndex,
    required this.isCorrect,
    required this.isSelectedComplete
  });

  @override
  List<Object?> get props => [pictureQuizSelectIndex, textQuizSelectIndex, isCorrect];
}