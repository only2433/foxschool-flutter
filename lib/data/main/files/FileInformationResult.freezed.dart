// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FileInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileInformationResult _$FileInformationResultFromJson(
    Map<String, dynamic> json) {
  return _FileInformationResult.fromJson(json);
}

/// @nodoc
mixin _$FileInformationResult {
  @JsonKey(name: 'teacher_manual')
  String get teacherManual => throw _privateConstructorUsedError;
  @JsonKey(name: 'school_letter')
  String get schoolLetter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileInformationResultCopyWith<FileInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileInformationResultCopyWith<$Res> {
  factory $FileInformationResultCopyWith(FileInformationResult value,
          $Res Function(FileInformationResult) then) =
      _$FileInformationResultCopyWithImpl<$Res, FileInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'teacher_manual') String teacherManual,
      @JsonKey(name: 'school_letter') String schoolLetter});
}

/// @nodoc
class _$FileInformationResultCopyWithImpl<$Res,
        $Val extends FileInformationResult>
    implements $FileInformationResultCopyWith<$Res> {
  _$FileInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherManual = null,
    Object? schoolLetter = null,
  }) {
    return _then(_value.copyWith(
      teacherManual: null == teacherManual
          ? _value.teacherManual
          : teacherManual // ignore: cast_nullable_to_non_nullable
              as String,
      schoolLetter: null == schoolLetter
          ? _value.schoolLetter
          : schoolLetter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileInformationResultImplCopyWith<$Res>
    implements $FileInformationResultCopyWith<$Res> {
  factory _$$FileInformationResultImplCopyWith(
          _$FileInformationResultImpl value,
          $Res Function(_$FileInformationResultImpl) then) =
      __$$FileInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'teacher_manual') String teacherManual,
      @JsonKey(name: 'school_letter') String schoolLetter});
}

/// @nodoc
class __$$FileInformationResultImplCopyWithImpl<$Res>
    extends _$FileInformationResultCopyWithImpl<$Res,
        _$FileInformationResultImpl>
    implements _$$FileInformationResultImplCopyWith<$Res> {
  __$$FileInformationResultImplCopyWithImpl(_$FileInformationResultImpl _value,
      $Res Function(_$FileInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherManual = null,
    Object? schoolLetter = null,
  }) {
    return _then(_$FileInformationResultImpl(
      teacherManual: null == teacherManual
          ? _value.teacherManual
          : teacherManual // ignore: cast_nullable_to_non_nullable
              as String,
      schoolLetter: null == schoolLetter
          ? _value.schoolLetter
          : schoolLetter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileInformationResultImpl implements _FileInformationResult {
  _$FileInformationResultImpl(
      {@JsonKey(name: 'teacher_manual') this.teacherManual = "",
      @JsonKey(name: 'school_letter') this.schoolLetter = ""});

  factory _$FileInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileInformationResultImplFromJson(json);

  @override
  @JsonKey(name: 'teacher_manual')
  final String teacherManual;
  @override
  @JsonKey(name: 'school_letter')
  final String schoolLetter;

  @override
  String toString() {
    return 'FileInformationResult(teacherManual: $teacherManual, schoolLetter: $schoolLetter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileInformationResultImpl &&
            (identical(other.teacherManual, teacherManual) ||
                other.teacherManual == teacherManual) &&
            (identical(other.schoolLetter, schoolLetter) ||
                other.schoolLetter == schoolLetter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teacherManual, schoolLetter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileInformationResultImplCopyWith<_$FileInformationResultImpl>
      get copyWith => __$$FileInformationResultImplCopyWithImpl<
          _$FileInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileInformationResultImplToJson(
      this,
    );
  }
}

abstract class _FileInformationResult implements FileInformationResult {
  factory _FileInformationResult(
          {@JsonKey(name: 'teacher_manual') final String teacherManual,
          @JsonKey(name: 'school_letter') final String schoolLetter}) =
      _$FileInformationResultImpl;

  factory _FileInformationResult.fromJson(Map<String, dynamic> json) =
      _$FileInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'teacher_manual')
  String get teacherManual;
  @override
  @JsonKey(name: 'school_letter')
  String get schoolLetter;
  @override
  @JsonKey(ignore: true)
  _$$FileInformationResultImplCopyWith<_$FileInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
