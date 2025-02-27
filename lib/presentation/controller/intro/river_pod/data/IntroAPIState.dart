
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/model/login/LoginInformationResult.dart';
import '../../../../../../data/model/main/MainInformationResult.dart';
import '../../../../../../data/model/version_data_result/VersionDataResult.dart';

part 'IntroAPIState.freezed.dart';

@freezed
abstract class IntroAPIState with _$IntroAPIState
{
  const factory IntroAPIState.initialState() = _InitialState;
  const factory IntroAPIState.loadingState() = _LoadingState;
  const factory IntroAPIState.errorState(String message) = _ErrorState;
  const factory IntroAPIState.versionLoadedState(VersionDataResult data) = _VersionLoadedState;
  const factory IntroAPIState.authMeLoadedState(LoginInformationResult data) = _AuthMeLoadedState;
  const factory IntroAPIState.mainLoadedState(MainInformationResult data) = _MainLoadedState;
}