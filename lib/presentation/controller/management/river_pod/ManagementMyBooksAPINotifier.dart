
import 'package:dio/dio.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/management/river_pod/data/ManagementMybooksAPIState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ManagementMyBooksAPINotifier.g.dart';

@riverpod
class ManagementMyBooksAPINotifier extends _$ManagementMyBooksAPINotifier with BlocException
{
  late FoxSchoolRepository repository;
  @override
  ManagementMybooksAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return ManagementMybooksAPIState.common(
        CommonAPIState.initState()
    );
  }


  void requestCreateBookshelf(String name, String color) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.createBookshelfAsync(name, color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        Logger.d('result : ${result.toString()}');
        state = ManagementMybooksAPIState.createBookshelf(result);
      }
      else
      {
        state = ManagementMybooksAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }

    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

  void requestCreateVocabulary(String name, String color) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.createVocabularyAsync(name, color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        state = ManagementMybooksAPIState.createVocabulary(result);
      }
      else
      {
        state = ManagementMybooksAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }

    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

  void requestUpdateBookshelf(String bookshelfID, String name, String color) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.updateBookshelfAsync(bookshelfID, name, color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        state = ManagementMybooksAPIState.updateBookshelf(result);
      }
      else
      {
        state = ManagementMybooksAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

  void requestUpdateVocabulary(String vocabularyID, String name, String color) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.updateVocabularyAsync(vocabularyID, name, color);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyVocabularyResult result = MyVocabularyResult.fromJson(response.data);
        state = ManagementMybooksAPIState.updateVocabulary(result);
      }
      else
      {
        state = ManagementMybooksAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      processRequestException( e.response.toString());
    }
  }

  void requestDeleteBookshelf(String bookshelfID) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.deleteBookshelfAsync(bookshelfID);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        state = ManagementMybooksAPIState.deleteBookshelf();
      }
      else
      {
        state = ManagementMybooksAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      processRequestException( e.response.toString());
    }
  }

  void requestDeleteVocabulary(String vocabularyID) async
  {
    try
    {
      state = ManagementMybooksAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.deleteVocabularyAsync(vocabularyID);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        state = ManagementMybooksAPIState.deleteVocabulary();
      }
      else
      {
        state = ManagementMybooksAPIState.common(
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