
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FlashcardTaskState.freezed.dart';
@freezed
class FlashcardTaskState with _$FlashcardTaskState
{
  factory FlashcardTaskState({
    required int currentStudyPage,
    required int maxStudyPage,
  }) = _FlashcardTaskState;
}