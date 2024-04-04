
import 'package:equatable/equatable.dart';

abstract class SearchListBaseState extends Equatable
{
  const SearchListBaseState();
  @override
  List<Object> get props => [];
}

class InitState extends SearchListBaseState {}

class LoadingState extends SearchListBaseState {}

class ErrorState extends SearchListBaseState
{
  final String message;
  const ErrorState({
   required this.message
  });
  @override
  List<Object> get props => [message];
}


