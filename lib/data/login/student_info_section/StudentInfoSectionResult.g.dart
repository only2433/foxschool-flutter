// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentInfoSectionResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentInfoSectionResultImpl _$$StudentInfoSectionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentInfoSectionResultImpl(
      schoolID: json['school_id'] as String? ?? "",
      hasClass: json['hasclass'] as String? ?? "",
      className: json['class_name'] as String? ?? "",
      name: json['name'] as String? ?? "",
      grade: json['grade'] as String? ?? "",
      typeName: json['type_name'] as String? ?? "",
      teacherCount: json['teacher_count'] as int? ?? 0,
      studentCount: json['student_count'] as int? ?? 0,
      classCount: json['class_count'] as int? ?? 0,
      address: json['address'] as String? ?? "",
      addressDetail: json['address_detail'] as String? ?? "",
      packageName: json['package_name'] as String? ?? "",
    );

Map<String, dynamic> _$$StudentInfoSectionResultImplToJson(
        _$StudentInfoSectionResultImpl instance) =>
    <String, dynamic>{
      'school_id': instance.schoolID,
      'hasclass': instance.hasClass,
      'class_name': instance.className,
      'name': instance.name,
      'grade': instance.grade,
      'type_name': instance.typeName,
      'teacher_count': instance.teacherCount,
      'student_count': instance.studentCount,
      'class_count': instance.classCount,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'package_name': instance.packageName,
    };
