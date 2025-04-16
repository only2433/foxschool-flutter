// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TextExampleObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextExampleObjectImpl _$$TextExampleObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$TextExampleObjectImpl(
      exampleIndex: (json['number'] as num?)?.toInt() ?? -1,
      exampleText: json['text'] as String? ?? "",
      exampleSoundUrl: json['sound_url'] as String? ?? "",
    );

Map<String, dynamic> _$$TextExampleObjectImplToJson(
        _$TextExampleObjectImpl instance) =>
    <String, dynamic>{
      'number': instance.exampleIndex,
      'text': instance.exampleText,
      'sound_url': instance.exampleSoundUrl,
    };
