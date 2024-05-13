

import 'package:foxschool/data/quiz/quiz_item/text_example/TextExampleObject.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'QuizItemResult.freezed.dart';
part 'QuizItemResult.g.dart';

@freezed
class QuizItemResult with _$QuizItemResult
{
  factory QuizItemResult({

    @JsonKey(name: 'number')
    @Default(-1)
    int questionIndex,

    @JsonKey(name: 'text')
    @Default("")
    String questionTitle,

    @JsonKey(name: 'answer')
    @Default(-1)
    int answerIndex,

    @JsonKey(name: 'sound_url')
    @Default("")
    String questionSoundUrl,

    @JsonKey(name: 'items')
    @Default([])
    List<TextExampleObject> examples

  }) = _QuizItemResult;

  QuizItemResult._();

  factory QuizItemResult.fromJson(Map<String, dynamic> data) => _$QuizItemResultFromJson(data);

  int getCorrectIndex()
  {
    return questionIndex - 1;
  }
}