import 'package:equatable/equatable.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BlocState extends Equatable
{
  const BlocState();

  @override
  List<Object> get props => [];
}

class InitState extends BlocState {}

class LoadingState extends BlocState {}

class ErrorState extends BlocState{
  final String message;

  ErrorState({
    required this.message
  });

  @override
  List<Object> get props => [this.message];
}