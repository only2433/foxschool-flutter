
import 'package:freezed_annotation/freezed_annotation.dart';
part 'VocabularyDataResult.freezed.dart';
part 'VocabularyDataResult.g.dart';

@freezed
class VocabularyDataResult with _$VocabularyDataResult
{
  factory VocabularyDataResult({
    @JsonKey(name: 'content_id')
    @Default("")
    String contentID,

    @JsonKey(name: 'id')
    @Default("")
    String vocabularyID,

    @JsonKey(name:'text')
    @Default("")
    String wordText,

    @JsonKey(name: 'mean')
    @Default("")
    String meanText,

    @JsonKey(name: 'example')
    @Default("")
    String exampleText,

    @JsonKey(name: 'sound_url')
    @Default("")
    String soundUrl,

    @Default(0)
    int lineCount,

    @Default(false)
    bool isSelected,

    @Default(false)
    bool isPlaying

  }) = _VocabularyDataResult;

  VocabularyDataResult._();

  factory VocabularyDataResult.fromJson(Map<String, dynamic> data) => _$VocabularyDataResultFromJson(data);

  VocabularyDataResult setLineCount(int size)
  {
    return copyWith(lineCount: size);
  }

  VocabularyDataResult setSelected(bool isSelect)
  {
    return copyWith(isSelected: isSelect);
  }

  VocabularyDataResult setCurrentPlaying(bool isPlaying)
  {
    return copyWith(isPlaying: isPlaying);
  }
}