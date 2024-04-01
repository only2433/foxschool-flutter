// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContentsBaseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentsBaseResultImpl _$$ContentsBaseResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentsBaseResultImpl(
      id: json['id'] as String? ?? "",
      index: json['seq'] as int? ?? 0,
      type: json['type'] as String? ?? Common.CONTENT_TYPE_STORY,
      name: json['name'] as String? ?? "",
      subName: json['sub_name'] as String? ?? "",
      thumbnailUrl: json['thumbnail_url'] as String? ?? "",
      serviceInfo: json['service_info'] == null
          ? null
          : ServiceSupportedTypeResult.fromJson(
              json['service_info'] as Map<String, dynamic>),
      story_chk: json['story_chk'] as String? ?? "",
      isSelected: json['isSelected'] as bool? ?? false,
      isOptionDisable: json['isOptionDisable'] as bool? ?? false,
    );

Map<String, dynamic> _$$ContentsBaseResultImplToJson(
        _$ContentsBaseResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seq': instance.index,
      'type': instance.type,
      'name': instance.name,
      'sub_name': instance.subName,
      'thumbnail_url': instance.thumbnailUrl,
      'service_info': instance.serviceInfo,
      'story_chk': instance.story_chk,
      'isSelected': instance.isSelected,
      'isOptionDisable': instance.isOptionDisable,
    };
