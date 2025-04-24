
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FlashcardAPIState.freezed.dart';

@freezed
abstract class FlashcardAPIState with _$FlashcardAPIState
{
  const factory FlashcardAPIState.common(CommonAPIState state) = _Common;
  const factory FlashcardAPIState.vocabularyDataLoadedState(List<VocabularyDataResult> data) = _VocabularyDataLoadedState;
  const factory FlashcardAPIState.addVocabularyContents(MyVocabularyResult data) = _AddVocabularyContents;
}