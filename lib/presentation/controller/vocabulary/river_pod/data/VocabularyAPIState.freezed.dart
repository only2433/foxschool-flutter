// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'VocabularyAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VocabularyAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyContentsLoadedState,
    required TResult Function(MyVocabularyResult data) addContentsState,
    required TResult Function() deleteContentsState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult? Function(MyVocabularyResult data)? addContentsState,
    TResult? Function()? deleteContentsState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult Function(MyVocabularyResult data)? addContentsState,
    TResult Function()? deleteContentsState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyContentsLoadedState value)
        vocabularyContentsLoadedState,
    required TResult Function(_AddContentsState value) addContentsState,
    required TResult Function(_DeleteContentsState value) deleteContentsState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult? Function(_AddContentsState value)? addContentsState,
    TResult? Function(_DeleteContentsState value)? deleteContentsState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult Function(_AddContentsState value)? addContentsState,
    TResult Function(_DeleteContentsState value)? deleteContentsState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyAPIStateCopyWith<$Res> {
  factory $VocabularyAPIStateCopyWith(
          VocabularyAPIState value, $Res Function(VocabularyAPIState) then) =
      _$VocabularyAPIStateCopyWithImpl<$Res, VocabularyAPIState>;
}

/// @nodoc
class _$VocabularyAPIStateCopyWithImpl<$Res, $Val extends VocabularyAPIState>
    implements $VocabularyAPIStateCopyWith<$Res> {
  _$VocabularyAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$VocabularyAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'VocabularyAPIState.common(state: $state)';
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
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyContentsLoadedState,
    required TResult Function(MyVocabularyResult data) addContentsState,
    required TResult Function() deleteContentsState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult? Function(MyVocabularyResult data)? addContentsState,
    TResult? Function()? deleteContentsState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult Function(MyVocabularyResult data)? addContentsState,
    TResult Function()? deleteContentsState,
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
    required TResult Function(_VocabularyContentsLoadedState value)
        vocabularyContentsLoadedState,
    required TResult Function(_AddContentsState value) addContentsState,
    required TResult Function(_DeleteContentsState value) deleteContentsState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult? Function(_AddContentsState value)? addContentsState,
    TResult? Function(_DeleteContentsState value)? deleteContentsState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult Function(_AddContentsState value)? addContentsState,
    TResult Function(_DeleteContentsState value)? deleteContentsState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements VocabularyAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VocabularyContentsLoadedStateImplCopyWith<$Res> {
  factory _$$VocabularyContentsLoadedStateImplCopyWith(
          _$VocabularyContentsLoadedStateImpl value,
          $Res Function(_$VocabularyContentsLoadedStateImpl) then) =
      __$$VocabularyContentsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VocabularyDataResult> data});
}

/// @nodoc
class __$$VocabularyContentsLoadedStateImplCopyWithImpl<$Res>
    extends _$VocabularyAPIStateCopyWithImpl<$Res,
        _$VocabularyContentsLoadedStateImpl>
    implements _$$VocabularyContentsLoadedStateImplCopyWith<$Res> {
  __$$VocabularyContentsLoadedStateImplCopyWithImpl(
      _$VocabularyContentsLoadedStateImpl _value,
      $Res Function(_$VocabularyContentsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VocabularyContentsLoadedStateImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDataResult>,
    ));
  }
}

/// @nodoc

class _$VocabularyContentsLoadedStateImpl
    implements _VocabularyContentsLoadedState {
  const _$VocabularyContentsLoadedStateImpl(
      final List<VocabularyDataResult> data)
      : _data = data;

  final List<VocabularyDataResult> _data;
  @override
  List<VocabularyDataResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'VocabularyAPIState.vocabularyContentsLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyContentsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyContentsLoadedStateImplCopyWith<
          _$VocabularyContentsLoadedStateImpl>
      get copyWith => __$$VocabularyContentsLoadedStateImplCopyWithImpl<
          _$VocabularyContentsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyContentsLoadedState,
    required TResult Function(MyVocabularyResult data) addContentsState,
    required TResult Function() deleteContentsState,
  }) {
    return vocabularyContentsLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult? Function(MyVocabularyResult data)? addContentsState,
    TResult? Function()? deleteContentsState,
  }) {
    return vocabularyContentsLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult Function(MyVocabularyResult data)? addContentsState,
    TResult Function()? deleteContentsState,
    required TResult orElse(),
  }) {
    if (vocabularyContentsLoadedState != null) {
      return vocabularyContentsLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyContentsLoadedState value)
        vocabularyContentsLoadedState,
    required TResult Function(_AddContentsState value) addContentsState,
    required TResult Function(_DeleteContentsState value) deleteContentsState,
  }) {
    return vocabularyContentsLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult? Function(_AddContentsState value)? addContentsState,
    TResult? Function(_DeleteContentsState value)? deleteContentsState,
  }) {
    return vocabularyContentsLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult Function(_AddContentsState value)? addContentsState,
    TResult Function(_DeleteContentsState value)? deleteContentsState,
    required TResult orElse(),
  }) {
    if (vocabularyContentsLoadedState != null) {
      return vocabularyContentsLoadedState(this);
    }
    return orElse();
  }
}

abstract class _VocabularyContentsLoadedState implements VocabularyAPIState {
  const factory _VocabularyContentsLoadedState(
          final List<VocabularyDataResult> data) =
      _$VocabularyContentsLoadedStateImpl;

  List<VocabularyDataResult> get data;
  @JsonKey(ignore: true)
  _$$VocabularyContentsLoadedStateImplCopyWith<
          _$VocabularyContentsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddContentsStateImplCopyWith<$Res> {
  factory _$$AddContentsStateImplCopyWith(_$AddContentsStateImpl value,
          $Res Function(_$AddContentsStateImpl) then) =
      __$$AddContentsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyVocabularyResult data});

  $MyVocabularyResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddContentsStateImplCopyWithImpl<$Res>
    extends _$VocabularyAPIStateCopyWithImpl<$Res, _$AddContentsStateImpl>
    implements _$$AddContentsStateImplCopyWith<$Res> {
  __$$AddContentsStateImplCopyWithImpl(_$AddContentsStateImpl _value,
      $Res Function(_$AddContentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AddContentsStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MyVocabularyResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyVocabularyResultCopyWith<$Res> get data {
    return $MyVocabularyResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$AddContentsStateImpl implements _AddContentsState {
  const _$AddContentsStateImpl(this.data);

  @override
  final MyVocabularyResult data;

  @override
  String toString() {
    return 'VocabularyAPIState.addContentsState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContentsStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContentsStateImplCopyWith<_$AddContentsStateImpl> get copyWith =>
      __$$AddContentsStateImplCopyWithImpl<_$AddContentsStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyContentsLoadedState,
    required TResult Function(MyVocabularyResult data) addContentsState,
    required TResult Function() deleteContentsState,
  }) {
    return addContentsState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult? Function(MyVocabularyResult data)? addContentsState,
    TResult? Function()? deleteContentsState,
  }) {
    return addContentsState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult Function(MyVocabularyResult data)? addContentsState,
    TResult Function()? deleteContentsState,
    required TResult orElse(),
  }) {
    if (addContentsState != null) {
      return addContentsState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyContentsLoadedState value)
        vocabularyContentsLoadedState,
    required TResult Function(_AddContentsState value) addContentsState,
    required TResult Function(_DeleteContentsState value) deleteContentsState,
  }) {
    return addContentsState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult? Function(_AddContentsState value)? addContentsState,
    TResult? Function(_DeleteContentsState value)? deleteContentsState,
  }) {
    return addContentsState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult Function(_AddContentsState value)? addContentsState,
    TResult Function(_DeleteContentsState value)? deleteContentsState,
    required TResult orElse(),
  }) {
    if (addContentsState != null) {
      return addContentsState(this);
    }
    return orElse();
  }
}

abstract class _AddContentsState implements VocabularyAPIState {
  const factory _AddContentsState(final MyVocabularyResult data) =
      _$AddContentsStateImpl;

  MyVocabularyResult get data;
  @JsonKey(ignore: true)
  _$$AddContentsStateImplCopyWith<_$AddContentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteContentsStateImplCopyWith<$Res> {
  factory _$$DeleteContentsStateImplCopyWith(_$DeleteContentsStateImpl value,
          $Res Function(_$DeleteContentsStateImpl) then) =
      __$$DeleteContentsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteContentsStateImplCopyWithImpl<$Res>
    extends _$VocabularyAPIStateCopyWithImpl<$Res, _$DeleteContentsStateImpl>
    implements _$$DeleteContentsStateImplCopyWith<$Res> {
  __$$DeleteContentsStateImplCopyWithImpl(_$DeleteContentsStateImpl _value,
      $Res Function(_$DeleteContentsStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteContentsStateImpl implements _DeleteContentsState {
  const _$DeleteContentsStateImpl();

  @override
  String toString() {
    return 'VocabularyAPIState.deleteContentsState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteContentsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyContentsLoadedState,
    required TResult Function(MyVocabularyResult data) addContentsState,
    required TResult Function() deleteContentsState,
  }) {
    return deleteContentsState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult? Function(MyVocabularyResult data)? addContentsState,
    TResult? Function()? deleteContentsState,
  }) {
    return deleteContentsState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyContentsLoadedState,
    TResult Function(MyVocabularyResult data)? addContentsState,
    TResult Function()? deleteContentsState,
    required TResult orElse(),
  }) {
    if (deleteContentsState != null) {
      return deleteContentsState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyContentsLoadedState value)
        vocabularyContentsLoadedState,
    required TResult Function(_AddContentsState value) addContentsState,
    required TResult Function(_DeleteContentsState value) deleteContentsState,
  }) {
    return deleteContentsState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult? Function(_AddContentsState value)? addContentsState,
    TResult? Function(_DeleteContentsState value)? deleteContentsState,
  }) {
    return deleteContentsState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyContentsLoadedState value)?
        vocabularyContentsLoadedState,
    TResult Function(_AddContentsState value)? addContentsState,
    TResult Function(_DeleteContentsState value)? deleteContentsState,
    required TResult orElse(),
  }) {
    if (deleteContentsState != null) {
      return deleteContentsState(this);
    }
    return orElse();
  }
}

abstract class _DeleteContentsState implements VocabularyAPIState {
  const factory _DeleteContentsState() = _$DeleteContentsStateImpl;
}
