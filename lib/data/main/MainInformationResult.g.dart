// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainInformationResultImpl _$$MainInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$MainInformationResultImpl(
      mainStoryInformation: json['story'] == null
          ? null
          : MainInformationResult.fromJson(
              json['story'] as Map<String, dynamic>),
      mainSongInformation: (json['song'] as List<dynamic>?)
              ?.map((e) =>
                  SeriesInformationResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bookshelfList: (json['bookshelves'] as List<dynamic>?)
              ?.map(
                  (e) => MyBookshelfResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vocabularyList: (json['vocabularies'] as List<dynamic>?)
              ?.map(
                  (e) => MyVocabularyResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      companyInformation: json['company_information'] == null
          ? null
          : CompanyInformation.fromJson(
              json['company_information'] as Map<String, dynamic>),
      inAppCampaign: json['in_app_campaign'] == null
          ? null
          : InAppCampaignResult.fromJson(
              json['in_app_campaign'] as Map<String, dynamic>),
      homework: json['homework'] as String? ?? "",
      news: json['news'] as String? ?? "",
      filesInformation: json['files'] == null
          ? null
          : FileInformationResult.fromJson(
              json['files'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MainInformationResultImplToJson(
        _$MainInformationResultImpl instance) =>
    <String, dynamic>{
      'story': instance.mainStoryInformation,
      'song': instance.mainSongInformation,
      'bookshelves': instance.bookshelfList,
      'vocabularies': instance.vocabularyList,
      'company_information': instance.companyInformation,
      'in_app_campaign': instance.inAppCampaign,
      'homework': instance.homework,
      'news': instance.news,
      'files': instance.filesInformation,
    };
