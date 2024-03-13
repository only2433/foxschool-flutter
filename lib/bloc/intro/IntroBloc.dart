
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/event/AuthMeEvent.dart';
import 'package:foxschool/bloc/intro/event/GetSchoolDataEvent.dart';
import 'package:foxschool/bloc/intro/event/LoginEvent.dart';
import 'package:foxschool/bloc/intro/event/MainInformationEvent.dart';
import 'package:foxschool/bloc/intro/state/AuthMeLoadedState.dart';
import 'package:foxschool/bloc/intro/state/LoginLoadedState.dart';
import 'package:foxschool/bloc/intro/state/MainInformationLoadedState.dart';
import 'package:foxschool/bloc/intro/state/SchoolDataLoadedState.dart';
import 'package:foxschool/bloc/intro/state/VersionLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/login/LoginInformationResult.dart';
import 'package:foxschool/data/main/main_story_infomation/MainInformationResult.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:foxschool/data/school_data/SchoolData.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../api/remote_intro/IntroRepository.dart';
import '../../common/Common.dart';
import '../base/BlocEvent.dart';
import '../base/BlocState.dart';
import 'event/GetVersionEvent.dart';


class IntroBloc extends Bloc<BlocEvent, BlocState>
{
  final IntroRepository repository;
  IntroBloc({
    required this.repository
  }) : super(InitState())
  {
    on<GetVersionEvent>(_onGetVersion);
    on<GetSchoolDataEvent>(_onGetSchoolData);
    on<LoginEvent>(_onLoginData);
    on<AuthMeEvent>(_onAuthMeData);
    on<MainInformationEvent>(_onMainInformationData);
  }

  void _onGetVersion(GetVersionEvent event , Emitter<BlocState> emit) async
  {
    Logger.d("");
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.getVersion(event.deviceType, event.pushAddress, event.pushOn);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        VersionDataResult result = VersionDataResult.fromJson(response.data);
        emit(VersionLoadedState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }
    catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
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
        Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
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

  void _onLoginData(LoginEvent event,  Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.login(event.loginID, event.password, event.schoolCode);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
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

  void _onAuthMeData(AuthMeEvent event, Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.authMe();
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          LoginInformationResult data = LoginInformationResult.fromJson(response.data);
          emit(AuthMeLoadedState(data: data));
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

  void _onMainInformationData(MainInformationEvent event, Emitter<BlocState> state) async
  {
    try {
      emit(LoadingState());
      BaseResponse response = await repository.mainInformation();
      if (response.status == Common.SUCCESS_CODE_OK)
      {
        Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        MainInformationResult data = MainInformationResult.fromJson(response.data);
        emit(MainInformationLoadedState(data: data));
      }
      else {
        emit(ErrorState(message: response.message));
      }
    }
    catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

}