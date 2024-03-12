// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainInformationResultImpl _$$MainInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MainInformationResultImpl(
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

Map<String, dynamic> _$$MainInformationResultImplToJson(
        _$MainInformationResultImpl instance) =>
    <String, dynamic>{
      'levels': instance.levelsList,
      'categories': instance.categoriesList,
    };
