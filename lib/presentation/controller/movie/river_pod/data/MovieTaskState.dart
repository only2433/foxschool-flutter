
import 'package:freezed_annotation/freezed_annotation.dart';
part 'MovieTaskState.freezed.dart';

@freezed
class MovieTaskState with _$MovieTaskState
{
  factory MovieTaskState({
    required double seekbarProgress,
    required String currentDuration,
    required String maxDuration,
    required String captionText
  }) = _MovieTaskState;
}