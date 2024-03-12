// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyBookshelfResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyBookshelfResultImpl _$$MyBookshelfResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MyBookshelfResultImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      color: json['color'] as String? ?? "",
      contentsCount: json['contents_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$MyBookshelfResultImplToJson(
        _$MyBookshelfResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'contents_count': instance.contentsCount,
    };
