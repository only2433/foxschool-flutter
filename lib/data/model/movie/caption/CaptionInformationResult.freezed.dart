// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CaptionInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaptionInformationResult _$CaptionInformationResultFromJson(
    Map<String, dynamic> json) {
  return _CaptionInformationResult.fromJson(json);
}

/// @nodoc
mixin _$CaptionInformationResult {
  @JsonKey(name: 'start_time')
  int get startTime => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  int get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_number')
  int get pageByPageIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaptionInformationResultCopyWith<CaptionInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaptionInformationResultCopyWith<$Res> {
  factory $CaptionInformationResultCopyWith(CaptionInformationResult value,
          $Res Function(CaptionInformationResult) then) =
      _$CaptionInformationResultCopyWithImpl<$Res, CaptionInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_time') int startTime,
      String text,
      @JsonKey(name: 'end_time') int endTime,
      @JsonKey(name: 'group_number') int pageByPageIndex});
}

/// @nodoc
class _$CaptionInformationResultCopyWithImpl<$Res,
        $Val extends CaptionInformationResult>
    implements $CaptionInformationResultCopyWith<$Res> {
  _$CaptionInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? text = null,
    Object? endTime = null,
    Object? pageByPageIndex = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      pageByPageIndex: null == pageByPageIndex
          ? _value.pageByPageIndex
          : pageByPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaptionInformationResultImplCopyWith<$Res>
    implements $CaptionInformationResultCopyWith<$Res> {
  factory _$$CaptionInformationResultImplCopyWith(
          _$CaptionInformationResultImpl value,
          $Res Function(_$CaptionInformationResultImpl) then) =
      __$$CaptionInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_time') int startTime,
      String text,
      @JsonKey(name: 'end_time') int endTime,
      @JsonKey(name: 'group_number') int pageByPageIndex});
}

/// @nodoc
class __$$CaptionInformationResultImplCopyWithImpl<$Res>
    extends _$CaptionInformationResultCopyWithImpl<$Res,
        _$CaptionInformationResultImpl>
    implements _$$CaptionInformationResultImplCopyWith<$Res> {
  __$$CaptionInformationResultImplCopyWithImpl(
      _$CaptionInformationResultImpl _value,
      $Res Function(_$CaptionInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? text = null,
    Object? endTime = null,
    Object? pageByPageIndex = null,
  }) {
    return _then(_$CaptionInformationResultImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      pageByPageIndex: null == pageByPageIndex
          ? _value.pageByPageIndex
          : pageByPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaptionInformationResultImpl implements _CaptionInformationResult {
  _$CaptionInformationResultImpl(
      {@JsonKey(name: 'start_time') this.startTime = 0,
      this.text = "",
      @JsonKey(name: 'end_time') this.endTime = 0,
      @JsonKey(name: 'group_number') this.pageByPageIndex = 0});

  factory _$CaptionInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaptionInformationResultImplFromJson(json);

  @override
  @JsonKey(name: 'start_time')
  final int startTime;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey(name: 'end_time')
  final int endTime;
  @override
  @JsonKey(name: 'group_number')
  final int pageByPageIndex;

  @override
  String toString() {
    return 'CaptionInformationResult(startTime: $startTime, text: $text, endTime: $endTime, pageByPageIndex: $pageByPageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaptionInformationResultImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.pageByPageIndex, pageByPageIndex) ||
                other.pageByPageIndex == pageByPageIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, text, endTime, pageByPageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaptionInformationResultImplCopyWith<_$CaptionInformationResultImpl>
      get copyWith => __$$CaptionInformationResultImplCopyWithImpl<
          _$CaptionInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaptionInformationResultImplToJson(
      this,
    );
  }
}

abstract class _CaptionInformationResult implements CaptionInformationResult {
  factory _CaptionInformationResult(
          {@JsonKey(name: 'start_time') final int startTime,
          final String text,
          @JsonKey(name: 'end_time') final int endTime,
          @JsonKey(name: 'group_number') final int pageByPageIndex}) =
      _$CaptionInformationResultImpl;

  factory _CaptionInformationResult.fromJson(Map<String, dynamic> json) =
      _$CaptionInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'start_time')
  int get startTime;
  @override
  String get text;
  @override
  @JsonKey(name: 'end_time')
  int get endTime;
  @override
  @JsonKey(name: 'group_number')
  int get pageByPageIndex;
  @override
  @JsonKey(ignore: true)
  _$$CaptionInformationResultImplCopyWith<_$CaptionInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
