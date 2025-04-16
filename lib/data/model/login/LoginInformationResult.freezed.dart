// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginInformationResult _$LoginInformationResultFromJson(
    Map<String, dynamic> json) {
  return _LoginInformationResult.fromJson(json);
}

/// @nodoc
mixin _$LoginInformationResult {
  String get change_90 => throw _privateConstructorUsedError;
  String get change_180 => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserInfoSectionResult? get userData => throw _privateConstructorUsedError;
  @JsonKey(name: 'school')
  StudentInfoSectionResult? get schoolData =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher')
  TeacherInfoSectionResult? get teacherData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginInformationResultCopyWith<LoginInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInformationResultCopyWith<$Res> {
  factory $LoginInformationResultCopyWith(LoginInformationResult value,
          $Res Function(LoginInformationResult) then) =
      _$LoginInformationResultCopyWithImpl<$Res, LoginInformationResult>;
  @useResult
  $Res call(
      {String change_90,
      String change_180,
      @JsonKey(name: 'user') UserInfoSectionResult? userData,
      @JsonKey(name: 'school') StudentInfoSectionResult? schoolData,
      @JsonKey(name: 'teacher') TeacherInfoSectionResult? teacherData});

  $UserInfoSectionResultCopyWith<$Res>? get userData;
  $StudentInfoSectionResultCopyWith<$Res>? get schoolData;
  $TeacherInfoSectionResultCopyWith<$Res>? get teacherData;
}

/// @nodoc
class _$LoginInformationResultCopyWithImpl<$Res,
        $Val extends LoginInformationResult>
    implements $LoginInformationResultCopyWith<$Res> {
  _$LoginInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? change_90 = null,
    Object? change_180 = null,
    Object? userData = freezed,
    Object? schoolData = freezed,
    Object? teacherData = freezed,
  }) {
    return _then(_value.copyWith(
      change_90: null == change_90
          ? _value.change_90
          : change_90 // ignore: cast_nullable_to_non_nullable
              as String,
      change_180: null == change_180
          ? _value.change_180
          : change_180 // ignore: cast_nullable_to_non_nullable
              as String,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserInfoSectionResult?,
      schoolData: freezed == schoolData
          ? _value.schoolData
          : schoolData // ignore: cast_nullable_to_non_nullable
              as StudentInfoSectionResult?,
      teacherData: freezed == teacherData
          ? _value.teacherData
          : teacherData // ignore: cast_nullable_to_non_nullable
              as TeacherInfoSectionResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoSectionResultCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserInfoSectionResultCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentInfoSectionResultCopyWith<$Res>? get schoolData {
    if (_value.schoolData == null) {
      return null;
    }

    return $StudentInfoSectionResultCopyWith<$Res>(_value.schoolData!, (value) {
      return _then(_value.copyWith(schoolData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeacherInfoSectionResultCopyWith<$Res>? get teacherData {
    if (_value.teacherData == null) {
      return null;
    }

    return $TeacherInfoSectionResultCopyWith<$Res>(_value.teacherData!,
        (value) {
      return _then(_value.copyWith(teacherData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginInformationResultImplCopyWith<$Res>
    implements $LoginInformationResultCopyWith<$Res> {
  factory _$$LoginInformationResultImplCopyWith(
          _$LoginInformationResultImpl value,
          $Res Function(_$LoginInformationResultImpl) then) =
      __$$LoginInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String change_90,
      String change_180,
      @JsonKey(name: 'user') UserInfoSectionResult? userData,
      @JsonKey(name: 'school') StudentInfoSectionResult? schoolData,
      @JsonKey(name: 'teacher') TeacherInfoSectionResult? teacherData});

  @override
  $UserInfoSectionResultCopyWith<$Res>? get userData;
  @override
  $StudentInfoSectionResultCopyWith<$Res>? get schoolData;
  @override
  $TeacherInfoSectionResultCopyWith<$Res>? get teacherData;
}

/// @nodoc
class __$$LoginInformationResultImplCopyWithImpl<$Res>
    extends _$LoginInformationResultCopyWithImpl<$Res,
        _$LoginInformationResultImpl>
    implements _$$LoginInformationResultImplCopyWith<$Res> {
  __$$LoginInformationResultImplCopyWithImpl(
      _$LoginInformationResultImpl _value,
      $Res Function(_$LoginInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? change_90 = null,
    Object? change_180 = null,
    Object? userData = freezed,
    Object? schoolData = freezed,
    Object? teacherData = freezed,
  }) {
    return _then(_$LoginInformationResultImpl(
      change_90: null == change_90
          ? _value.change_90
          : change_90 // ignore: cast_nullable_to_non_nullable
              as String,
      change_180: null == change_180
          ? _value.change_180
          : change_180 // ignore: cast_nullable_to_non_nullable
              as String,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserInfoSectionResult?,
      schoolData: freezed == schoolData
          ? _value.schoolData
          : schoolData // ignore: cast_nullable_to_non_nullable
              as StudentInfoSectionResult?,
      teacherData: freezed == teacherData
          ? _value.teacherData
          : teacherData // ignore: cast_nullable_to_non_nullable
              as TeacherInfoSectionResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginInformationResultImpl implements _LoginInformationResult {
  _$LoginInformationResultImpl(
      {this.change_90 = "",
      this.change_180 = "",
      @JsonKey(name: 'user') this.userData,
      @JsonKey(name: 'school') this.schoolData,
      @JsonKey(name: 'teacher') this.teacherData});

  factory _$LoginInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginInformationResultImplFromJson(json);

  @override
  @JsonKey()
  final String change_90;
  @override
  @JsonKey()
  final String change_180;
  @override
  @JsonKey(name: 'user')
  final UserInfoSectionResult? userData;
  @override
  @JsonKey(name: 'school')
  final StudentInfoSectionResult? schoolData;
  @override
  @JsonKey(name: 'teacher')
  final TeacherInfoSectionResult? teacherData;

  @override
  String toString() {
    return 'LoginInformationResult(change_90: $change_90, change_180: $change_180, userData: $userData, schoolData: $schoolData, teacherData: $teacherData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginInformationResultImpl &&
            (identical(other.change_90, change_90) ||
                other.change_90 == change_90) &&
            (identical(other.change_180, change_180) ||
                other.change_180 == change_180) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.schoolData, schoolData) ||
                other.schoolData == schoolData) &&
            (identical(other.teacherData, teacherData) ||
                other.teacherData == teacherData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, change_90, change_180, userData, schoolData, teacherData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginInformationResultImplCopyWith<_$LoginInformationResultImpl>
      get copyWith => __$$LoginInformationResultImplCopyWithImpl<
          _$LoginInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginInformationResultImplToJson(
      this,
    );
  }
}

abstract class _LoginInformationResult implements LoginInformationResult {
  factory _LoginInformationResult(
          {final String change_90,
          final String change_180,
          @JsonKey(name: 'user') final UserInfoSectionResult? userData,
          @JsonKey(name: 'school') final StudentInfoSectionResult? schoolData,
          @JsonKey(name: 'teacher')
          final TeacherInfoSectionResult? teacherData}) =
      _$LoginInformationResultImpl;

  factory _LoginInformationResult.fromJson(Map<String, dynamic> json) =
      _$LoginInformationResultImpl.fromJson;

  @override
  String get change_90;
  @override
  String get change_180;
  @override
  @JsonKey(name: 'user')
  UserInfoSectionResult? get userData;
  @override
  @JsonKey(name: 'school')
  StudentInfoSectionResult? get schoolData;
  @override
  @JsonKey(name: 'teacher')
  TeacherInfoSectionResult? get teacherData;
  @override
  @JsonKey(ignore: true)
  _$$LoginInformationResultImplCopyWith<_$LoginInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
