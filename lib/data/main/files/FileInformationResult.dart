
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FileInformationResult.freezed.dart';
part 'FileInformationResult.g.dart';

@freezed
class FileInformationResult with _$FileInformationResult
{
  factory FileInformationResult({

    @JsonKey(name: 'teacher_manual')
    @Default("")
    String teacherManual,

    @JsonKey(name: 'school_letter')
    @Default("")
    String schoolLetter,
  }) = _FileInformationResult;

  factory FileInformationResult.fromJson(Map<String, dynamic> data) => _$FileInformationResultFromJson(data);
}