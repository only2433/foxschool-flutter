// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CaptionInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaptionInformationResultImpl _$$CaptionInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CaptionInformationResultImpl(
      startTime: json['start_time'] as int? ?? 0,
      text: json['text'] as String? ?? "",
      endTime: json['end_time'] as int? ?? 0,
      pageByPageIndex: json['group_number'] as int? ?? 0,
    );

Map<String, dynamic> _$$CaptionInformationResultImplToJson(
        _$CaptionInformationResultImpl instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'text': instance.text,
      'end_time': instance.endTime,
      'group_number': instance.pageByPageIndex,
    };
