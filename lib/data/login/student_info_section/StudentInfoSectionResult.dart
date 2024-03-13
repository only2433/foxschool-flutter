
import 'package:freezed_annotation/freezed_annotation.dart';

part 'StudentInfoSectionResult.freezed.dart';
part 'StudentInfoSectionResult.g.dart';

@freezed
class StudentInfoSectionResult with _$StudentInfoSectionResult
{
  factory StudentInfoSectionResult({

    @JsonKey(name: 'school_id')
    @Default("")
    String schoolID,

    @JsonKey(name: 'hasclass')
    @Default("")
    String hasClass,

    @JsonKey(name: 'class_name')
    @Default("")
    String className,

    @Default("")
    String name,

    @Default("")
    String grade,

    @JsonKey(name: 'type_name')
    @Default("")
    String typeName,

    @JsonKey(name: 'teacher_count')
    @Default(0)
    int teacherCount,

    @JsonKey(name: 'student_count')
    @Default(0)
    int studentCount,

    @JsonKey(name: 'class_count')
    @Default(0)
    int classCount,

    @Default("")
    String address,

    @JsonKey(name: 'address_detail')
    @Default("")
    String addressDetail,

    @JsonKey(name: 'package_name')
    @Default("")
    String packageName,

  }) = _StudentInfoSectionResult;

  StudentInfoSectionResult._();

  bool isHaveClass()
  {
    if(hasClass == "")
      {
        return false;
      }
    return hasClass == 'Y' ? true : false;
  }


  factory StudentInfoSectionResult.fromJson(Map<String, dynamic> data) => _$StudentInfoSectionResultFromJson(data);
}