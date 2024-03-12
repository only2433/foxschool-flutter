
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../common/Common.dart';

part 'BaseResponse.freezed.dart';
part 'BaseResponse.g.dart';

@freezed
class BaseResponse<T> with _$BaseResponse
{
  factory BaseResponse({
    required int status,

    @Default("")
    String message,

    @Default("")
    String access_token,

    dynamic? data
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  BaseResponse._();

  bool isSuccess()
  {
    if(status == Common.SUCCESS_CODE_OK)
      {
        return true;
      }
    else
      {
        return false;
      }
  }

  @override
  bool operator ==(Object other) {
    return false;
  }

  @override
  int get hashCode {
    return Random().nextInt(DateTime.now().microsecondsSinceEpoch);
  }


}
