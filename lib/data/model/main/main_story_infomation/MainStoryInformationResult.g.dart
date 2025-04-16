// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainStoryInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainStoryInformationResultImpl _$$MainStoryInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MainStoryInformationResultImpl(
      levelsList: (json['levels'] as List<dynamic>?)
              ?.map((e) =>
                  SeriesInformationResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categoriesList: (json['categories'] as List<dynamic>?)
              ?.map((e) =>
                  SeriesInformationResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MainStoryInformationResultImplToJson(
        _$MainStoryInformationResultImpl instance) =>
    <String, dynamic>{
      'levels': instance.levelsList,
      'categories': instance.categoriesList,
    };
