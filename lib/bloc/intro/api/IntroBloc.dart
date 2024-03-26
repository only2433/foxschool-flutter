
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/api/state/AuthMeLoadedState.dart';
import 'package:foxschool/bloc/intro/api/state/MainInformationLoadedState.dart';
import 'package:foxschool/bloc/intro/api/state/VersionLoadedState.dart';

import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/login/LoginInformationResult.dart';
import 'package:foxschool/data/main/main_story_infomation/MainStoryInformationResult.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:foxschool/data/school_data/SchoolData.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import '../../../common/Common.dart';
import '../../../data/main/MainInformationResult.dart';
import '../../base/BlocEvent.dart';
import '../../base/BlocState.dart';
import 'event/AuthMeEvent.dart';
import 'event/GetVersionEvent.dart';
import 'event/MainInformationEvent.dart';



class IntroBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  IntroBloc({
    required this.repository
  }) : super(InitState())
  {
    on<GetVersionEvent>(_onGetVersion);
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



  void _onAuthMeData(AuthMeEvent event, Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.authMe();
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "") {
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          }
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

  void _onMainInformationData(MainInformationEvent event, Emitter<BlocState> emit) async
  {
    try {
      emit(LoadingState());
      BaseResponse response = await repository.mainInformation();
      Logger.d("response : ${response.data.toString()}");
      if (response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
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