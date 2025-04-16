// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlashcardDataResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashcardDataResultImpl _$$FlashcardDataResultImplFromJson(
        Map<String, dynamic> json) =>
    _$FlashcardDataResultImpl(
      vocabularyDataResult: VocabularyDataResult.fromJson(
          json['vocabularyDataResult'] as Map<String, dynamic>),
      index: (json['index'] as num?)?.toInt() ?? 0,
      cardNumber: (json['cardNumber'] as num?)?.toInt() ?? 0,
      isBookmark: json['isBookmark'] as bool? ?? false,
    );

Map<String, dynamic> _$$FlashcardDataResultImplToJson(
        _$FlashcardDataResultImpl instance) =>
    <String, dynamic>{
      'vocabularyDataResult': instance.vocabularyDataResult,
      'index': instance.index,
      'cardNumber': instance.cardNumber,
      'isBookmark': instance.isBookmark,
    };
