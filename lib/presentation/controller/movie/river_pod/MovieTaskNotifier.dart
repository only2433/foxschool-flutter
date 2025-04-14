

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/data/MovieTaskState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'MovieTaskNotifier.g.dart';

@riverpod
class MovieTaskNotifier extends _$MovieTaskNotifier
{
  @override
  MovieTaskState build() {
    return MovieTaskState(
        seekbarProgress: 0.0,
        currentDuration: "--:--",
        maxDuration: "--:--",
        captionText: "");
  }

  void init()
  {
    state = state.copyWith(
        seekbarProgress: 0.0,
        currentDuration: "--:--",
        maxDuration: "--:--",
        captionText: "");
  }

  void updateSeekBarPercent(double percent)
  {
    state = state.copyWith(
        seekbarProgress: percent
    );
  }

  void initDuration()
  {
    state = state.copyWith(
        currentDuration: "--:--",
        maxDuration: "--:--"
    );
  }

  void updateDuration(String current, String max)
  {
    state = state.copyWith(
      currentDuration: current,
      maxDuration: max
    );
  }

  void updateCaptionText(String caption)
  {
    if(state.captionText != caption)
      {
        state = state.copyWith(
            captionText: caption
        );
      }
  }
}