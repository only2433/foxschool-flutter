// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(QuizInformationResult data) contentsLoadedState,
    required TResult Function() saveQuizSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(QuizInformationResult data)? contentsLoadedState,
    TResult? Function()? saveQuizSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(QuizInformationResult data)? contentsLoadedState,
    TResult Function()? saveQuizSuccessState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
    required TResult Function(_SaveQuizSuccessState value) saveQuizSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult? Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAPIStateCopyWith<$Res> {
  factory $QuizAPIStateCopyWith(
          QuizAPIState value, $Res Function(QuizAPIState) then) =
      _$QuizAPIStateCopyWithImpl<$Res, QuizAPIState>;
}

/// @nodoc
class _$QuizAPIStateCopyWithImpl<$Res, $Val extends QuizAPIState>
    implements $QuizAPIStateCopyWith<$Res> {
  _$QuizAPIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CommonImplCopyWith<$Res> {
  factory _$$CommonImplCopyWith(
          _$CommonImpl value, $Res Function(_$CommonImpl) then) =
      __$$CommonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonAPIState state});

  $CommonAPIStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CommonImplCopyWithImpl<$Res>
    extends _$QuizAPIStateCopyWithImpl<$Res, _$CommonImpl>
    implements _$$CommonImplCopyWith<$Res> {
  __$$CommonImplCopyWithImpl(
      _$CommonImpl _value, $Res Function(_$CommonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$CommonImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CommonAPIState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonAPIStateCopyWith<$Res> get state {
    return $CommonAPIStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$CommonImpl implements _Common {
  const _$CommonImpl(this.state);

  @override
  final CommonAPIState state;

  @override
  String toString() {
    return 'QuizAPIState.common(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      __$$CommonImplCopyWithImpl<_$CommonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(QuizInformationResult data) contentsLoadedState,
    required TResult Function() saveQuizSuccessState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(QuizInformationResult data)? contentsLoadedState,
    TResult? Function()? saveQuizSuccessState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(QuizInformationResult data)? contentsLoadedState,
    TResult Function()? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
    required TResult Function(_SaveQuizSuccessState value) saveQuizSuccessState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult? Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements QuizAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentsLoadedStateImplCopyWith<$Res> {
  factory _$$ContentsLoadedStateImplCopyWith(_$ContentsLoadedStateImpl value,
          $Res Function(_$ContentsLoadedStateImpl) then) =
      __$$ContentsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuizInformationResult data});

  $QuizInformationResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$ContentsLoadedStateImplCopyWithImpl<$Res>
    extends _$QuizAPIStateCopyWithImpl<$Res, _$ContentsLoadedStateImpl>
    implements _$$ContentsLoadedStateImplCopyWith<$Res> {
  __$$ContentsLoadedStateImplCopyWithImpl(_$ContentsLoadedStateImpl _value,
      $Res Function(_$ContentsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ContentsLoadedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as QuizInformationResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizInformationResultCopyWith<$Res> get data {
    return $QuizInformationResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$ContentsLoadedStateImpl implements _ContentsLoadedState {
  const _$ContentsLoadedStateImpl(this.data);

  @override
  final QuizInformationResult data;

  @override
  String toString() {
    return 'QuizAPIState.contentsLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsLoadedStateImplCopyWith<_$ContentsLoadedStateImpl> get copyWith =>
      __$$ContentsLoadedStateImplCopyWithImpl<_$ContentsLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(QuizInformationResult data) contentsLoadedState,
    required TResult Function() saveQuizSuccessState,
  }) {
    return contentsLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(QuizInformationResult data)? contentsLoadedState,
    TResult? Function()? saveQuizSuccessState,
  }) {
    return contentsLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(QuizInformationResult data)? contentsLoadedState,
    TResult Function()? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (contentsLoadedState != null) {
      return contentsLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
    required TResult Function(_SaveQuizSuccessState value) saveQuizSuccessState,
  }) {
    return contentsLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult? Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
  }) {
    return contentsLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (contentsLoadedState != null) {
      return contentsLoadedState(this);
    }
    return orElse();
  }
}

abstract class _ContentsLoadedState implements QuizAPIState {
  const factory _ContentsLoadedState(final QuizInformationResult data) =
      _$ContentsLoadedStateImpl;

  QuizInformationResult get data;
  @JsonKey(ignore: true)
  _$$ContentsLoadedStateImplCopyWith<_$ContentsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveQuizSuccessStateImplCopyWith<$Res> {
  factory _$$SaveQuizSuccessStateImplCopyWith(_$SaveQuizSuccessStateImpl value,
          $Res Function(_$SaveQuizSuccessStateImpl) then) =
      __$$SaveQuizSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveQuizSuccessStateImplCopyWithImpl<$Res>
    extends _$QuizAPIStateCopyWithImpl<$Res, _$SaveQuizSuccessStateImpl>
    implements _$$SaveQuizSuccessStateImplCopyWith<$Res> {
  __$$SaveQuizSuccessStateImplCopyWithImpl(_$SaveQuizSuccessStateImpl _value,
      $Res Function(_$SaveQuizSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveQuizSuccessStateImpl implements _SaveQuizSuccessState {
  const _$SaveQuizSuccessStateImpl();

  @override
  String toString() {
    return 'QuizAPIState.saveQuizSuccessState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveQuizSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(QuizInformationResult data) contentsLoadedState,
    required TResult Function() saveQuizSuccessState,
  }) {
    return saveQuizSuccessState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(QuizInformationResult data)? contentsLoadedState,
    TResult? Function()? saveQuizSuccessState,
  }) {
    return saveQuizSuccessState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(QuizInformationResult data)? contentsLoadedState,
    TResult Function()? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (saveQuizSuccessState != null) {
      return saveQuizSuccessState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
    required TResult Function(_SaveQuizSuccessState value) saveQuizSuccessState,
  }) {
    return saveQuizSuccessState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult? Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
  }) {
    return saveQuizSuccessState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    TResult Function(_SaveQuizSuccessState value)? saveQuizSuccessState,
    required TResult orElse(),
  }) {
    if (saveQuizSuccessState != null) {
      return saveQuizSuccessState(this);
    }
    return orElse();
  }
}

abstract class _SaveQuizSuccessState implements QuizAPIState {
  const factory _SaveQuizSuccessState() = _$SaveQuizSuccessStateImpl;
}
