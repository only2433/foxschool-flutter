
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../common/Common.dart';
import '../../../data/base/BaseResponse.dart';
import '../../../data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../../data/vocabulary/VocabularyDataResult.dart';
import '../../base/BlocException.dart';
import '../../vocabulary/api/event/VocabularyContentsAddEvent.dart';
import '../../vocabulary/api/event/VocabularyContentsListEvent.dart';
import '../../vocabulary/api/state/VocabularyContentsAddState.dart';
import '../../vocabulary/api/state/VocabularyDataListLoadedState.dart';

class FlashcardBloc extends Bloc<BlocEvent, BlocState> with BlocException
{
  final FoxSchoolRepository repository;
  FlashcardBloc({
    required this.repository
  }) : super(InitState())
  {
    on<VocabularyContentsListEvent>(_onGetVocabularyContentsList);
    on<VocabularyContentsAddEvent>(_onAddVocabularyContents);
  }

  void _onGetVocabularyContentsList(VocabularyContentsListEvent event, Emitter<BlocState> state) async
  {
    try {
      emit(LoadingState());
      BaseResponse response = await repository.vocabularyContentsListAsync(event.contentID);
      Logger.d("response : ${response.toString()}");

      if (response.status == Common.SUCCESS_CODE_OK) {
        if (response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
        Logger.d("result : ${result.toString()}");
        emit(VocabularyDataListLoadedState(data: result));
      }
      else {
        emit(ErrorState(message: response.message));
      }
    }
    on DioException catch (e) {
      processException(this, e.response.toString());
    }
  }

  void _onAddVocabularyContents(VocabularyContentsAddEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.addMyVocabularyContentsAsync(event.contentID, event.vocabularyID, event.list);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        Logger.d("result : ${result.toString()}");
        emit(VocabularyContentsAddState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }
    on DioException catch(e)
    {
      processException(this, e.response.toString());
    }
  }

}