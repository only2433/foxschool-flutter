

import 'package:dio/dio.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/quiz/QuizInformationResult.dart';
import 'package:foxschool/data/model/quiz/save_data/QuizStudyRecordData.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/data/QuizAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'QuizAPINotifier.g.dart';

@riverpod
class QuizAPINotifier extends _$QuizAPINotifier with BlocException
{
  late FoxSchoolRepository repository;

  @override
  QuizAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return QuizAPIState.common(CommonAPIState.initState());
  }

  void requestQuizContentsData(String contentsID) async
  {
    try
    {
      BaseResponse response = await repository.quizInformationAsync(contentsID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
      }
      QuizInformationResult result = QuizInformationResult.fromJson(response.data);
      state = QuizAPIState.contentsLoadedState(result);
    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

  void requestSaveQuizRecord(QuizStudyRecordData data, {int homeworkNo = 0}) async
  {
    try
    {
      state = QuizAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await repository.saveQuizRecord(data, homeworkNumber: homeworkNo);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
         if(response.access_token != "")
         {
             await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
         }
         state = const QuizAPIState.saveQuizSuccessState();
      }
    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

}