// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SeriesInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesInformationImpl _$$SeriesInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$SeriesInformationImpl(
      id: json['id'] as String? ?? "",
      is_single: json['is_single'] as String? ?? "",
      level: json['level'] as int? ?? -1,
      totalCount: json['contents_count'] as int? ?? 0,
      ARLevel: (json['ar_level'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$SeriesInformationImplToJson(
        _$SeriesInformationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_single': instance.is_single,
      'level': instance.level,
      'contents_count': instance.totalCount,
      'ar_level': instance.ARLevel,
    };
