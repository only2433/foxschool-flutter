// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InAppCampaignResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InAppCampaignResultImpl _$$InAppCampaignResultImplFromJson(
        Map<String, dynamic> json) =>
    _$InAppCampaignResultImpl(
      id: json['id'] as int? ?? 0,
      articleID: json['article_id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      btn1_use: json['btn1_use'] as String? ?? "",
      btn1Mode: json['btn1_mode'] as String? ?? "",
      btn1Text: json['btn1_text'] as String? ?? "",
      btn1Link: json['btn1_link'] as String? ?? "",
      btn2_use: json['btn2_use'] as String? ?? "",
      btn2Mode: json['btn2_mode'] as String? ?? "",
      btn2Text: json['btn2_text'] as String? ?? "",
      notDisplayDays: json['notDisplayDays'] as int? ?? 0,
    );

Map<String, dynamic> _$$InAppCampaignResultImplToJson(
        _$InAppCampaignResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleID,
      'title': instance.title,
      'content': instance.content,
      'btn1_use': instance.btn1_use,
      'btn1_mode': instance.btn1Mode,
      'btn1_text': instance.btn1Text,
      'btn1_link': instance.btn1Link,
      'btn2_use': instance.btn2_use,
      'btn2_mode': instance.btn2Mode,
      'btn2_text': instance.btn2Text,
      'notDisplayDays': instance.notDisplayDays,
    };
