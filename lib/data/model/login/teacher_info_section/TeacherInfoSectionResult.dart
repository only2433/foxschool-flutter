
import 'package:freezed_annotation/freezed_annotation.dart';
part 'TeacherInfoSectionResult.freezed.dart';
part 'TeacherInfoSectionResult.g.dart';

@freezed
class TeacherInfoSectionResult with _$TeacherInfoSectionResult
{
  factory TeacherInfoSectionResult({

    @Default("")
    String name,

    @JsonKey(name: 'type_name')
    @Default("")
    String typeName
  }) = _TeacherInfoSectionResult;

  factory TeacherInfoSectionResult.fromJson(Map<String, dynamic> data) => _$TeacherInfoSectionResultFromJson(data);
}