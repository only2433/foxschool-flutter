import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/Common.dart';

part 'UserInfoSectionResult.freezed.dart';
part 'UserInfoSectionResult.g.dart';

@freezed
class UserInfoSectionResult with _$UserInfoSectionResult
{
  factory UserInfoSectionResult({

    @JsonKey(name: "fu_id")
    @Default("")
    String userID,

    @JsonKey(name: "login_id")
    @Default("")
    String loginID,

    @Default("")
    String name,

    @JsonKey(name: "nick_name")
    @Default("")
    String nickName,

    @Default("")
    String sex,

    @Default("")
    String birth,

    @Default("")
    String email,

    @Default("")
    String phone,

    @JsonKey(name: "user_type")
    @Default("")
    String userType,

    @JsonKey(name: "hasclass")
    @Default("")
    String hasClass,

  }) = _UserInfoSectionResult;

  UserInfoSectionResult._();

  String getUserType()
  {
    if(userType == "")
      {
        return Common.USER_TYPE_STUDENT;
      }
    return userType;
  }

  bool isHaveClass()
  {
    if(hasClass == "")
      {
        return false;
      }
    return true;
  }

  factory UserInfoSectionResult.fromJson(Map<String, dynamic> data) => _$UserInfoSectionResultFromJson(data);
}