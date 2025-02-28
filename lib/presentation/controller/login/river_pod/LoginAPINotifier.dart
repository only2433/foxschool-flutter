
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/login/LoginInformationResult.dart';
import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/controller/login/river_pod/data/LoginAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'LoginAPINotifier.g.dart';

@riverpod
class LoginAPINotifier extends _$LoginAPINotifier
{
  late FoxSchoolRepository repository;
  @override
  LoginAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return const LoginAPIState.initialState();
  }

  void requestSchoolData() async
  {
    try
    {
       state = LoginAPIState.loadingState();
       BaseResponse response = await repository.getSchoolList();
       Logger.d("response : ${response.toString()}");
       if(response.status == Common.SUCCESS_CODE_OK)
       {
         List<SchoolData> result = (response.data as List<dynamic>).map((item) => SchoolData.fromJson(item)).toList();
         Logger.d("result : ${result.toString()}");
         state = LoginAPIState.schoolDataLoadedState(result);
       }
       else
       {
         state = LoginAPIState.errorState(response.message);
       }
    }catch(e)
    {
      state = LoginAPIState.errorState(e.toString());
    }
  }

  void requestLoginData(String loginID, String password, String schoolCode) async
  {
    try
    {

      state = LoginAPIState.loadingState();
      BaseResponse response = await repository.login(loginID, password, schoolCode);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        LoginInformationResult result = LoginInformationResult.fromJson(response.data);
        state = LoginAPIState.loginLoadedState(result);
      }
      else
      {
        state = LoginAPIState.errorState(response.message);
      }
    }catch(e)
    {
      state = LoginAPIState.errorState(e.toString());
    }
  }

}