// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyVocabularyResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyVocabularyResultImpl _$$MyVocabularyResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MyVocabularyResultImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      color: json['color'] as String? ?? "",
      wordsCount: (json['words_count'] as num?)?.toInt() ?? 0,
      contentID: json['contentID'] as String? ?? "",
      vocabularyType: $enumDecodeNullable(
              _$VocabularyTypeEnumMap, json['vocabularyType']) ??
          VocabularyType.VOCABULARY_CONTENTS,
    );

Map<String, dynamic> _$$MyVocabularyResultImplToJson(
        _$MyVocabularyResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'words_count': instance.wordsCount,
      'contentID': instance.contentID,
      'vocabularyType': _$VocabularyTypeEnumMap[instance.vocabularyType]!,
    };

const _$VocabularyTypeEnumMap = {
  VocabularyType.VOCABULARY_SHELF: 'VOCABULARY_SHELF',
  VocabularyType.VOCABULARY_CONTENTS: 'VOCABULARY_CONTENTS',
};
