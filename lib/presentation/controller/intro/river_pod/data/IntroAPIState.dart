
import 'package:foxschool/data/model/login/LoginInformationResult.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/data/model/version_data_result/VersionDataResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'IntroAPIState.freezed.dart';

@freezed
abstract class IntroAPIState with _$IntroAPIState
{
  const factory IntroAPIState.common(CommonAPIState state) = _Common;
  const factory IntroAPIState.versionLoadedState(VersionDataResult data) = _VersionLoadedState;
  const factory IntroAPIState.authMeLoadedState(LoginInformationResult data) = _AuthMeLoadedState;
  const factory IntroAPIState.mainLoadedState(MainInformationResult data) = _MainLoadedState;
}