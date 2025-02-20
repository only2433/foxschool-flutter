

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/intro/factory/river_pod/data/IntroAPIState.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import '../../../../../common/Common.dart';
import '../../../../../common/FoxschoolLocalization.dart';
import '../../../../../data/model/login/LoginInformationResult.dart';
import '../../../../../data/model/version_data_result/VersionDataResult.dart';
import '../../../../../di/Dependencies.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

class IntroAPINotifier extends Notifier<IntroAPIState>
{
  final FoxSchoolRepository repository;

  IntroAPINotifier({
    required this.repository
  });

  @override
  IntroAPIState build() {
    return const IntroAPIState.initialState();
  }

  void requestVersion(String deviceID, String pushAddress, String pushOn) async
  {
    try
    {
      state = IntroAPIState.loadingState();
      BaseResponse response = await repository.getVersion(deviceID, pushAddress, pushOn);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          VersionDataResult result = VersionDataResult.fromJson(response.data);
          state = IntroAPIState.versionLoadedState(result);
        }
      else
        {
          state = IntroAPIState.errorState(response.message);
        }
    }catch(e)
    {
      state = IntroAPIState.errorState(
          getIt<FoxschoolLocalization>().data['message_waring_error']
      );
    }
  }

  void requestAuthMe() async
  {
    try
    {
      state = IntroAPIState.loadingState();
      BaseResponse response = await repository.authMe();
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          LoginInformationResult result = LoginInformationResult.fromJson(response.data);
          state = IntroAPIState.authMeLoadedState(result);
        }
      else
        {
          state = IntroAPIState.errorState(response.message);
        }
    }
    catch(e)
    {
      state = IntroAPIState.errorState(
          getIt<FoxschoolLocalization>().data['message_waring_error']
      );
    }
  }

  void requestMain() async
  {
    try
    {
      state = IntroAPIState.loadingState();
      BaseResponse response = await repository.mainInformation();
      Logger.d("response : ${response.data.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
          {
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          }
          MainInformationResult result = MainInformationResult.fromJson(response.data);
          state = IntroAPIState.mainLoadedState(result);
        }
      else
        {
          state = IntroAPIState.errorState(response.message);
        }
    }
    catch(e)
    {
      state = IntroAPIState.errorState(getIt<FoxschoolLocalization>().data['message_warning_error']);
    }
  }
}

final introAPIStateProvider = NotifierProvider<IntroAPINotifier, IntroAPIState>(()
{
  return IntroAPINotifier(repository: getIt<FoxSchoolRepository>());
});