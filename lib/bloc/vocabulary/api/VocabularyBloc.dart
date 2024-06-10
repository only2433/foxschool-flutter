

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsAddEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsDeleteEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsListEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyContentsAddState.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyContentsDeleteState.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyDataListLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/data/vocabulary/VocabularyDataResult.dart';
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../common/Common.dart';
import '../../base/BlocEvent.dart';
import '../../base/BlocState.dart';
import 'event/VocabularyShelfListEvent.dart';

class VocabularyBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  VocabularyBloc({
    required this.repository
  }) : super(InitState()) {
    on<VocabularyShelfListEvent>(_onVocabularyShelfList);
    on<VocabularyContentsListEvent>(_onVocabularyContentsList);
    on<VocabularyContentsAddEvent>(_onAddVocabularyContents);
    on<VocabularyContentsDeleteEvent>(_onDeleteVocabularyContents);
  }


  void _onVocabularyShelfList(VocabularyShelfListEvent event, Emitter<BlocState> state) async
  {
    try
    {
      BaseResponse response = await repository.vocabularyShelfListAsync(event.vocabularyID);
      Logger.d("response : ${response.toString()}");

      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
          Logger.d("result : ${result.toString()}");
          emit(VocabularyDataListLoadedState(data: result));
        }
      else
        {
          emit(ErrorState(message: response.message));
        }
    }
    catch(e)
    {
      Logger.d("error : ${e.toString()}");
      emit(ErrorState(message: e.toString()));
    }
  }


  void _onVocabularyContentsList(VocabularyContentsListEvent event, Emitter<BlocState> state) async
  {
    try
    {
      BaseResponse response = await repository.vocabularyContentsListAsync(event.contentID);
      Logger.d("response : ${response.toString()}");

      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
          {
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          }
        List<VocabularyDataResult> result = (response.data as List<dynamic>).map((item) => VocabularyDataResult.fromJson(item)).toList();
        Logger.d("result : ${result.toString()}");
        emit(VocabularyDataListLoadedState(data: result));
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

  void _onAddVocabularyContents(VocabularyContentsAddEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.addVocabularyContents(event.contentID, event.vocabularyID, event.list);
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
    catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

  void _onDeleteVocabularyContents(VocabularyContentsDeleteEvent event,  Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.deleteVocabularyContents(event.vocabularyID, event.data);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          emit(const VocabularyContentsDeleteState());
        }
      else
        {
          emit(ErrorState(message: response.message));
        }
    }
    catch(e)
    {
      emit(ErrorState(message: e.toString()
      ));
    }
  }

}