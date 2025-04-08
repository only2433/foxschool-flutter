

import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/controller/bookshelf/river_pod/data/BookshelfListAPIState.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/presentation/bloc/base/BlocException.dart';

part 'BookshelfListAPINotifier.g.dart';

@riverpod
class BookshelfListAPINotifier extends _$BookshelfListAPINotifier with BlocException
{
  late FoxSchoolRepository repository;
  @override
  BookshelfListAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return BookshelfListAPIState.common(
        CommonAPIState.initState()
    );
  }

  void requestBookshelfContentsData(String bookshelfID) async
  {
    Logcats.message("---------- API Request");
    try
    {
      BaseResponse response = await repository.bookshelfContentListAsync(bookshelfID);
      Logcats.message('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setObject(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        List<ContentsBaseResult> result = (response.data as List<dynamic>).map((item) => ContentsBaseResult.fromJson(item)).toList();
        state = BookshelfListAPIState.bookshelfContentsLoadedState(result);
      }
      else
      {
        state = BookshelfListAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = BookshelfListAPIState.common(exceptionState);
    }
  }

  void requestDeleteBookshelfContents(String bookshelfID, List<ContentsBaseResult> data) async
  {
    try
    {
      state = const BookshelfListAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.deleteMyBookshelfContentsAsync(bookshelfID, data);
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        state = BookshelfListAPIState.bookshelfContentsDeleteState(result);
      }
      else
      {
        state = BookshelfListAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }

    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = BookshelfListAPIState.common(exceptionState);
    }
  }
}