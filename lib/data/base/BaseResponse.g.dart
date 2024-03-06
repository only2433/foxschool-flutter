// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseImpl<T> _$$BaseResponseImplFromJson<T>(
        Map<String, dynamic> json) =>
    _$BaseResponseImpl<T>(
      status: json['status'] as int,
      message: json['message'] as String? ?? "",
      access_token: json['access_token'] as String? ?? "",
      data: json['data'] ?? null,
    );

Map<String, dynamic> _$$BaseResponseImplToJson<T>(
        _$BaseResponseImpl<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'access_token': instance.access_token,
      'data': instance.data,
    };
