import 'package:equatable/equatable.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BlocState
{
  const BlocState();
}

class InitState extends BlocState {
}

class LoadingState extends BlocState {

}

class SearchListLoadingState extends BlocState
{

}

class AuthenticationErrorState extends BlocState
{
  final bool isAutoRestart;
  final String message;
  const AuthenticationErrorState({
    required this.isAutoRestart,
    required this.message
  });
}

class ErrorState extends BlocState{
  final String message;

  const ErrorState({
    required this.message
  });
}