
import 'package:foxschool/data/model/quiz/content_information/ContentsInformation.dart';
import 'package:foxschool/data/model/quiz/quiz_item/QuizItemResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuizInformationResult.freezed.dart';
part 'QuizInformationResult.g.dart';

@freezed
class QuizInformationResult with _$QuizInformationResult
{
  factory QuizInformationResult({

    @JsonKey(name: 'id')
    @Default(-1)
    int quizID,

    @JsonKey(name: 'time')
    @Default(-1)
    int quizLimitTime,

    @JsonKey(name: 'quiz_count')
    @Default(-1)
    int quizCount,

    @JsonKey(name: 'type')
    @Default("")
    String quizType,

    @JsonKey(name: 'correct_image_url')
    @Default("")
    String correctImageUrl,

    @JsonKey(name: 'incorrect_image_url')
    @Default("")
    String incorrectImageUrl,

    ContentsInformation? content,

    List<QuizItemResult>? questions

  }) = _QuizInformationResult;

  QuizInformationResult._();

  factory QuizInformationResult.fromJson(Map<String, dynamic> data) => _$QuizInformationResultFromJson(data);

  String getContentID()
  {
    return content?.contentID ?? "";
  }

  String getContentTitle()
  {
    return content?.contentName ?? "";
  }

  String getContentSubTitle()
  {
    return content?.contentSubName ?? "";
  }

  String getCorrectImageFileName()
  {
    return '${getContentID()}_quiz_merge.png';
  }

  String getIncorrectImageFileName()
  {
    return '${getContentID()}_incorrect_merge.png';
  }
}