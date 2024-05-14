// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieItemResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieItemResultImpl _$$MovieItemResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieItemResultImpl(
      contentID: json['id'] as String? ?? "",
      recordKey: json['record_key'] as String? ?? "",
      totalTime: json['total_time'] as int? ?? 0,
      movieMP4Url: json['mp4_url'] as String? ?? "",
      movieHLSUrl: json['m3u8_url'] as String? ?? "",
      previewTime: json['preview_time'] as int? ?? 0,
      pageByPageMaxCount: json['subtitle_group_count'] as int? ?? 0,
      nextContent: json['next_content'] == null
          ? null
          : ContentsBaseResult.fromJson(
              json['next_content'] as Map<String, dynamic>),
      captionList: (json['subtitle'] as List<dynamic>?)
              ?.map((e) =>
                  CaptionInformationResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieItemResultImplToJson(
        _$MovieItemResultImpl instance) =>
    <String, dynamic>{
      'id': instance.contentID,
      'record_key': instance.recordKey,
      'total_time': instance.totalTime,
      'mp4_url': instance.movieMP4Url,
      'm3u8_url': instance.movieHLSUrl,
      'preview_time': instance.previewTime,
      'subtitle_group_count': instance.pageByPageMaxCount,
      'next_content': instance.nextContent,
      'subtitle': instance.captionList,
    };
