// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SeriesBaseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesBaseResult _$SeriesBaseResultFromJson(Map<String, dynamic> json) =>
    SeriesBaseResult(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      colors: json['colors'] == null
          ? null
          : ColorData.fromJson(json['colors'] as Map<String, dynamic>),
      series: json['series'] == null
          ? null
          : SeriesData.fromJson(json['series'] as Map<String, dynamic>),
      freeSeriesSortNumber: json['free_series_sort_number'] as int? ?? 0,
      freeSingleSortNumber: json['free_single_sort_number'] as int? ?? 0,
      basicSortNumber: json['basic_sort_number'] as int? ?? 0,
      seriesType: json['seriesType'] as String? ?? Common.CONTENT_TYPE_STORY,
      transitionType: $enumDecodeNullable(
              _$TransitionTypeEnumMap, json['transitionType']) ??
          TransitionType.PAIR_IMAGE,
    );

Map<String, dynamic> _$SeriesBaseResultToJson(SeriesBaseResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail_url': instance.thumbnailUrl,
      'colors': instance.colors,
      'series': instance.series,
      'free_single_sort_number': instance.freeSingleSortNumber,
      'free_series_sort_number': instance.freeSeriesSortNumber,
      'basic_sort_number': instance.basicSortNumber,
      'seriesType': instance.seriesType,
      'transitionType': _$TransitionTypeEnumMap[instance.transitionType]!,
    };

const _$TransitionTypeEnumMap = {
  TransitionType.PAIR_IMAGE: 'PAIR_IMAGE',
  TransitionType.SLIDE_VIEW: 'SLIDE_VIEW',
};
