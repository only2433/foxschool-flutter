
import 'package:foxschool/data/login/student_info_section/StudentInfoSectionResult.dart';
import 'package:foxschool/data/login/teacher_info_section/TeacherInfoSectionResult.dart';
import 'package:foxschool/data/login/user_info_section/UserInfoSectionResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginInformationResult.freezed.dart';
part 'LoginInformationResult.g.dart';

@freezed
class LoginInformationResult with _$LoginInformationResult
{
  factory LoginInformationResult({

    @Default("")
    String change_90,

    @Default("")
    String change_180,

    @JsonKey(name: 'user')
    UserInfoSectionResult? userData,

    @JsonKey(name: 'school')
    StudentInfoSectionResult? schoolData,

    @JsonKey(name: 'teacher')
    TeacherInfoSectionResult? teacherData,

  }) = _LoginInformationResult;

  factory LoginInformationResult.fromJson(Map<String, dynamic> data) => _$LoginInformationResultFromJson(data);

}