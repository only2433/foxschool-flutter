
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/login/api/state/LoginLoadedState.dart';
import 'package:foxschool/bloc/login/api/state/SchoolDataLoadedState.dart';

import '../../../api/remote_intro/FoxSchoolRepository.dart';
import '../../../common/Common.dart';
import '../../../data/base/BaseResponse.dart';
import '../../../data/login/LoginInformationResult.dart';
import '../../../data/school_data/SchoolData.dart';

import 'package:foxschool/common/Preference.dart' as Preference;

import 'event/GetSchoolDataEvent.dart';
import 'event/LoginEvent.dart';

class LoginBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  LoginBloc({
    required this.repository
  }) : super(InitState())
  {
    on<GetSchoolDataEvent>(_onGetSchoolData);
    on<LoginEvent>(_onGetLoginData);
  }

  void _onGetSchoolData(GetSchoolDataEvent event, Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.getSchoolList();
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        List<SchoolData> result = (response.data as List<dynamic>).map((item) => SchoolData.fromJson(item)).toList();
        Logger.d("result : ${result.toString()}");
        emit(SchoolDataLoadedState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

  void _onGetLoginData(LoginEvent event,  Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.login(event.loginID, event.password, event.schoolCode);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        LoginInformationResult result = LoginInformationResult.fromJson(response.data);
        emit(LoginLoadedState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

}