import 'package:equatable/equatable.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BlocState extends Equatable
{
  const BlocState();
}

class InitState extends BlocState {

  @override
  List<Object?> get props => [];
}

class LoadingState extends BlocState {

  @override
  List<Object?> get props => [];
}

class ErrorState extends BlocState{
  final String message;

  const ErrorState({
    required this.message
  });

  @override
  List<Object> get props => [message];
}