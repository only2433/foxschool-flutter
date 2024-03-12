
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyVocabularyResult.freezed.dart';
part 'MyVocabularyResult.g.dart';

@freezed
class MyVocabularyResult with _$MyVocabularyResult
{
  factory MyVocabularyResult({

    @Default("")
    String id,

    @Default("")
    String name,

    @Default("")
    String color,

    @JsonKey(name: 'word_count')
    @Default(0)
    int wordCount,

    @Default("")
    String contentID,

    @Default(VocabularyType.VOCABULARY_CONTENTS)
    VocabularyType vocabularyType
  }) = _MyVocabularyResult;

  factory MyVocabularyResult.fromJson(Map<String, dynamic> data) => _$MyVocabularyResultFromJson(data);
}