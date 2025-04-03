
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VocabularyAPIState.freezed.dart';

@freezed
abstract class VocabularyAPIState with _$VocabularyAPIState
{
  const factory VocabularyAPIState.common(CommonAPIState state) = _Common;
  const factory VocabularyAPIState.vocabularyContentsLoadedState(List<VocabularyDataResult> data) = _VocabularyContentsLoadedState;
  const factory VocabularyAPIState.addContentsState(MyVocabularyResult data) = _AddContentsState;
  const factory VocabularyAPIState.deleteContentsState() = _DeleteContentsState;
}