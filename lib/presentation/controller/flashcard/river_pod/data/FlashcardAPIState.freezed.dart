// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FlashcardAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyDataLoadedState,
    required TResult Function(MyVocabularyResult data) addVocabularyContents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult? Function(MyVocabularyResult data)? addVocabularyContents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult Function(MyVocabularyResult data)? addVocabularyContents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyDataLoadedState value)
        vocabularyDataLoadedState,
    required TResult Function(_AddVocabularyContents value)
        addVocabularyContents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult? Function(_AddVocabularyContents value)? addVocabularyContents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult Function(_AddVocabularyContents value)? addVocabularyContents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardAPIStateCopyWith<$Res> {
  factory $FlashcardAPIStateCopyWith(
          FlashcardAPIState value, $Res Function(FlashcardAPIState) then) =
      _$FlashcardAPIStateCopyWithImpl<$Res, FlashcardAPIState>;
}

/// @nodoc
class _$FlashcardAPIStateCopyWithImpl<$Res, $Val extends FlashcardAPIState>
    implements $FlashcardAPIStateCopyWith<$Res> {
  _$FlashcardAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$FlashcardAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'FlashcardAPIState.common(state: $state)';
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
        vocabularyDataLoadedState,
    required TResult Function(MyVocabularyResult data) addVocabularyContents,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult? Function(MyVocabularyResult data)? addVocabularyContents,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult Function(MyVocabularyResult data)? addVocabularyContents,
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
    required TResult Function(_VocabularyDataLoadedState value)
        vocabularyDataLoadedState,
    required TResult Function(_AddVocabularyContents value)
        addVocabularyContents,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult? Function(_AddVocabularyContents value)? addVocabularyContents,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult Function(_AddVocabularyContents value)? addVocabularyContents,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements FlashcardAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VocabularyDataLoadedStateImplCopyWith<$Res> {
  factory _$$VocabularyDataLoadedStateImplCopyWith(
          _$VocabularyDataLoadedStateImpl value,
          $Res Function(_$VocabularyDataLoadedStateImpl) then) =
      __$$VocabularyDataLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VocabularyDataResult> data});
}

/// @nodoc
class __$$VocabularyDataLoadedStateImplCopyWithImpl<$Res>
    extends _$FlashcardAPIStateCopyWithImpl<$Res,
        _$VocabularyDataLoadedStateImpl>
    implements _$$VocabularyDataLoadedStateImplCopyWith<$Res> {
  __$$VocabularyDataLoadedStateImplCopyWithImpl(
      _$VocabularyDataLoadedStateImpl _value,
      $Res Function(_$VocabularyDataLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VocabularyDataLoadedStateImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDataResult>,
    ));
  }
}

/// @nodoc

class _$VocabularyDataLoadedStateImpl implements _VocabularyDataLoadedState {
  const _$VocabularyDataLoadedStateImpl(final List<VocabularyDataResult> data)
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
    return 'FlashcardAPIState.vocabularyDataLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyDataLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyDataLoadedStateImplCopyWith<_$VocabularyDataLoadedStateImpl>
      get copyWith => __$$VocabularyDataLoadedStateImplCopyWithImpl<
          _$VocabularyDataLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyDataLoadedState,
    required TResult Function(MyVocabularyResult data) addVocabularyContents,
  }) {
    return vocabularyDataLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult? Function(MyVocabularyResult data)? addVocabularyContents,
  }) {
    return vocabularyDataLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult Function(MyVocabularyResult data)? addVocabularyContents,
    required TResult orElse(),
  }) {
    if (vocabularyDataLoadedState != null) {
      return vocabularyDataLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyDataLoadedState value)
        vocabularyDataLoadedState,
    required TResult Function(_AddVocabularyContents value)
        addVocabularyContents,
  }) {
    return vocabularyDataLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult? Function(_AddVocabularyContents value)? addVocabularyContents,
  }) {
    return vocabularyDataLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult Function(_AddVocabularyContents value)? addVocabularyContents,
    required TResult orElse(),
  }) {
    if (vocabularyDataLoadedState != null) {
      return vocabularyDataLoadedState(this);
    }
    return orElse();
  }
}

abstract class _VocabularyDataLoadedState implements FlashcardAPIState {
  const factory _VocabularyDataLoadedState(
      final List<VocabularyDataResult> data) = _$VocabularyDataLoadedStateImpl;

  List<VocabularyDataResult> get data;
  @JsonKey(ignore: true)
  _$$VocabularyDataLoadedStateImplCopyWith<_$VocabularyDataLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddVocabularyContentsImplCopyWith<$Res> {
  factory _$$AddVocabularyContentsImplCopyWith(
          _$AddVocabularyContentsImpl value,
          $Res Function(_$AddVocabularyContentsImpl) then) =
      __$$AddVocabularyContentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyVocabularyResult data});

  $MyVocabularyResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddVocabularyContentsImplCopyWithImpl<$Res>
    extends _$FlashcardAPIStateCopyWithImpl<$Res, _$AddVocabularyContentsImpl>
    implements _$$AddVocabularyContentsImplCopyWith<$Res> {
  __$$AddVocabularyContentsImplCopyWithImpl(_$AddVocabularyContentsImpl _value,
      $Res Function(_$AddVocabularyContentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AddVocabularyContentsImpl(
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

class _$AddVocabularyContentsImpl implements _AddVocabularyContents {
  const _$AddVocabularyContentsImpl(this.data);

  @override
  final MyVocabularyResult data;

  @override
  String toString() {
    return 'FlashcardAPIState.addVocabularyContents(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddVocabularyContentsImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddVocabularyContentsImplCopyWith<_$AddVocabularyContentsImpl>
      get copyWith => __$$AddVocabularyContentsImplCopyWithImpl<
          _$AddVocabularyContentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<VocabularyDataResult> data)
        vocabularyDataLoadedState,
    required TResult Function(MyVocabularyResult data) addVocabularyContents,
  }) {
    return addVocabularyContents(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult? Function(MyVocabularyResult data)? addVocabularyContents,
  }) {
    return addVocabularyContents?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<VocabularyDataResult> data)?
        vocabularyDataLoadedState,
    TResult Function(MyVocabularyResult data)? addVocabularyContents,
    required TResult orElse(),
  }) {
    if (addVocabularyContents != null) {
      return addVocabularyContents(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_VocabularyDataLoadedState value)
        vocabularyDataLoadedState,
    required TResult Function(_AddVocabularyContents value)
        addVocabularyContents,
  }) {
    return addVocabularyContents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult? Function(_AddVocabularyContents value)? addVocabularyContents,
  }) {
    return addVocabularyContents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_VocabularyDataLoadedState value)?
        vocabularyDataLoadedState,
    TResult Function(_AddVocabularyContents value)? addVocabularyContents,
    required TResult orElse(),
  }) {
    if (addVocabularyContents != null) {
      return addVocabularyContents(this);
    }
    return orElse();
  }
}

abstract class _AddVocabularyContents implements FlashcardAPIState {
  const factory _AddVocabularyContents(final MyVocabularyResult data) =
      _$AddVocabularyContentsImpl;

  MyVocabularyResult get data;
  @JsonKey(ignore: true)
  _$$AddVocabularyContentsImplCopyWith<_$AddVocabularyContentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
