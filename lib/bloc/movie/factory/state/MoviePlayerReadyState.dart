
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

import '../../../base/MoviePlayerBaseState.dart';

class MoviePlayerReadyState extends MoviePlayerBaseState
{
  final VideoPlayerController controller;
  MoviePlayerReadyState({
    required this.controller
  });

  @override
  List<Object> get props => [controller];
}