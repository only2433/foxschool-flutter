// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CommonAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommonAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loadingState,
    required TResult Function(String message) errorState,
    required TResult Function(bool isAutoRestart, String message)
        authenticationErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function()? loadingState,
    TResult? Function(String message)? errorState,
    TResult? Function(bool isAutoRestart, String message)?
        authenticationErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loadingState,
    TResult Function(String message)? errorState,
    TResult Function(bool isAutoRestart, String message)?
        authenticationErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitState value) initState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_AuthenticationErrorState value)
        authenticationErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitState value)? initState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_AuthenticationErrorState value)?
        authenticationErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitState value)? initState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_AuthenticationErrorState value)? authenticationErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonAPIStateCopyWith<$Res> {
  factory $CommonAPIStateCopyWith(
          CommonAPIState value, $Res Function(CommonAPIState) then) =
      _$CommonAPIStateCopyWithImpl<$Res, CommonAPIState>;
}

/// @nodoc
class _$CommonAPIStateCopyWithImpl<$Res, $Val extends CommonAPIState>
    implements $CommonAPIStateCopyWith<$Res> {
  _$CommonAPIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitStateImplCopyWith<$Res> {
  factory _$$InitStateImplCopyWith(
          _$InitStateImpl value, $Res Function(_$InitStateImpl) then) =
      __$$InitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitStateImplCopyWithImpl<$Res>
    extends _$CommonAPIStateCopyWithImpl<$Res, _$InitStateImpl>
    implements _$$InitStateImplCopyWith<$Res> {
  __$$InitStateImplCopyWithImpl(
      _$InitStateImpl _value, $Res Function(_$InitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitStateImpl implements _InitState {
  const _$InitStateImpl();

  @override
  String toString() {
    return 'CommonAPIState.initState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loadingState,
    required TResult Function(String message) errorState,
    required TResult Function(bool isAutoRestart, String message)
        authenticationErrorState,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function()? loadingState,
    TResult? Function(String message)? errorState,
    TResult? Function(bool isAutoRestart, String message)?
        authenticationErrorState,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loadingState,
    TResult Function(String message)? errorState,
    TResult Function(bool isAutoRestart, String message)?
        authenticationErrorState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitState value) initState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_AuthenticationErrorState value)
        authenticationErrorState,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitState value)? initState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_AuthenticationErrorState value)?
        authenticationErrorState,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitState value)? initState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_AuthenticationErrorState value)? authenticationErrorState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class _InitState implements CommonAPIState {
  const factory _InitState() = _$InitStateImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$CommonAPIStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'CommonAPIState.loadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loadingState,
    required TResult Function(String message) errorState,
    required TResult Function(bool isAutoRestart, String message)
        authenticationErrorState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function()? loadingState,
    TResult? Function(String message)? errorState,
    TResult? Function(bool isAutoRestart, String message)?
        authenticationErrorState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loadingState,
    TResult Function(String message)? errorState,
    TResult Function(bool isAutoRestart, String message)?
        authenticationErrorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitState value) initState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_AuthenticationErrorState value)
        authenticationErrorState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitState value)? initState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_AuthenticationErrorState value)?
        authenticationErrorState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitState value)? initState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_AuthenticationErrorState value)? authenticationErrorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements CommonAPIState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$CommonAPIStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CommonAPIState.errorState(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loadingState,
    required TResult Function(String message) errorState,
    required TResult Function(bool isAutoRestart, String message)
        authenticationErrorState,
  }) {
    return errorState(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function()? loadingState,
    TResult? Function(String message)? errorState,
    TResult? Function(bool isAutoRestart, String message)?
        authenticationErrorState,
  }) {
    return errorState?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loadingState,
    TResult Function(String message)? errorState,
    TResult Function(bool isAutoRestart, String message)?
        authenticationErrorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitState value) initState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_AuthenticationErrorState value)
        authenticationErrorState,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitState value)? initState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_AuthenticationErrorState value)?
        authenticationErrorState,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitState value)? initState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_AuthenticationErrorState value)? authenticationErrorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements CommonAPIState {
  const factory _ErrorState(final String message) = _$ErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationErrorStateImplCopyWith<$Res> {
  factory _$$AuthenticationErrorStateImplCopyWith(
          _$AuthenticationErrorStateImpl value,
          $Res Function(_$AuthenticationErrorStateImpl) then) =
      __$$AuthenticationErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAutoRestart, String message});
}

/// @nodoc
class __$$AuthenticationErrorStateImplCopyWithImpl<$Res>
    extends _$CommonAPIStateCopyWithImpl<$Res, _$AuthenticationErrorStateImpl>
    implements _$$AuthenticationErrorStateImplCopyWith<$Res> {
  __$$AuthenticationErrorStateImplCopyWithImpl(
      _$AuthenticationErrorStateImpl _value,
      $Res Function(_$AuthenticationErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoRestart = null,
    Object? message = null,
  }) {
    return _then(_$AuthenticationErrorStateImpl(
      null == isAutoRestart
          ? _value.isAutoRestart
          : isAutoRestart // ignore: cast_nullable_to_non_nullable
              as bool,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationErrorStateImpl implements _AuthenticationErrorState {
  const _$AuthenticationErrorStateImpl(this.isAutoRestart, this.message);

  @override
  final bool isAutoRestart;
  @override
  final String message;

  @override
  String toString() {
    return 'CommonAPIState.authenticationErrorState(isAutoRestart: $isAutoRestart, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationErrorStateImpl &&
            (identical(other.isAutoRestart, isAutoRestart) ||
                other.isAutoRestart == isAutoRestart) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAutoRestart, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationErrorStateImplCopyWith<_$AuthenticationErrorStateImpl>
      get copyWith => __$$AuthenticationErrorStateImplCopyWithImpl<
          _$AuthenticationErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loadingState,
    required TResult Function(String message) errorState,
    required TResult Function(bool isAutoRestart, String message)
        authenticationErrorState,
  }) {
    return authenticationErrorState(isAutoRestart, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initState,
    TResult? Function()? loadingState,
    TResult? Function(String message)? errorState,
    TResult? Function(bool isAutoRestart, String message)?
        authenticationErrorState,
  }) {
    return authenticationErrorState?.call(isAutoRestart, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loadingState,
    TResult Function(String message)? errorState,
    TResult Function(bool isAutoRestart, String message)?
        authenticationErrorState,
    required TResult orElse(),
  }) {
    if (authenticationErrorState != null) {
      return authenticationErrorState(isAutoRestart, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitState value) initState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_AuthenticationErrorState value)
        authenticationErrorState,
  }) {
    return authenticationErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitState value)? initState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_AuthenticationErrorState value)?
        authenticationErrorState,
  }) {
    return authenticationErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitState value)? initState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_AuthenticationErrorState value)? authenticationErrorState,
    required TResult orElse(),
  }) {
    if (authenticationErrorState != null) {
      return authenticationErrorState(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationErrorState implements CommonAPIState {
  const factory _AuthenticationErrorState(
          final bool isAutoRestart, final String message) =
      _$AuthenticationErrorStateImpl;

  bool get isAutoRestart;
  String get message;
  @JsonKey(ignore: true)
  _$$AuthenticationErrorStateImplCopyWith<_$AuthenticationErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
