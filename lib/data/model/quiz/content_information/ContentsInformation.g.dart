// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContentsInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentsInformationImpl _$$ContentsInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentsInformationImpl(
      contentID: json['id'] as String? ?? "",
      contentName: json['name'] as String? ?? "",
      contentSubName: json['sub_name'] as String? ?? "",
      level: (json['level'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$ContentsInformationImplToJson(
        _$ContentsInformationImpl instance) =>
    <String, dynamic>{
      'id': instance.contentID,
      'name': instance.contentName,
      'sub_name': instance.contentSubName,
      'level': instance.level,
    };
