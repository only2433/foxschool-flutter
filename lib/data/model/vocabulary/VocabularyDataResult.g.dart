// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VocabularyDataResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyDataResultImpl _$$VocabularyDataResultImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyDataResultImpl(
      contentID: json['content_id'] as String? ?? "",
      vocabularyID: json['id'] as String? ?? "",
      wordText: json['text'] as String? ?? "",
      meanText: json['mean'] as String? ?? "",
      exampleText: json['example'] as String? ?? "",
      soundUrl: json['sound_url'] as String? ?? "",
      lineCount: (json['lineCount'] as num?)?.toInt() ?? 0,
      isSelected: json['isSelected'] as bool? ?? false,
      isPlaying: json['isPlaying'] as bool? ?? false,
    );

Map<String, dynamic> _$$VocabularyDataResultImplToJson(
        _$VocabularyDataResultImpl instance) =>
    <String, dynamic>{
      'content_id': instance.contentID,
      'id': instance.vocabularyID,
      'text': instance.wordText,
      'mean': instance.meanText,
      'example': instance.exampleText,
      'sound_url': instance.soundUrl,
      'lineCount': instance.lineCount,
      'isSelected': instance.isSelected,
      'isPlaying': instance.isPlaying,
    };
