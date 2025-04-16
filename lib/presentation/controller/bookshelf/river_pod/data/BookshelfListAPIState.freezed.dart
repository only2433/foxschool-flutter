// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BookshelfListAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookshelfListAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<ContentsBaseResult> data)
        bookshelfContentsLoadedState,
    required TResult Function(MyBookshelfResult data)
        bookshelfContentsDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_BookshelfContentsLoadedState value)
        bookshelfContentsLoadedState,
    required TResult Function(_BookshelfContentsDeletedState value)
        bookshelfContentsDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult? Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookshelfListAPIStateCopyWith<$Res> {
  factory $BookshelfListAPIStateCopyWith(BookshelfListAPIState value,
          $Res Function(BookshelfListAPIState) then) =
      _$BookshelfListAPIStateCopyWithImpl<$Res, BookshelfListAPIState>;
}

/// @nodoc
class _$BookshelfListAPIStateCopyWithImpl<$Res,
        $Val extends BookshelfListAPIState>
    implements $BookshelfListAPIStateCopyWith<$Res> {
  _$BookshelfListAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$BookshelfListAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'BookshelfListAPIState.common(state: $state)';
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
    required TResult Function(List<ContentsBaseResult> data)
        bookshelfContentsLoadedState,
    required TResult Function(MyBookshelfResult data)
        bookshelfContentsDeleteState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
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
    required TResult Function(_BookshelfContentsLoadedState value)
        bookshelfContentsLoadedState,
    required TResult Function(_BookshelfContentsDeletedState value)
        bookshelfContentsDeleteState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult? Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements BookshelfListAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookshelfContentsLoadedStateImplCopyWith<$Res> {
  factory _$$BookshelfContentsLoadedStateImplCopyWith(
          _$BookshelfContentsLoadedStateImpl value,
          $Res Function(_$BookshelfContentsLoadedStateImpl) then) =
      __$$BookshelfContentsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ContentsBaseResult> data});
}

/// @nodoc
class __$$BookshelfContentsLoadedStateImplCopyWithImpl<$Res>
    extends _$BookshelfListAPIStateCopyWithImpl<$Res,
        _$BookshelfContentsLoadedStateImpl>
    implements _$$BookshelfContentsLoadedStateImplCopyWith<$Res> {
  __$$BookshelfContentsLoadedStateImplCopyWithImpl(
      _$BookshelfContentsLoadedStateImpl _value,
      $Res Function(_$BookshelfContentsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BookshelfContentsLoadedStateImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
    ));
  }
}

/// @nodoc

class _$BookshelfContentsLoadedStateImpl
    implements _BookshelfContentsLoadedState {
  const _$BookshelfContentsLoadedStateImpl(final List<ContentsBaseResult> data)
      : _data = data;

  final List<ContentsBaseResult> _data;
  @override
  List<ContentsBaseResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BookshelfListAPIState.bookshelfContentsLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookshelfContentsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookshelfContentsLoadedStateImplCopyWith<
          _$BookshelfContentsLoadedStateImpl>
      get copyWith => __$$BookshelfContentsLoadedStateImplCopyWithImpl<
          _$BookshelfContentsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<ContentsBaseResult> data)
        bookshelfContentsLoadedState,
    required TResult Function(MyBookshelfResult data)
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsLoadedState != null) {
      return bookshelfContentsLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_BookshelfContentsLoadedState value)
        bookshelfContentsLoadedState,
    required TResult Function(_BookshelfContentsDeletedState value)
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult? Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsLoadedState != null) {
      return bookshelfContentsLoadedState(this);
    }
    return orElse();
  }
}

abstract class _BookshelfContentsLoadedState implements BookshelfListAPIState {
  const factory _BookshelfContentsLoadedState(
      final List<ContentsBaseResult> data) = _$BookshelfContentsLoadedStateImpl;

  List<ContentsBaseResult> get data;
  @JsonKey(ignore: true)
  _$$BookshelfContentsLoadedStateImplCopyWith<
          _$BookshelfContentsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookshelfContentsDeletedStateImplCopyWith<$Res> {
  factory _$$BookshelfContentsDeletedStateImplCopyWith(
          _$BookshelfContentsDeletedStateImpl value,
          $Res Function(_$BookshelfContentsDeletedStateImpl) then) =
      __$$BookshelfContentsDeletedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyBookshelfResult data});

  $MyBookshelfResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$BookshelfContentsDeletedStateImplCopyWithImpl<$Res>
    extends _$BookshelfListAPIStateCopyWithImpl<$Res,
        _$BookshelfContentsDeletedStateImpl>
    implements _$$BookshelfContentsDeletedStateImplCopyWith<$Res> {
  __$$BookshelfContentsDeletedStateImplCopyWithImpl(
      _$BookshelfContentsDeletedStateImpl _value,
      $Res Function(_$BookshelfContentsDeletedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BookshelfContentsDeletedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MyBookshelfResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyBookshelfResultCopyWith<$Res> get data {
    return $MyBookshelfResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$BookshelfContentsDeletedStateImpl
    implements _BookshelfContentsDeletedState {
  const _$BookshelfContentsDeletedStateImpl(this.data);

  @override
  final MyBookshelfResult data;

  @override
  String toString() {
    return 'BookshelfListAPIState.bookshelfContentsDeleteState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookshelfContentsDeletedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookshelfContentsDeletedStateImplCopyWith<
          _$BookshelfContentsDeletedStateImpl>
      get copyWith => __$$BookshelfContentsDeletedStateImplCopyWithImpl<
          _$BookshelfContentsDeletedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(List<ContentsBaseResult> data)
        bookshelfContentsLoadedState,
    required TResult Function(MyBookshelfResult data)
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsDeleteState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsDeleteState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(List<ContentsBaseResult> data)?
        bookshelfContentsLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsDeleteState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsDeleteState != null) {
      return bookshelfContentsDeleteState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_BookshelfContentsLoadedState value)
        bookshelfContentsLoadedState,
    required TResult Function(_BookshelfContentsDeletedState value)
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsDeleteState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult? Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
  }) {
    return bookshelfContentsDeleteState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_BookshelfContentsLoadedState value)?
        bookshelfContentsLoadedState,
    TResult Function(_BookshelfContentsDeletedState value)?
        bookshelfContentsDeleteState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsDeleteState != null) {
      return bookshelfContentsDeleteState(this);
    }
    return orElse();
  }
}

abstract class _BookshelfContentsDeletedState implements BookshelfListAPIState {
  const factory _BookshelfContentsDeletedState(final MyBookshelfResult data) =
      _$BookshelfContentsDeletedStateImpl;

  MyBookshelfResult get data;
  @JsonKey(ignore: true)
  _$$BookshelfContentsDeletedStateImplCopyWith<
          _$BookshelfContentsDeletedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
