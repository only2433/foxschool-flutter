// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BaseResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return _BaseResponse<T>.fromJson(json);
}

/// @nodoc
mixin _$BaseResponse<T> {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get access_token => throw _privateConstructorUsedError;
  dynamic? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseCopyWith<T, BaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<T, $Res> {
  factory $BaseResponseCopyWith(
          BaseResponse<T> value, $Res Function(BaseResponse<T>) then) =
      _$BaseResponseCopyWithImpl<T, $Res, BaseResponse<T>>;
  @useResult
  $Res call({int status, String message, String access_token, dynamic? data});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<T, $Res, $Val extends BaseResponse<T>>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? access_token = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseImplCopyWith<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  factory _$$BaseResponseImplCopyWith(_$BaseResponseImpl<T> value,
          $Res Function(_$BaseResponseImpl<T>) then) =
      __$$BaseResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int status, String message, String access_token, dynamic? data});
}

/// @nodoc
class __$$BaseResponseImplCopyWithImpl<T, $Res>
    extends _$BaseResponseCopyWithImpl<T, $Res, _$BaseResponseImpl<T>>
    implements _$$BaseResponseImplCopyWith<T, $Res> {
  __$$BaseResponseImplCopyWithImpl(
      _$BaseResponseImpl<T> _value, $Res Function(_$BaseResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? access_token = null,
    Object? data = freezed,
  }) {
    return _then(_$BaseResponseImpl<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseResponseImpl<T> extends _BaseResponse<T>
    with DiagnosticableTreeMixin {
  _$BaseResponseImpl(
      {required this.status,
      this.message = "",
      this.access_token = "",
      this.data})
      : super._();

  factory _$BaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseResponseImplFromJson(json);

  @override
  final int status;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String access_token;
  @override
  final dynamic? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BaseResponse<$T>(status: $status, message: $message, access_token: $access_token, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BaseResponse<$T>'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('access_token', access_token))
      ..add(DiagnosticsProperty('data', data));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      __$$BaseResponseImplCopyWithImpl<T, _$BaseResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseResponseImplToJson<T>(
      this,
    );
  }
}

abstract class _BaseResponse<T> extends BaseResponse<T> {
  factory _BaseResponse(
      {required final int status,
      final String message,
      final String access_token,
      final dynamic? data}) = _$BaseResponseImpl<T>;
  _BaseResponse._() : super._();

  factory _BaseResponse.fromJson(Map<String, dynamic> json) =
      _$BaseResponseImpl<T>.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  String get access_token;
  @override
  dynamic? get data;
  @override
  @JsonKey(ignore: true)
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
