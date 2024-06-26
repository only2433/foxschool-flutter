
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocException.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/movie/api/event/MovieContentsEvent.dart';
import 'package:foxschool/bloc/movie/api/state/MovieContentsLoadedState.dart';
import 'package:foxschool/common/CommonUtils.dart';

import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/data/movie/MovieItemResult.dart';

import '../../../common/Common.dart';
import '../../../common/FoxschoolLocalization.dart';
import '../../../di/Dependencies.dart';

class MovieContentsBloc extends Bloc<BlocEvent, BlocState> with BlocException
{
  final FoxSchoolRepository repository;
  MovieContentsBloc({
    required this.repository
  }) : super (InitState())
  {
    on<MovieContentsEvent>(_onGetMovieContentsData);
  }

  void _onGetMovieContentsData(MovieContentsEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.authContentsPlayAsync(event.data);
      Logger.d("response : ${response.toString()}");
      if (response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
           await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MovieItemResult result = MovieItemResult.fromJson(response.data);
        emit(MovieContentsLoadedState(data: result));
      }
    }
    on DioException catch(e)
    {
        processException(this, e.response.toString());
    }
  }
}