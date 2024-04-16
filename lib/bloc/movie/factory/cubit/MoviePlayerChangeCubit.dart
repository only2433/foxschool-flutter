

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/base/MoviePlayerBaseState.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayerReadyState.dart';
import 'package:video_player/video_player.dart';


class MoviePlayerChangeCubit extends Cubit<MoviePlayerBaseState>
{
  MoviePlayerChangeCubit() : super(LoadingState());

  void showLoading()
  {
    emit(LoadingState());
  }

  void setController(VideoPlayerController controller)
  {
    emit(MoviePlayerReadyState(controller: controller));
  }
}