// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'IntroUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroUIState {
  IntroScreenType get type => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroUIStateCopyWith<IntroUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroUIStateCopyWith<$Res> {
  factory $IntroUIStateCopyWith(
          IntroUIState value, $Res Function(IntroUIState) then) =
      _$IntroUIStateCopyWithImpl<$Res, IntroUIState>;
  @useResult
  $Res call({IntroScreenType type, double percent});
}

/// @nodoc
class _$IntroUIStateCopyWithImpl<$Res, $Val extends IntroUIState>
    implements $IntroUIStateCopyWith<$Res> {
  _$IntroUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? percent = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IntroScreenType,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroUIStateImplCopyWith<$Res>
    implements $IntroUIStateCopyWith<$Res> {
  factory _$$IntroUIStateImplCopyWith(
          _$IntroUIStateImpl value, $Res Function(_$IntroUIStateImpl) then) =
      __$$IntroUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IntroScreenType type, double percent});
}

/// @nodoc
class __$$IntroUIStateImplCopyWithImpl<$Res>
    extends _$IntroUIStateCopyWithImpl<$Res, _$IntroUIStateImpl>
    implements _$$IntroUIStateImplCopyWith<$Res> {
  __$$IntroUIStateImplCopyWithImpl(
      _$IntroUIStateImpl _value, $Res Function(_$IntroUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? percent = null,
  }) {
    return _then(_$IntroUIStateImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IntroScreenType,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$IntroUIStateImpl implements _IntroUIState {
  _$IntroUIStateImpl({required this.type, required this.percent});

  @override
  final IntroScreenType type;
  @override
  final double percent;

  @override
  String toString() {
    return 'IntroUIState(type: $type, percent: $percent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroUIStateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroUIStateImplCopyWith<_$IntroUIStateImpl> get copyWith =>
      __$$IntroUIStateImplCopyWithImpl<_$IntroUIStateImpl>(this, _$identity);
}

abstract class _IntroUIState implements IntroUIState {
  factory _IntroUIState(
      {required final IntroScreenType type,
      required final double percent}) = _$IntroUIStateImpl;

  @override
  IntroScreenType get type;
  @override
  double get percent;
  @override
  @JsonKey(ignore: true)
  _$$IntroUIStateImplCopyWith<_$IntroUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
