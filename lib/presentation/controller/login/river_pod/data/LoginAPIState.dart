

import 'package:foxschool/data/model/login/LoginInformationResult.dart';
import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'LoginAPIState.freezed.dart';


@freezed
abstract class LoginAPIState with _$LoginAPIState
{
  const factory LoginAPIState.common(CommonAPIState state) = _Common;
  const factory LoginAPIState.schoolDataLoadedState(List<SchoolData> list) = _SchoolDataLoadedState;
  const factory LoginAPIState.loginLoadedState(LoginInformationResult data) = _LoginLoadedState;
}