
import 'package:freezed_annotation/freezed_annotation.dart';
part 'InAppCampaignResult.freezed.dart';
part 'InAppCampaignResult.g.dart';

@freezed
class InAppCampaignResult with _$InAppCampaignResult
{
  factory InAppCampaignResult({

    @Default(0)
    int id,

    @JsonKey(name: 'article_id')
    @Default(0)
    int articleID,

    @Default("")
    String title,

    @Default("")
    String content,

    @Default("")
    String btn1_use,

    @JsonKey(name: 'btn1_mode')
    @Default("")
    String btn1Mode,

    @JsonKey(name: 'btn1_text')
    @Default("")
    String btn1Text,

    @JsonKey(name: 'btn1_link')
    @Default("")
    String btn1Link,

    @Default("")
    String btn2_use,

    @JsonKey(name: 'btn2_mode')
    @Default("")
    String btn2Mode,

    @JsonKey(name: 'btn2_text')
    @Default("")
    String btn2Text,

    @Default(0)
    int notDisplayDays

  }) = _InAppCampaignResult;

  factory InAppCampaignResult.fromJson(Map<String, dynamic> data) => _$InAppCampaignResultFromJson(data);
}