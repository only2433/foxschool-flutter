// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailItemInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailItemInformationResultImpl _$$DetailItemInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailItemInformationResultImpl(
      lastStudyContentID: json['latest_study'] as String? ?? "",
      contentsList: (json['list'] as List<dynamic>?)
              ?.map(
                  (e) => ContentsBaseResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      seriesInformation: json['info'] == null
          ? null
          : SeriesInformation.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailItemInformationResultImplToJson(
        _$DetailItemInformationResultImpl instance) =>
    <String, dynamic>{
      'latest_study': instance.lastStudyContentID,
      'list': instance.contentsList,
      'info': instance.seriesInformation,
    };
