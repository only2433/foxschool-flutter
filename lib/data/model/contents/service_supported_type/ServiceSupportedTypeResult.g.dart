// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceSupportedTypeResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceSupportedTypeResultImpl _$$ServiceSupportedTypeResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceSupportedTypeResultImpl(
      storySupportType: json['story'] as String? ?? "",
      serviceSupportType: json['service'] as String? ?? "",
      originalTextSupportType: json['original_text'] as String? ?? "",
      vocabularySupportType: json['vocabulary'] as String? ?? "",
      quizSupportType: json['quiz'] as String? ?? "",
      ebookSupportType: json['ebook'] as String? ?? "",
      crosswordSupportType: json['crossword'] as String? ?? "",
      starwordsSupportType: json['starwords'] as String? ?? "",
      flashcardSupportType: json['flash_card'] as String? ?? "",
      recordSupportType: json['record'] as String? ?? "",
    );

Map<String, dynamic> _$$ServiceSupportedTypeResultImplToJson(
        _$ServiceSupportedTypeResultImpl instance) =>
    <String, dynamic>{
      'story': instance.storySupportType,
      'service': instance.serviceSupportType,
      'original_text': instance.originalTextSupportType,
      'vocabulary': instance.vocabularySupportType,
      'quiz': instance.quizSupportType,
      'ebook': instance.ebookSupportType,
      'crossword': instance.crosswordSupportType,
      'starwords': instance.starwordsSupportType,
      'flash_card': instance.flashcardSupportType,
      'record': instance.recordSupportType,
    };
