// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginInformationResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginInformationResultImpl _$$LoginInformationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginInformationResultImpl(
      change_90: json['change_90'] as String? ?? "",
      change_180: json['change_180'] as String? ?? "",
      userData: json['user'] == null
          ? null
          : UserInfoSectionResult.fromJson(
              json['user'] as Map<String, dynamic>),
      schoolData: json['school'] == null
          ? null
          : StudentInfoSectionResult.fromJson(
              json['school'] as Map<String, dynamic>),
      teacherData: json['teacher'] == null
          ? null
          : TeacherInfoSectionResult.fromJson(
              json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginInformationResultImplToJson(
        _$LoginInformationResultImpl instance) =>
    <String, dynamic>{
      'change_90': instance.change_90,
      'change_180': instance.change_180,
      'user': instance.userData,
      'school': instance.schoolData,
      'teacher': instance.teacherData,
    };
