// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<SchoolData> list) schoolDataLoadedState,
    required TResult Function(LoginInformationResult data) loginLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult? Function(LoginInformationResult data)? loginLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult Function(LoginInformationResult data)? loginLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SchoolDataLoadedState value)
        schoolDataLoadedState,
    required TResult Function(_LoginLoadedState value) loginLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult? Function(_LoginLoadedState value)? loginLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult Function(_LoginLoadedState value)? loginLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginAPIStateCopyWith<$Res> {
  factory $LoginAPIStateCopyWith(
          LoginAPIState value, $Res Function(LoginAPIState) then) =
      _$LoginAPIStateCopyWithImpl<$Res, LoginAPIState>;
}

/// @nodoc
class _$LoginAPIStateCopyWithImpl<$Res, $Val extends LoginAPIState>
    implements $LoginAPIStateCopyWith<$Res> {
  _$LoginAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$LoginAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'LoginAPIState.common(state: $state)';
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
    required TResult Function(List<SchoolData> list) schoolDataLoadedState,
    required TResult Function(LoginInformationResult data) loginLoadedState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult? Function(LoginInformationResult data)? loginLoadedState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult Function(LoginInformationResult data)? loginLoadedState,
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
    required TResult Function(_SchoolDataLoadedState value)
        schoolDataLoadedState,
    required TResult Function(_LoginLoadedState value) loginLoadedState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult? Function(_LoginLoadedState value)? loginLoadedState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult Function(_LoginLoadedState value)? loginLoadedState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements LoginAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SchoolDataLoadedStateImplCopyWith<$Res> {
  factory _$$SchoolDataLoadedStateImplCopyWith(
          _$SchoolDataLoadedStateImpl value,
          $Res Function(_$SchoolDataLoadedStateImpl) then) =
      __$$SchoolDataLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SchoolData> list});
}

/// @nodoc
class __$$SchoolDataLoadedStateImplCopyWithImpl<$Res>
    extends _$LoginAPIStateCopyWithImpl<$Res, _$SchoolDataLoadedStateImpl>
    implements _$$SchoolDataLoadedStateImplCopyWith<$Res> {
  __$$SchoolDataLoadedStateImplCopyWithImpl(_$SchoolDataLoadedStateImpl _value,
      $Res Function(_$SchoolDataLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$SchoolDataLoadedStateImpl(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SchoolData>,
    ));
  }
}

/// @nodoc

class _$SchoolDataLoadedStateImpl implements _SchoolDataLoadedState {
  const _$SchoolDataLoadedStateImpl(final List<SchoolData> list) : _list = list;

  final List<SchoolData> _list;
  @override
  List<SchoolData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'LoginAPIState.schoolDataLoadedState(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolDataLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolDataLoadedStateImplCopyWith<_$SchoolDataLoadedStateImpl>
      get copyWith => __$$SchoolDataLoadedStateImplCopyWithImpl<
          _$SchoolDataLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<SchoolData> list) schoolDataLoadedState,
    required TResult Function(LoginInformationResult data) loginLoadedState,
  }) {
    return schoolDataLoadedState(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult? Function(LoginInformationResult data)? loginLoadedState,
  }) {
    return schoolDataLoadedState?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult Function(LoginInformationResult data)? loginLoadedState,
    required TResult orElse(),
  }) {
    if (schoolDataLoadedState != null) {
      return schoolDataLoadedState(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SchoolDataLoadedState value)
        schoolDataLoadedState,
    required TResult Function(_LoginLoadedState value) loginLoadedState,
  }) {
    return schoolDataLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult? Function(_LoginLoadedState value)? loginLoadedState,
  }) {
    return schoolDataLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult Function(_LoginLoadedState value)? loginLoadedState,
    required TResult orElse(),
  }) {
    if (schoolDataLoadedState != null) {
      return schoolDataLoadedState(this);
    }
    return orElse();
  }
}

abstract class _SchoolDataLoadedState implements LoginAPIState {
  const factory _SchoolDataLoadedState(final List<SchoolData> list) =
      _$SchoolDataLoadedStateImpl;

  List<SchoolData> get list;
  @JsonKey(ignore: true)
  _$$SchoolDataLoadedStateImplCopyWith<_$SchoolDataLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginLoadedStateImplCopyWith<$Res> {
  factory _$$LoginLoadedStateImplCopyWith(_$LoginLoadedStateImpl value,
          $Res Function(_$LoginLoadedStateImpl) then) =
      __$$LoginLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginInformationResult data});

  $LoginInformationResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginLoadedStateImplCopyWithImpl<$Res>
    extends _$LoginAPIStateCopyWithImpl<$Res, _$LoginLoadedStateImpl>
    implements _$$LoginLoadedStateImplCopyWith<$Res> {
  __$$LoginLoadedStateImplCopyWithImpl(_$LoginLoadedStateImpl _value,
      $Res Function(_$LoginLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoginLoadedStateImpl(
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

class _$LoginLoadedStateImpl implements _LoginLoadedState {
  const _$LoginLoadedStateImpl(this.data);

  @override
  final LoginInformationResult data;

  @override
  String toString() {
    return 'LoginAPIState.loginLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginLoadedStateImplCopyWith<_$LoginLoadedStateImpl> get copyWith =>
      __$$LoginLoadedStateImplCopyWithImpl<_$LoginLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<SchoolData> list) schoolDataLoadedState,
    required TResult Function(LoginInformationResult data) loginLoadedState,
  }) {
    return loginLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult? Function(LoginInformationResult data)? loginLoadedState,
  }) {
    return loginLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<SchoolData> list)? schoolDataLoadedState,
    TResult Function(LoginInformationResult data)? loginLoadedState,
    required TResult orElse(),
  }) {
    if (loginLoadedState != null) {
      return loginLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SchoolDataLoadedState value)
        schoolDataLoadedState,
    required TResult Function(_LoginLoadedState value) loginLoadedState,
  }) {
    return loginLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult? Function(_LoginLoadedState value)? loginLoadedState,
  }) {
    return loginLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SchoolDataLoadedState value)? schoolDataLoadedState,
    TResult Function(_LoginLoadedState value)? loginLoadedState,
    required TResult orElse(),
  }) {
    if (loginLoadedState != null) {
      return loginLoadedState(this);
    }
    return orElse();
  }
}

abstract class _LoginLoadedState implements LoginAPIState {
  const factory _LoginLoadedState(final LoginInformationResult data) =
      _$LoginLoadedStateImpl;

  LoginInformationResult get data;
  @JsonKey(ignore: true)
  _$$LoginLoadedStateImplCopyWith<_$LoginLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
