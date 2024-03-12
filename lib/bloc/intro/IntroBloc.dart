import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/event/GetSchoolDataEvent.dart';
import 'package:foxschool/bloc/intro/event/LoginEvent.dart';
import 'package:foxschool/bloc/intro/state/LoginLoadedState.dart';
import 'package:foxschool/bloc/intro/state/SchoolDataLoadedState.dart';
import 'package:foxschool/bloc/intro/state/VersionLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/login/LoginInformationResult.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:foxschool/data/school_data/SchoolData.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';

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