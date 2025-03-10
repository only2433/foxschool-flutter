

import 'package:freezed_annotation/freezed_annotation.dart';
part 'CommonAPIState.freezed.dart';

@freezed
abstract class CommonAPIState with _$CommonAPIState
{
  const factory CommonAPIState.initState() = _InitState;
  const factory CommonAPIState.loadingState() = _LoadingState;
  const factory CommonAPIState.errorState(String message) = _ErrorState;
  const factory CommonAPIState.authenticationErrorState(bool isAutoRestart, String message) = _AuthenticationErrorState;
}