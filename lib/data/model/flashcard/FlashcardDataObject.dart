

import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FlashcardDataObject.freezed.dart';
@freezed
class FlashcardDataObject with _$FlashcardDataObject
{
  factory FlashcardDataObject({
    required String contentsID,
    required String title,
    required String subTitle,
    required VocabularyType vocabularyType,
    @Default([])
    List<VocabularyDataResult> list
  }) = _FlashcardDataObject;

  FlashcardDataObject._();

  FlashcardDataObject setVocabularyType(VocabularyType type)
  {
    return copyWith(vocabularyType: type);
  }
}