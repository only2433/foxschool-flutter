// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SeriesInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesInformationResult _$SeriesInformationResultFromJson(
        Map<String, dynamic> json) =>
    SeriesInformationResult(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      freeSeriesSortNumber:
          (json['free_series_sort_number'] as num?)?.toInt() ?? 0,
      freeSingleSortNumber:
          (json['free_single_sort_number'] as num?)?.toInt() ?? 0,
      basicSortNumber: (json['basic_sort_number'] as num?)?.toInt() ?? 0,
      seriesType: json['seriesType'] as String? ?? Common.CONTENT_TYPE_STORY,
      transitionType: $enumDecodeNullable(
              _$TransitionTypeEnumMap, json['transitionType']) ??
          TransitionType.PAIR_IMAGE,
      contentsCount: (json['contents_count'] as num?)?.toInt() ?? -1,
      level: (json['level'] as num?)?.toInt() ?? -1,
      isSingle: json['is_single'] as String? ?? '',
    )
      ..colors = json['colors'] == null
          ? null
          : ColorData.fromJson(json['colors'] as Map<String, dynamic>)
      ..series = json['series'] == null
          ? null
          : SeriesData.fromJson(json['series'] as Map<String, dynamic>);

Map<String, dynamic> _$SeriesInformationResultToJson(
        SeriesInformationResult instance) =>
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
      'contents_count': instance.contentsCount,
      'level': instance.level,
      'is_single': instance.isSingle,
    };

const _$TransitionTypeEnumMap = {
  TransitionType.PAIR_IMAGE: 'PAIR_IMAGE',
  TransitionType.SLIDE_VIEW: 'SLIDE_VIEW',
};
