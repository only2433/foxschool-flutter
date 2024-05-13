
import 'package:equatable/equatable.dart';

class  QuizRemainTimeState extends Equatable
{
  final String time;
  QuizRemainTimeState({
    required this.time
  });

  @override
  List<Object?> get props => [time];
}