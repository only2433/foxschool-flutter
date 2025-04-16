// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MovieTaskState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieTaskState {
  double get seekbarProgress => throw _privateConstructorUsedError;
  String get currentDuration => throw _privateConstructorUsedError;
  String get maxDuration => throw _privateConstructorUsedError;
  String get captionText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieTaskStateCopyWith<MovieTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieTaskStateCopyWith<$Res> {
  factory $MovieTaskStateCopyWith(
          MovieTaskState value, $Res Function(MovieTaskState) then) =
      _$MovieTaskStateCopyWithImpl<$Res, MovieTaskState>;
  @useResult
  $Res call(
      {double seekbarProgress,
      String currentDuration,
      String maxDuration,
      String captionText});
}

/// @nodoc
class _$MovieTaskStateCopyWithImpl<$Res, $Val extends MovieTaskState>
    implements $MovieTaskStateCopyWith<$Res> {
  _$MovieTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seekbarProgress = null,
    Object? currentDuration = null,
    Object? maxDuration = null,
    Object? captionText = null,
  }) {
    return _then(_value.copyWith(
      seekbarProgress: null == seekbarProgress
          ? _value.seekbarProgress
          : seekbarProgress // ignore: cast_nullable_to_non_nullable
              as double,
      currentDuration: null == currentDuration
          ? _value.currentDuration
          : currentDuration // ignore: cast_nullable_to_non_nullable
              as String,
      maxDuration: null == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as String,
      captionText: null == captionText
          ? _value.captionText
          : captionText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieTaskStateImplCopyWith<$Res>
    implements $MovieTaskStateCopyWith<$Res> {
  factory _$$MovieTaskStateImplCopyWith(_$MovieTaskStateImpl value,
          $Res Function(_$MovieTaskStateImpl) then) =
      __$$MovieTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double seekbarProgress,
      String currentDuration,
      String maxDuration,
      String captionText});
}

/// @nodoc
class __$$MovieTaskStateImplCopyWithImpl<$Res>
    extends _$MovieTaskStateCopyWithImpl<$Res, _$MovieTaskStateImpl>
    implements _$$MovieTaskStateImplCopyWith<$Res> {
  __$$MovieTaskStateImplCopyWithImpl(
      _$MovieTaskStateImpl _value, $Res Function(_$MovieTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seekbarProgress = null,
    Object? currentDuration = null,
    Object? maxDuration = null,
    Object? captionText = null,
  }) {
    return _then(_$MovieTaskStateImpl(
      seekbarProgress: null == seekbarProgress
          ? _value.seekbarProgress
          : seekbarProgress // ignore: cast_nullable_to_non_nullable
              as double,
      currentDuration: null == currentDuration
          ? _value.currentDuration
          : currentDuration // ignore: cast_nullable_to_non_nullable
              as String,
      maxDuration: null == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as String,
      captionText: null == captionText
          ? _value.captionText
          : captionText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieTaskStateImpl implements _MovieTaskState {
  _$MovieTaskStateImpl(
      {required this.seekbarProgress,
      required this.currentDuration,
      required this.maxDuration,
      required this.captionText});

  @override
  final double seekbarProgress;
  @override
  final String currentDuration;
  @override
  final String maxDuration;
  @override
  final String captionText;

  @override
  String toString() {
    return 'MovieTaskState(seekbarProgress: $seekbarProgress, currentDuration: $currentDuration, maxDuration: $maxDuration, captionText: $captionText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieTaskStateImpl &&
            (identical(other.seekbarProgress, seekbarProgress) ||
                other.seekbarProgress == seekbarProgress) &&
            (identical(other.currentDuration, currentDuration) ||
                other.currentDuration == currentDuration) &&
            (identical(other.maxDuration, maxDuration) ||
                other.maxDuration == maxDuration) &&
            (identical(other.captionText, captionText) ||
                other.captionText == captionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, seekbarProgress, currentDuration, maxDuration, captionText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieTaskStateImplCopyWith<_$MovieTaskStateImpl> get copyWith =>
      __$$MovieTaskStateImplCopyWithImpl<_$MovieTaskStateImpl>(
          this, _$identity);
}

abstract class _MovieTaskState implements MovieTaskState {
  factory _MovieTaskState(
      {required final double seekbarProgress,
      required final String currentDuration,
      required final String maxDuration,
      required final String captionText}) = _$MovieTaskStateImpl;

  @override
  double get seekbarProgress;
  @override
  String get currentDuration;
  @override
  String get maxDuration;
  @override
  String get captionText;
  @override
  @JsonKey(ignore: true)
  _$$MovieTaskStateImplCopyWith<_$MovieTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
