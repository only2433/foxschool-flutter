// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizTaskState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizTaskState {
  String get remainTimeText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizTaskStateCopyWith<QuizTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizTaskStateCopyWith<$Res> {
  factory $QuizTaskStateCopyWith(
          QuizTaskState value, $Res Function(QuizTaskState) then) =
      _$QuizTaskStateCopyWithImpl<$Res, QuizTaskState>;
  @useResult
  $Res call({String remainTimeText});
}

/// @nodoc
class _$QuizTaskStateCopyWithImpl<$Res, $Val extends QuizTaskState>
    implements $QuizTaskStateCopyWith<$Res> {
  _$QuizTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainTimeText = null,
  }) {
    return _then(_value.copyWith(
      remainTimeText: null == remainTimeText
          ? _value.remainTimeText
          : remainTimeText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizTaskStateImplCopyWith<$Res>
    implements $QuizTaskStateCopyWith<$Res> {
  factory _$$QuizTaskStateImplCopyWith(
          _$QuizTaskStateImpl value, $Res Function(_$QuizTaskStateImpl) then) =
      __$$QuizTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remainTimeText});
}

/// @nodoc
class __$$QuizTaskStateImplCopyWithImpl<$Res>
    extends _$QuizTaskStateCopyWithImpl<$Res, _$QuizTaskStateImpl>
    implements _$$QuizTaskStateImplCopyWith<$Res> {
  __$$QuizTaskStateImplCopyWithImpl(
      _$QuizTaskStateImpl _value, $Res Function(_$QuizTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainTimeText = null,
  }) {
    return _then(_$QuizTaskStateImpl(
      remainTimeText: null == remainTimeText
          ? _value.remainTimeText
          : remainTimeText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuizTaskStateImpl implements _QuizTaskState {
  _$QuizTaskStateImpl({required this.remainTimeText});

  @override
  final String remainTimeText;

  @override
  String toString() {
    return 'QuizTaskState(remainTimeText: $remainTimeText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizTaskStateImpl &&
            (identical(other.remainTimeText, remainTimeText) ||
                other.remainTimeText == remainTimeText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainTimeText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizTaskStateImplCopyWith<_$QuizTaskStateImpl> get copyWith =>
      __$$QuizTaskStateImplCopyWithImpl<_$QuizTaskStateImpl>(this, _$identity);
}

abstract class _QuizTaskState implements QuizTaskState {
  factory _QuizTaskState({required final String remainTimeText}) =
      _$QuizTaskStateImpl;

  @override
  String get remainTimeText;
  @override
  @JsonKey(ignore: true)
  _$$QuizTaskStateImplCopyWith<_$QuizTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
