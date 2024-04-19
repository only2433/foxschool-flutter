import 'package:equatable/equatable.dart';

class MoviePlayCompleteState extends Equatable
{
  final bool isComplete;
  MoviePlayCompleteState({
    required this.isComplete
  });
  @override
  List<Object?> get props => [isComplete];

}