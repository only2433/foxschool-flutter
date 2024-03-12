// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TeacherInfoSectionResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherInfoSectionResult _$TeacherInfoSectionResultFromJson(
    Map<String, dynamic> json) {
  return _TeacherInfoSectionResult.fromJson(json);
}

/// @nodoc
mixin _$TeacherInfoSectionResult {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_name')
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherInfoSectionResultCopyWith<TeacherInfoSectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherInfoSectionResultCopyWith<$Res> {
  factory $TeacherInfoSectionResultCopyWith(TeacherInfoSectionResult value,
          $Res Function(TeacherInfoSectionResult) then) =
      _$TeacherInfoSectionResultCopyWithImpl<$Res, TeacherInfoSectionResult>;
  @useResult
  $Res call({String name, @JsonKey(name: 'type_name') String typeName});
}

/// @nodoc
class _$TeacherInfoSectionResultCopyWithImpl<$Res,
        $Val extends TeacherInfoSectionResult>
    implements $TeacherInfoSectionResultCopyWith<$Res> {
  _$TeacherInfoSectionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherInfoSectionResultImplCopyWith<$Res>
    implements $TeacherInfoSectionResultCopyWith<$Res> {
  factory _$$TeacherInfoSectionResultImplCopyWith(
          _$TeacherInfoSectionResultImpl value,
          $Res Function(_$TeacherInfoSectionResultImpl) then) =
      __$$TeacherInfoSectionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'type_name') String typeName});
}

/// @nodoc
class __$$TeacherInfoSectionResultImplCopyWithImpl<$Res>
    extends _$TeacherInfoSectionResultCopyWithImpl<$Res,
        _$TeacherInfoSectionResultImpl>
    implements _$$TeacherInfoSectionResultImplCopyWith<$Res> {
  __$$TeacherInfoSectionResultImplCopyWithImpl(
      _$TeacherInfoSectionResultImpl _value,
      $Res Function(_$TeacherInfoSectionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typeName = null,
  }) {
    return _then(_$TeacherInfoSectionResultImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherInfoSectionResultImpl implements _TeacherInfoSectionResult {
  _$TeacherInfoSectionResultImpl(
      {this.name = "", @JsonKey(name: 'type_name') this.typeName = ""});

  factory _$TeacherInfoSectionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherInfoSectionResultImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'type_name')
  final String typeName;

  @override
  String toString() {
    return 'TeacherInfoSectionResult(name: $name, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherInfoSectionResultImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherInfoSectionResultImplCopyWith<_$TeacherInfoSectionResultImpl>
      get copyWith => __$$TeacherInfoSectionResultImplCopyWithImpl<
          _$TeacherInfoSectionResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherInfoSectionResultImplToJson(
      this,
    );
  }
}

abstract class _TeacherInfoSectionResult implements TeacherInfoSectionResult {
  factory _TeacherInfoSectionResult(
          {final String name,
          @JsonKey(name: 'type_name') final String typeName}) =
      _$TeacherInfoSectionResultImpl;

  factory _TeacherInfoSectionResult.fromJson(Map<String, dynamic> json) =
      _$TeacherInfoSectionResultImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'type_name')
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$TeacherInfoSectionResultImplCopyWith<_$TeacherInfoSectionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
