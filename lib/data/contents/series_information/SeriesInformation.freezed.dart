// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SeriesInformation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeriesInformation _$SeriesInformationFromJson(Map<String, dynamic> json) {
  return _SeriesInformation.fromJson(json);
}

/// @nodoc
mixin _$SeriesInformation {
  String get id => throw _privateConstructorUsedError;
  String get is_single => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'contents_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ar_level')
  double get ARLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesInformationCopyWith<SeriesInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesInformationCopyWith<$Res> {
  factory $SeriesInformationCopyWith(
          SeriesInformation value, $Res Function(SeriesInformation) then) =
      _$SeriesInformationCopyWithImpl<$Res, SeriesInformation>;
  @useResult
  $Res call(
      {String id,
      String is_single,
      int level,
      @JsonKey(name: 'contents_count') int totalCount,
      @JsonKey(name: 'ar_level') double ARLevel});
}

/// @nodoc
class _$SeriesInformationCopyWithImpl<$Res, $Val extends SeriesInformation>
    implements $SeriesInformationCopyWith<$Res> {
  _$SeriesInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_single = null,
    Object? level = null,
    Object? totalCount = null,
    Object? ARLevel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      is_single: null == is_single
          ? _value.is_single
          : is_single // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      ARLevel: null == ARLevel
          ? _value.ARLevel
          : ARLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesInformationImplCopyWith<$Res>
    implements $SeriesInformationCopyWith<$Res> {
  factory _$$SeriesInformationImplCopyWith(_$SeriesInformationImpl value,
          $Res Function(_$SeriesInformationImpl) then) =
      __$$SeriesInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String is_single,
      int level,
      @JsonKey(name: 'contents_count') int totalCount,
      @JsonKey(name: 'ar_level') double ARLevel});
}

/// @nodoc
class __$$SeriesInformationImplCopyWithImpl<$Res>
    extends _$SeriesInformationCopyWithImpl<$Res, _$SeriesInformationImpl>
    implements _$$SeriesInformationImplCopyWith<$Res> {
  __$$SeriesInformationImplCopyWithImpl(_$SeriesInformationImpl _value,
      $Res Function(_$SeriesInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_single = null,
    Object? level = null,
    Object? totalCount = null,
    Object? ARLevel = null,
  }) {
    return _then(_$SeriesInformationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      is_single: null == is_single
          ? _value.is_single
          : is_single // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      ARLevel: null == ARLevel
          ? _value.ARLevel
          : ARLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesInformationImpl extends _SeriesInformation {
  _$SeriesInformationImpl(
      {this.id = "",
      this.is_single = "",
      this.level = -1,
      @JsonKey(name: 'contents_count') this.totalCount = 0,
      @JsonKey(name: 'ar_level') this.ARLevel = 0.0})
      : super._();

  factory _$SeriesInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesInformationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String is_single;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey(name: 'contents_count')
  final int totalCount;
  @override
  @JsonKey(name: 'ar_level')
  final double ARLevel;

  @override
  String toString() {
    return 'SeriesInformation(id: $id, is_single: $is_single, level: $level, totalCount: $totalCount, ARLevel: $ARLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesInformationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.is_single, is_single) ||
                other.is_single == is_single) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.ARLevel, ARLevel) || other.ARLevel == ARLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, is_single, level, totalCount, ARLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesInformationImplCopyWith<_$SeriesInformationImpl> get copyWith =>
      __$$SeriesInformationImplCopyWithImpl<_$SeriesInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesInformationImplToJson(
      this,
    );
  }
}

abstract class _SeriesInformation extends SeriesInformation {
  factory _SeriesInformation(
          {final String id,
          final String is_single,
          final int level,
          @JsonKey(name: 'contents_count') final int totalCount,
          @JsonKey(name: 'ar_level') final double ARLevel}) =
      _$SeriesInformationImpl;
  _SeriesInformation._() : super._();

  factory _SeriesInformation.fromJson(Map<String, dynamic> json) =
      _$SeriesInformationImpl.fromJson;

  @override
  String get id;
  @override
  String get is_single;
  @override
  int get level;
  @override
  @JsonKey(name: 'contents_count')
  int get totalCount;
  @override
  @JsonKey(name: 'ar_level')
  double get ARLevel;
  @override
  @JsonKey(ignore: true)
  _$$SeriesInformationImplCopyWith<_$SeriesInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
