// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizItemResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizItemResultImpl _$$QuizItemResultImplFromJson(Map<String, dynamic> json) =>
    _$QuizItemResultImpl(
      questionIndex: json['number'] as int? ?? -1,
      questionTitle: json['text'] as String? ?? "",
      answerIndex: json['answer'] as int? ?? -1,
      questionSoundUrl: json['sound_url'] as String? ?? "",
      examples: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => TextExampleObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuizItemResultImplToJson(
        _$QuizItemResultImpl instance) =>
    <String, dynamic>{
      'number': instance.questionIndex,
      'text': instance.questionTitle,
      'answer': instance.answerIndex,
      'sound_url': instance.questionSoundUrl,
      'items': instance.examples,
    };
