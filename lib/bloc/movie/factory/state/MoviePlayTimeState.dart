
import 'package:equatable/equatable.dart';

class MoviePlayTimeState extends Equatable
{
  final String currentTime;
  final String totalTime;
  const MoviePlayTimeState({
    required this.currentTime,
    required this.totalTime
  });

  @override
  List<Object> get props => [currentTime, totalTime];
}