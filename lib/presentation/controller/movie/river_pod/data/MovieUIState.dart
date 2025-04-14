
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/movie/play_end_data/PlayerEndViewData.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'MovieUIState.freezed.dart';

@freezed
class MovieUIState with _$MovieUIState
{
  factory MovieUIState({
    required bool isMovieLoading,
    required VideoPlayerController? movieController,
    required String movieTitle,
    required List<ContentsBaseResult> movieDataList,
    required bool isMoviePlayComplete,
    required bool isVisibleMenu,
    required bool isEnablePrevButton,
    required bool isEnableNextButton,
    required bool isMoviePlaying,
    required bool isEnableCaptionButton,
    required bool isVisibleSeekProgressBar,
    required PlayerEndViewData playerEndViewData
  }) = _MovieUIState;
}