
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/movie/MovieItemResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocException.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/data/MovieAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'MovieAPINotifier.g.dart';

@riverpod
class MovieAPINotifier extends _$MovieAPINotifier with BlocException
{
  late FoxSchoolRepository repository;
  @override
  MovieAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return const MovieAPIState.common(CommonAPIState.initState());
  }

  void requestMovieContentsData(String contentID) async
  {
    try
    {
      state = MovieAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await repository.authContentsPlayAsync(contentID);
      Logcats.message("response : ${response.toString()}");
      if (response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MovieItemResult result = MovieItemResult.fromJson(response.data);
        state = MovieAPIState.contentsLoadedState(result);
      }
    }
    on DioException catch(e)
    {
      processRequestException(e.response.toString());
    }
  }

}