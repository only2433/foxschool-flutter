
import 'package:equatable/equatable.dart';

abstract class MoviePlayerBaseState extends Equatable
{
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviePlayerBaseState {}

class PlayCompleteState extends MoviePlayerBaseState {}
