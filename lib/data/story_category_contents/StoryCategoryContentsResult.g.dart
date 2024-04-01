// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StoryCategoryContentsResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryCategoryContentsResultImpl _$$StoryCategoryContentsResultImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryCategoryContentsResultImpl(
      themeInfo: json['theme_info'] == null
          ? null
          : ThemeData.fromJson(json['theme_info'] as Map<String, dynamic>),
      itemList: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  SeriesInformationResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoryCategoryContentsResultImplToJson(
        _$StoryCategoryContentsResultImpl instance) =>
    <String, dynamic>{
      'theme_info': instance.themeInfo,
      'children': instance.itemList,
    };
