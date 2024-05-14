// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizInformationResultImpl _$$QuizInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizInformationResultImpl(
      quizID: json['id'] as int? ?? -1,
      quizLimitTime: json['time'] as int? ?? -1,
      quizCount: json['quiz_count'] as int? ?? -1,
      quizType: json['type'] as String? ?? "",
      correctImageUrl: json['correct_image_url'] as String? ?? "",
      incorrectImageUrl: json['incorrect_image_url'] as String? ?? "",
      content: json['content'] == null
          ? null
          : ContentsInformation.fromJson(
              json['content'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuizItemResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizInformationResultImplToJson(
        _$QuizInformationResultImpl instance) =>
    <String, dynamic>{
      'id': instance.quizID,
      'time': instance.quizLimitTime,
      'quiz_count': instance.quizCount,
      'type': instance.quizType,
      'correct_image_url': instance.correctImageUrl,
      'incorrect_image_url': instance.incorrectImageUrl,
      'content': instance.content,
      'questions': instance.questions,
    };
