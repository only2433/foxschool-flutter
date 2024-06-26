
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocException.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/quiz/api/event/QuizInformationEvent.dart';
import 'package:foxschool/bloc/quiz/api/state/QuizInformationLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/data/quiz/QuizInformationResult.dart';
import '../../../common/Common.dart';
import '../../../common/FoxschoolLocalization.dart';
import '../../../di/Dependencies.dart';
import '../../base/BlocEvent.dart';

class QuizInformationBloc extends Bloc<BlocEvent, BlocState> with BlocException
{
  final FoxSchoolRepository repository;
  QuizInformationBloc({
    required this.repository
  }) : super(InitState())
  {
    on<QuizInformationEvent>(_onGetQuizInformationData);
  }

  void _onGetQuizInformationData(QuizInformationEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.quizInformationAsync(event.contentID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
          {
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          }
        }
      QuizInformationResult result = QuizInformationResult.fromJson(response.data);
      emit(QuizInformationLoadedState(data: result));
    }
    on DioException catch(e)
    {
      processException(this, e.response.toString());
    }
  }


}