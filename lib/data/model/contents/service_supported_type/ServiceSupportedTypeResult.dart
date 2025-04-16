
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ServiceSupportedTypeResult.freezed.dart';
part 'ServiceSupportedTypeResult.g.dart';

@freezed
class ServiceSupportedTypeResult with _$ServiceSupportedTypeResult
{
  factory ServiceSupportedTypeResult({

    @JsonKey(name:'story')
    @Default("")
    String storySupportType,

    @JsonKey(name:'service')
    @Default("")
    String serviceSupportType,

    @JsonKey(name:'original_text')
    @Default("")
    String originalTextSupportType,

    @JsonKey(name:'vocabulary')
    @Default("")
    String vocabularySupportType,

    @JsonKey(name:'quiz')
    @Default("")
    String quizSupportType,

    @JsonKey(name:'ebook')
    @Default("")
    String ebookSupportType,

    @JsonKey(name:'crossword')
    @Default("")
    String crosswordSupportType,

    @JsonKey(name:'starwords')
    @Default("")
    String starwordsSupportType,

    @JsonKey(name:'flash_card')
    @Default("")
    String flashcardSupportType,

    @JsonKey(name:'record')
    @Default("")
    String recordSupportType,

  }) = _ServiceSupportedTypeResult;

  factory ServiceSupportedTypeResult.fromJson(Map<String, dynamic> data) => _$ServiceSupportedTypeResultFromJson(data);

}