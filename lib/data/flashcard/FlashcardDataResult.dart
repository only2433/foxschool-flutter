
import 'package:foxschool/data/vocabulary/VocabularyDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FlashcardDataResult.freezed.dart';
part 'FlashcardDataResult.g.dart';


@freezed
class FlashcardDataResult with _$FlashcardDataResult {
  factory FlashcardDataResult({
    required VocabularyDataResult vocabularyDataResult,
    @Default(0) int index,
    @Default(0) int cardNumber,
    @Default(false) bool isBookmark
  }) = _FlashcardDataResult;

  FlashcardDataResult._();

  factory FlashcardDataResult.fromJson(Map<String, dynamic> data) => _$FlashcardDataResultFromJson(data);

  factory FlashcardDataResult.fromVocabularyDataResult(VocabularyDataResult data) => FlashcardDataResult(vocabularyDataResult: data);

  FlashcardDataResult setIndex(int index) {
    return copyWith(index: index);
  }

  FlashcardDataResult setCardNumber(int number){
    return copyWith(cardNumber: number);
  }

  FlashcardDataResult enableBookmark(bool isBookmark)
  {
    return copyWith(isBookmark: isBookmark);
  }


}