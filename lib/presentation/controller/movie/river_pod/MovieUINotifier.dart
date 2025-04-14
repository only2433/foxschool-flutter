

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/movie/play_end_data/PlayerEndViewData.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/data/MovieUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'MovieUINotifier.g.dart';
@riverpod
class MovieUINotifier extends _$MovieUINotifier
{
  @override
  MovieUIState build() {
    return MovieUIState(
        isMovieLoading: false,
        movieController: null,
        movieTitle: "",
        movieDataList: [],
        isMoviePlayComplete: false,
        isVisibleMenu: false,
        isEnablePrevButton: false,
        isEnableNextButton: false,
        isMoviePlaying: false,
        isEnableCaptionButton: false,
        isVisibleSeekProgressBar: false,
        playerEndViewData: PlayerEndViewData()
    );
  }

  void updateMovieLoadingState({required bool isDataLoading})
  {
    state = state.copyWith(
      isMovieLoading: isDataLoading
    );
  }

  void setMovieController(VideoPlayerController controller)
  {
    state = state.copyWith(
      movieController: controller
    );
  }

  void setMovieTitle(String title)
  {
    state = state.copyWith(
      movieTitle: title
    );
  }

  void notifyDataList(List<ContentsBaseResult> list)
  {
    state = state.copyWith(
      movieDataList: list
    );
  }

  void completeMoviePlay(PlayerEndViewData data)
  {
    state = state.copyWith(
      isMoviePlayComplete: true,
      isVisibleSeekProgressBar: false,
      playerEndViewData: data
    );
  }

  void toggleMenuVisibility(bool isVisible)
  {
    state = state.copyWith(
        isVisibleMenu: isVisible
    );
  }

  void enableControllerButton({required bool isEnablePrev, required bool isEnableNext})
  {
    state = state.copyWith(
      isEnablePrevButton: isEnablePrev,
      isEnableNextButton: isEnableNext
    );
  }

  void setMoviePlaying(bool isEnable)
  {
    state = state.copyWith(
      isMoviePlaying: isEnable
    );
  }

  void enableCaptionButton(bool isEnable)
  {
    state = state.copyWith(
      isEnableCaptionButton: isEnable
    );
  }

  void readyToPlay()
  {
    state = state.copyWith(
      isMovieLoading: true,
      isMoviePlayComplete: false,
      isVisibleSeekProgressBar: true
    );
  }


}