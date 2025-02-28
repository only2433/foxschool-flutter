

import 'package:foxschool/data/model/login/LoginInformationResult.dart';
import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'LoginAPIState.freezed.dart';


@freezed
abstract class LoginAPIState with _$LoginAPIState
{
  const factory LoginAPIState.initialState() = _InitialState;
  const factory LoginAPIState.loadingState() = _LoadingState;
  const factory LoginAPIState.errorState(String message) = _ErrorState;
  const factory LoginAPIState.schoolDataLoadedState(List<SchoolData> list) = _SchoolDataLoadedState;
  const factory LoginAPIState.loginLoadedState(LoginInformationResult data) = _LoginLoadedState;
}