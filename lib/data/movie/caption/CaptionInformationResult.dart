

import 'package:freezed_annotation/freezed_annotation.dart';

part 'CaptionInformationResult.freezed.dart';
part 'CaptionInformationResult.g.dart';

@freezed
class CaptionInformationResult with _$CaptionInformationResult
{
  factory CaptionInformationResult({

    @JsonKey(name:'start_time')
    @Default(0)
    int startTime,

    @Default("")
    String text,

    @JsonKey(name:'end_time')
    @Default(0)
    int endTime,

    @JsonKey(name:'group_number')
    @Default(0)
    int pageByPageIndex
  }) = _CaptionInformationResult;

  factory CaptionInformationResult.fromJson(Map<String, dynamic> data) => _$CaptionInformationResultFromJson(data);
}