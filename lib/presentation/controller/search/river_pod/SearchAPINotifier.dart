

import 'package:dio/dio.dart';

import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/search/SearchListPagingResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/search/river_pod/data/SearchAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'SearchAPINotifier.g.dart';

@riverpod
class SearchAPINotifier extends _$SearchAPINotifier with BlocException
{
  late FoxSchoolRepository repository;
  @override
  SearchAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return  SearchAPIState.common(
        CommonAPIState.initState()
    );
  }

  void requestSearchContentsData(String type, String keyword, String currentPage) async
  {
    try
    {
      state = SearchAPIState.contentsLoadingState();
      BaseResponse response = await repository.getSearchList(type, keyword, currentPage);
      Logcats.message("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        SearchListPagingResult result = SearchListPagingResult.fromJson(response.data);
        state = SearchAPIState.contentsLoadedState(result);
      }
      else
      {
        state = SearchAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    catch(e)
    {
      state = SearchAPIState.common(
          CommonAPIState.errorState(e.toString())
      );
    }
  }

  void requestAddBookshelfContents(String bookshelfID, List<ContentsBaseResult> data) async
  {
    try
    {
      state = const SearchAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.addMyBookshelfContentsAsync(bookshelfID, data);
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        state = SearchAPIState.bookshelfContentsAddState(result);
      }
      else
      {
        state = SearchAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    on DioException catch(e)
    {
      final exceptionState = await processRequestException(e.response.toString());
      state = SearchAPIState.common(exceptionState);
    }
  }

}