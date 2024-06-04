

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/vocabulary/api/event/AddVocabularyContentsEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyDataListEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/state/AddVocabularyContentsLoadedState.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyDataListLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/data/vocabulary/VocabularyDataResult.dart';
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../common/Common.dart';
import '../../base/BlocEvent.dart';
import '../../base/BlocState.dart';

class VocabularyBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  VocabularyBloc({
    required this.repository
  }) : super(InitState()) {
    on<VocabularyDataListEvent>(_onVocabularyDataList);
    on<AddVocabularyContentsEvent>(_onAddVocabularyContents);
  }

  void _onVocabularyDataList(VocabularyDataListEvent event, Emitter<BlocState> state) async
  {
    try
    {
      BaseResponse response = await repository.vocabularyDataListAsync(event.contentID);
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

  void _onAddVocabularyContents(AddVocabularyContentsEvent event, Emitter<BlocState> state) async
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
          emit(AddVocabularyContentsLoadedState(data: result));
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

}