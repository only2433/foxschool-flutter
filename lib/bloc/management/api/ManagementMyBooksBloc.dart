
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/management/ManagementMyBooksFactoryController.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksBookshelfCreateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksBookshelfDeleteEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyCreateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyDeleteEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyUpdateEvent.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksBookshelfCreateState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksBookshelfDeleteState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksBookshelfUpdateState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyCreateState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyDeleteState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyUpdateState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../../common/Common.dart';
import 'event/MyBooksBookshelfUpdateEvent.dart';

class ManagementMyBooksBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  ManagementMyBooksBloc({
    required this.repository
  }) : super(InitState())
  {
    on<MyBooksVocabularyCreateEvent>(_onCreateVocabulary);
    on<MyBooksVocabularyUpdateEvent>(_onUpdateVocabulary);
    on<MyBooksVocabularyDeleteEvent>(_onDeleteVocabulary);

    on<MyBooksBookshelfCreateEvent>(_onCreateBookshelf);
    on<MyBooksBookshelfUpdateEvent>(_onUpdateBookshelf);
    on<MyBooksBookshelfDeleteEvent>(_onDeleteBookshelf);

  }

  void _onCreateBookshelf(MyBooksBookshelfCreateEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.createBookshelfAsync(event.name, event.color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        Logger.d('result : ${result.toString()}');
        emit(MyBooksBookshelfCreateState(data: result));
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

  void _onCreateVocabulary(MyBooksVocabularyCreateEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.createVocabularyAsync(event.name, event.color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
          emit(MyBooksVocabularyCreateState(data: result));
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

  void _onUpdateBookshelf(MyBooksBookshelfUpdateEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.updateBookshelfAsync(event.bookshelfID, event.name, event.color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        emit(MyBooksBookshelfUpdateState(data: result));
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

  void _onUpdateVocabulary(MyBooksVocabularyUpdateEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.updateVocabularyAsync(event.vocabularyID, event.name, event.color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        emit(MyBooksVocabularyUpdateState(data: result));
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

  void _onDeleteBookshelf(MyBooksBookshelfDeleteEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.deleteBookshelfAsync(event.bookshelfID);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        emit(const MyBooksBookshelfDeleteState());
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

  void _onDeleteVocabulary(MyBooksVocabularyDeleteEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.deleteVocabularyAsync(event.vocabularyID);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        emit(const MyBooksVocabularyDeleteState());
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