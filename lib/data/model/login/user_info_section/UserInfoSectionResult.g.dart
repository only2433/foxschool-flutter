// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfoSectionResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoSectionResultImpl _$$UserInfoSectionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoSectionResultImpl(
      userID: json['fu_id'] as String? ?? "",
      loginID: json['login_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      nickName: json['nick_name'] as String? ?? "",
      sex: json['sex'] as String? ?? "",
      birth: json['birth'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      userType: json['user_type'] as String? ?? "",
      hasClass: json['hasclass'] as String? ?? "",
    );

Map<String, dynamic> _$$UserInfoSectionResultImplToJson(
        _$UserInfoSectionResultImpl instance) =>
    <String, dynamic>{
      'fu_id': instance.userID,
      'login_id': instance.loginID,
      'name': instance.name,
      'nick_name': instance.nickName,
      'sex': instance.sex,
      'birth': instance.birth,
      'email': instance.email,
      'phone': instance.phone,
      'user_type': instance.userType,
      'hasclass': instance.hasClass,
    };
