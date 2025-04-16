// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchListPagingResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchListPagingResultImpl _$$SearchListPagingResultImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchListPagingResultImpl(
      list: (json['list'] as List<dynamic>?)
              ?.map(
                  (e) => ContentsBaseResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : MetaDataPagingResult.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchListPagingResultImplToJson(
        _$SearchListPagingResultImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
      'meta': instance.meta,
    };
