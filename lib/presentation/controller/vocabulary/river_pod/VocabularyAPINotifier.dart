
import 'package:dio/dio.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/vocabulary/river_pod/data/VocabularyAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'VocabularyAPINotifier.g.dart';

@riverpod
class VocabularyAPINotifier extends _$VocabularyAPINotifier with BlocException
{
  late FoxSchoolRepository repository;
  @override
  VocabularyAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return VocabularyAPIState.common(CommonAPIState.initState());
  }

  void requestVocabularyMyBooksList(String vocabularyID) async
  {
    try
    {
      BaseResponse response = await repository.vocabularyShelfListAsync(vocabularyID);
      Logger.d("response : ${response.toString()}");

      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
        Logger.d("result : ${result.toString()}");
        state = VocabularyAPIState.vocabularyContentsLoadedState(result);
      }
      else
      {
        state = VocabularyAPIState.common(CommonAPIState.errorState(response.message));
      }
    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = VocabularyAPIState.common(exceptionState);
    }
  }

  void requestVocabularyContentsList(String contentsID) async
  {
    try
    {
      BaseResponse response = await repository.vocabularyContentsListAsync(contentsID);
      Logger.d("response : ${response.toString()}");

      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
        Logger.d("result : ${result.toString()}");
        state = VocabularyAPIState.vocabularyContentsLoadedState(result);
      }
      else
      {
        state = VocabularyAPIState.common(CommonAPIState.errorState(response.message));
      }

    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = VocabularyAPIState.common(exceptionState);
    }
  }

  void requestAddContents(String contentsID, String vocabularyID, List<VocabularyDataResult> list) async
  {
    try
    {
      state = const VocabularyAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await repository.addMyVocabularyContentsAsync(contentsID, vocabularyID, list);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        Logger.d("result : ${result.toString()}");

        state = VocabularyAPIState.addContentsState(result);
      }
      else
      {
        state = VocabularyAPIState.common(CommonAPIState.errorState(response.message));
      }
    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = VocabularyAPIState.common(exceptionState);
    }
  }

  void requestDeleteContents(String vocabularyID, List<VocabularyDataResult> list) async
  {
    try
    {
      state = const VocabularyAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await repository.deleteMyVocabularyContentsAsync(vocabularyID, list);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        state = const VocabularyAPIState.deleteContentsState();
      }
      else
      {
        state = VocabularyAPIState.common(CommonAPIState.errorState(response.message));
      }
    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = VocabularyAPIState.common(exceptionState);
    }
  }

}