
import 'package:equatable/equatable.dart';

class QuizCorrectCountState extends Equatable
{
  final int correctCount;
  final int totalCount;
  QuizCorrectCountState({
    required this.correctCount,
    required this.totalCount
  });

  @override
  List<Object?> get props => [correctCount, totalCount];

}