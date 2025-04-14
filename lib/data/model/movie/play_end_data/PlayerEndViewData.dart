
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlayerEndViewData.freezed.dart';

@freezed
class PlayerEndViewData with _$PlayerEndViewData
{
  factory PlayerEndViewData({
    @Default(true)
    bool isEbookAvailable,

    @Default(true)
    bool isQuizAvailable,

    @Default(true)
    bool isVocabularyAvailable,

    @Default(true)
    bool isFlashcardAvailable,

    @Default(true)
    bool isStarwordsAvailable,

    @Default(true)
    bool isCrosswordAvailable,

    @Default(true)
    bool isTranslateAvailable,

    @Default(false)
    bool isNextButtonVisible,

  }) = _PlayerEndViewData;

}