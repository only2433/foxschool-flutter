

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/data/FlashcardAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'FlashcardAPINotifier.g.dart';
@riverpod
class FlashcardAPINotifier extends _$FlashcardAPINotifier with BlocException
{
  late FoxSchoolRepository _repository;
  @override
  FlashcardAPIState build(FoxSchoolRepository repo) {
    _repository = repo;
    return const FlashcardAPIState.common(CommonAPIState.initState());
  }

  void requestVocabularyContentsList(String contentsID) async
  {
    try {
      state = const FlashcardAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await _repository.vocabularyContentsListAsync(contentsID);
      Logcats.message("response : ${response.toString()}");

      if (response.status == Common.SUCCESS_CODE_OK) {
        if (response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
        Logcats.message("result : ${result.toString()}");
        state = FlashcardAPIState.vocabularyDataLoadedState(result);
      }
      else {
        state = FlashcardAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch (e) {
      processRequestException(e.response.toString());
    }
  }

  void requestAddVocabularyContents(String contentsID, String vocabularyID, List<VocabularyDataResult> list) async
  {
    try
    {
      state = const FlashcardAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await _repository.addMyVocabularyContentsAsync(contentsID, vocabularyID, list);
      Logcats.message("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        Logcats.message("result : ${result.toString()}");
        state = FlashcardAPIState.addVocabularyContents(result);
      }
      else
      {
        state = FlashcardAPIState.common(
          CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

}