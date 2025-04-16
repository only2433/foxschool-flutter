// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MetaDataPagingResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaDataPagingResultImpl _$$MetaDataPagingResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MetaDataPagingResultImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 0,
      perPage: (json['per_page'] as num?)?.toInt() ?? 0,
      totalPage: (json['total_page'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MetaDataPagingResultImplToJson(
        _$MetaDataPagingResultImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total_page': instance.totalPage,
    };
