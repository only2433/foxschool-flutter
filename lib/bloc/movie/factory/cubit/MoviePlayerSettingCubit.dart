

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/base/MoviePlayerBaseState.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayerReadyState.dart';
import 'package:video_player/video_player.dart';


class MoviePlayerSettingCubit extends Cubit<MoviePlayerBaseState>
{
  MoviePlayerSettingCubit() : super(MovieLoadingState());

  void showLoading()
  {
    emit(MovieLoadingState());
  }

  void setController(VideoPlayerController controller)
  {
    emit(MoviePlayerReadyState(controller: controller));
  }
}