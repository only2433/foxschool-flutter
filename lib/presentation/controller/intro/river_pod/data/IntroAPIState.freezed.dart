// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'IntroAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(VersionDataResult data) versionLoadedState,
    required TResult Function(LoginInformationResult data) authMeLoadedState,
    required TResult Function(MainInformationResult data) mainLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(VersionDataResult data)? versionLoadedState,
    TResult? Function(LoginInformationResult data)? authMeLoadedState,
    TResult? Function(MainInformationResult data)? mainLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(VersionDataResult data)? versionLoadedState,
    TResult Function(LoginInformationResult data)? authMeLoadedState,
    TResult Function(MainInformationResult data)? mainLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VersionLoadedState value) versionLoadedState,
    required TResult Function(_AuthMeLoadedState value) authMeLoadedState,
    required TResult Function(_MainLoadedState value) mainLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VersionLoadedState value)? versionLoadedState,
    TResult? Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult? Function(_MainLoadedState value)? mainLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VersionLoadedState value)? versionLoadedState,
    TResult Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult Function(_MainLoadedState value)? mainLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroAPIStateCopyWith<$Res> {
  factory $IntroAPIStateCopyWith(
          IntroAPIState value, $Res Function(IntroAPIState) then) =
      _$IntroAPIStateCopyWithImpl<$Res, IntroAPIState>;
}

/// @nodoc
class _$IntroAPIStateCopyWithImpl<$Res, $Val extends IntroAPIState>
    implements $IntroAPIStateCopyWith<$Res> {
  _$IntroAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$IntroAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'IntroAPIState.common(state: $state)';
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
    required TResult Function(VersionDataResult data) versionLoadedState,
    required TResult Function(LoginInformationResult data) authMeLoadedState,
    required TResult Function(MainInformationResult data) mainLoadedState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(VersionDataResult data)? versionLoadedState,
    TResult? Function(LoginInformationResult data)? authMeLoadedState,
    TResult? Function(MainInformationResult data)? mainLoadedState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(VersionDataResult data)? versionLoadedState,
    TResult Function(LoginInformationResult data)? authMeLoadedState,
    TResult Function(MainInformationResult data)? mainLoadedState,
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
    required TResult Function(_VersionLoadedState value) versionLoadedState,
    required TResult Function(_AuthMeLoadedState value) authMeLoadedState,
    required TResult Function(_MainLoadedState value) mainLoadedState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VersionLoadedState value)? versionLoadedState,
    TResult? Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult? Function(_MainLoadedState value)? mainLoadedState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VersionLoadedState value)? versionLoadedState,
    TResult Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult Function(_MainLoadedState value)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements IntroAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VersionLoadedStateImplCopyWith<$Res> {
  factory _$$VersionLoadedStateImplCopyWith(_$VersionLoadedStateImpl value,
          $Res Function(_$VersionLoadedStateImpl) then) =
      __$$VersionLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VersionDataResult data});

  $VersionDataResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$VersionLoadedStateImplCopyWithImpl<$Res>
    extends _$IntroAPIStateCopyWithImpl<$Res, _$VersionLoadedStateImpl>
    implements _$$VersionLoadedStateImplCopyWith<$Res> {
  __$$VersionLoadedStateImplCopyWithImpl(_$VersionLoadedStateImpl _value,
      $Res Function(_$VersionLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VersionLoadedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VersionDataResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $VersionDataResultCopyWith<$Res> get data {
    return $VersionDataResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$VersionLoadedStateImpl implements _VersionLoadedState {
  const _$VersionLoadedStateImpl(this.data);

  @override
  final VersionDataResult data;

  @override
  String toString() {
    return 'IntroAPIState.versionLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionLoadedStateImplCopyWith<_$VersionLoadedStateImpl> get copyWith =>
      __$$VersionLoadedStateImplCopyWithImpl<_$VersionLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(VersionDataResult data) versionLoadedState,
    required TResult Function(LoginInformationResult data) authMeLoadedState,
    required TResult Function(MainInformationResult data) mainLoadedState,
  }) {
    return versionLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(VersionDataResult data)? versionLoadedState,
    TResult? Function(LoginInformationResult data)? authMeLoadedState,
    TResult? Function(MainInformationResult data)? mainLoadedState,
  }) {
    return versionLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(VersionDataResult data)? versionLoadedState,
    TResult Function(LoginInformationResult data)? authMeLoadedState,
    TResult Function(MainInformationResult data)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (versionLoadedState != null) {
      return versionLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VersionLoadedState value) versionLoadedState,
    required TResult Function(_AuthMeLoadedState value) authMeLoadedState,
    required TResult Function(_MainLoadedState value) mainLoadedState,
  }) {
    return versionLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VersionLoadedState value)? versionLoadedState,
    TResult? Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult? Function(_MainLoadedState value)? mainLoadedState,
  }) {
    return versionLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VersionLoadedState value)? versionLoadedState,
    TResult Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult Function(_MainLoadedState value)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (versionLoadedState != null) {
      return versionLoadedState(this);
    }
    return orElse();
  }
}

abstract class _VersionLoadedState implements IntroAPIState {
  const factory _VersionLoadedState(final VersionDataResult data) =
      _$VersionLoadedStateImpl;

  VersionDataResult get data;
  @JsonKey(ignore: true)
  _$$VersionLoadedStateImplCopyWith<_$VersionLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthMeLoadedStateImplCopyWith<$Res> {
  factory _$$AuthMeLoadedStateImplCopyWith(_$AuthMeLoadedStateImpl value,
          $Res Function(_$AuthMeLoadedStateImpl) then) =
      __$$AuthMeLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginInformationResult data});

  $LoginInformationResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$AuthMeLoadedStateImplCopyWithImpl<$Res>
    extends _$IntroAPIStateCopyWithImpl<$Res, _$AuthMeLoadedStateImpl>
    implements _$$AuthMeLoadedStateImplCopyWith<$Res> {
  __$$AuthMeLoadedStateImplCopyWithImpl(_$AuthMeLoadedStateImpl _value,
      $Res Function(_$AuthMeLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AuthMeLoadedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginInformationResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginInformationResultCopyWith<$Res> get data {
    return $LoginInformationResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$AuthMeLoadedStateImpl implements _AuthMeLoadedState {
  const _$AuthMeLoadedStateImpl(this.data);

  @override
  final LoginInformationResult data;

  @override
  String toString() {
    return 'IntroAPIState.authMeLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthMeLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthMeLoadedStateImplCopyWith<_$AuthMeLoadedStateImpl> get copyWith =>
      __$$AuthMeLoadedStateImplCopyWithImpl<_$AuthMeLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(VersionDataResult data) versionLoadedState,
    required TResult Function(LoginInformationResult data) authMeLoadedState,
    required TResult Function(MainInformationResult data) mainLoadedState,
  }) {
    return authMeLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(VersionDataResult data)? versionLoadedState,
    TResult? Function(LoginInformationResult data)? authMeLoadedState,
    TResult? Function(MainInformationResult data)? mainLoadedState,
  }) {
    return authMeLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(VersionDataResult data)? versionLoadedState,
    TResult Function(LoginInformationResult data)? authMeLoadedState,
    TResult Function(MainInformationResult data)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (authMeLoadedState != null) {
      return authMeLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VersionLoadedState value) versionLoadedState,
    required TResult Function(_AuthMeLoadedState value) authMeLoadedState,
    required TResult Function(_MainLoadedState value) mainLoadedState,
  }) {
    return authMeLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VersionLoadedState value)? versionLoadedState,
    TResult? Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult? Function(_MainLoadedState value)? mainLoadedState,
  }) {
    return authMeLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VersionLoadedState value)? versionLoadedState,
    TResult Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult Function(_MainLoadedState value)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (authMeLoadedState != null) {
      return authMeLoadedState(this);
    }
    return orElse();
  }
}

abstract class _AuthMeLoadedState implements IntroAPIState {
  const factory _AuthMeLoadedState(final LoginInformationResult data) =
      _$AuthMeLoadedStateImpl;

  LoginInformationResult get data;
  @JsonKey(ignore: true)
  _$$AuthMeLoadedStateImplCopyWith<_$AuthMeLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainLoadedStateImplCopyWith<$Res> {
  factory _$$MainLoadedStateImplCopyWith(_$MainLoadedStateImpl value,
          $Res Function(_$MainLoadedStateImpl) then) =
      __$$MainLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MainInformationResult data});

  $MainInformationResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$MainLoadedStateImplCopyWithImpl<$Res>
    extends _$IntroAPIStateCopyWithImpl<$Res, _$MainLoadedStateImpl>
    implements _$$MainLoadedStateImplCopyWith<$Res> {
  __$$MainLoadedStateImplCopyWithImpl(
      _$MainLoadedStateImpl _value, $Res Function(_$MainLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MainLoadedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MainInformationResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MainInformationResultCopyWith<$Res> get data {
    return $MainInformationResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$MainLoadedStateImpl implements _MainLoadedState {
  const _$MainLoadedStateImpl(this.data);

  @override
  final MainInformationResult data;

  @override
  String toString() {
    return 'IntroAPIState.mainLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainLoadedStateImplCopyWith<_$MainLoadedStateImpl> get copyWith =>
      __$$MainLoadedStateImplCopyWithImpl<_$MainLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(VersionDataResult data) versionLoadedState,
    required TResult Function(LoginInformationResult data) authMeLoadedState,
    required TResult Function(MainInformationResult data) mainLoadedState,
  }) {
    return mainLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(VersionDataResult data)? versionLoadedState,
    TResult? Function(LoginInformationResult data)? authMeLoadedState,
    TResult? Function(MainInformationResult data)? mainLoadedState,
  }) {
    return mainLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(VersionDataResult data)? versionLoadedState,
    TResult Function(LoginInformationResult data)? authMeLoadedState,
    TResult Function(MainInformationResult data)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (mainLoadedState != null) {
      return mainLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VersionLoadedState value) versionLoadedState,
    required TResult Function(_AuthMeLoadedState value) authMeLoadedState,
    required TResult Function(_MainLoadedState value) mainLoadedState,
  }) {
    return mainLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VersionLoadedState value)? versionLoadedState,
    TResult? Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult? Function(_MainLoadedState value)? mainLoadedState,
  }) {
    return mainLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VersionLoadedState value)? versionLoadedState,
    TResult Function(_AuthMeLoadedState value)? authMeLoadedState,
    TResult Function(_MainLoadedState value)? mainLoadedState,
    required TResult orElse(),
  }) {
    if (mainLoadedState != null) {
      return mainLoadedState(this);
    }
    return orElse();
  }
}

abstract class _MainLoadedState implements IntroAPIState {
  const factory _MainLoadedState(final MainInformationResult data) =
      _$MainLoadedStateImpl;

  MainInformationResult get data;
  @JsonKey(ignore: true)
  _$$MainLoadedStateImplCopyWith<_$MainLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
