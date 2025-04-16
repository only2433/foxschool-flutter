// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SeriesListAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeriesListAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(DetailItemInformationResult data)
        seriesContentsDataLoadedState,
    required TResult Function(MyBookshelfResult data) bookshelfContentsAddState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsAddState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsAddState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SeriesContentsDataLoadedState value)
        seriesContentsDataLoadedState,
    required TResult Function(_BookshelfContentsAddState value)
        bookshelfContentsAddState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult? Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesListAPIStateCopyWith<$Res> {
  factory $SeriesListAPIStateCopyWith(
          SeriesListAPIState value, $Res Function(SeriesListAPIState) then) =
      _$SeriesListAPIStateCopyWithImpl<$Res, SeriesListAPIState>;
}

/// @nodoc
class _$SeriesListAPIStateCopyWithImpl<$Res, $Val extends SeriesListAPIState>
    implements $SeriesListAPIStateCopyWith<$Res> {
  _$SeriesListAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$SeriesListAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'SeriesListAPIState.common(state: $state)';
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
    required TResult Function(DetailItemInformationResult data)
        seriesContentsDataLoadedState,
    required TResult Function(MyBookshelfResult data) bookshelfContentsAddState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsAddState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsAddState,
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
    required TResult Function(_SeriesContentsDataLoadedState value)
        seriesContentsDataLoadedState,
    required TResult Function(_BookshelfContentsAddState value)
        bookshelfContentsAddState,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult? Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements SeriesListAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeriesContentsDataLoadedStateImplCopyWith<$Res> {
  factory _$$SeriesContentsDataLoadedStateImplCopyWith(
          _$SeriesContentsDataLoadedStateImpl value,
          $Res Function(_$SeriesContentsDataLoadedStateImpl) then) =
      __$$SeriesContentsDataLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DetailItemInformationResult data});

  $DetailItemInformationResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$SeriesContentsDataLoadedStateImplCopyWithImpl<$Res>
    extends _$SeriesListAPIStateCopyWithImpl<$Res,
        _$SeriesContentsDataLoadedStateImpl>
    implements _$$SeriesContentsDataLoadedStateImplCopyWith<$Res> {
  __$$SeriesContentsDataLoadedStateImplCopyWithImpl(
      _$SeriesContentsDataLoadedStateImpl _value,
      $Res Function(_$SeriesContentsDataLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SeriesContentsDataLoadedStateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailItemInformationResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailItemInformationResultCopyWith<$Res> get data {
    return $DetailItemInformationResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$SeriesContentsDataLoadedStateImpl
    implements _SeriesContentsDataLoadedState {
  const _$SeriesContentsDataLoadedStateImpl(this.data);

  @override
  final DetailItemInformationResult data;

  @override
  String toString() {
    return 'SeriesListAPIState.seriesContentsDataLoadedState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesContentsDataLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesContentsDataLoadedStateImplCopyWith<
          _$SeriesContentsDataLoadedStateImpl>
      get copyWith => __$$SeriesContentsDataLoadedStateImplCopyWithImpl<
          _$SeriesContentsDataLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(DetailItemInformationResult data)
        seriesContentsDataLoadedState,
    required TResult Function(MyBookshelfResult data) bookshelfContentsAddState,
  }) {
    return seriesContentsDataLoadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsAddState,
  }) {
    return seriesContentsDataLoadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsAddState,
    required TResult orElse(),
  }) {
    if (seriesContentsDataLoadedState != null) {
      return seriesContentsDataLoadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SeriesContentsDataLoadedState value)
        seriesContentsDataLoadedState,
    required TResult Function(_BookshelfContentsAddState value)
        bookshelfContentsAddState,
  }) {
    return seriesContentsDataLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult? Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
  }) {
    return seriesContentsDataLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
    required TResult orElse(),
  }) {
    if (seriesContentsDataLoadedState != null) {
      return seriesContentsDataLoadedState(this);
    }
    return orElse();
  }
}

abstract class _SeriesContentsDataLoadedState implements SeriesListAPIState {
  const factory _SeriesContentsDataLoadedState(
          final DetailItemInformationResult data) =
      _$SeriesContentsDataLoadedStateImpl;

  DetailItemInformationResult get data;
  @JsonKey(ignore: true)
  _$$SeriesContentsDataLoadedStateImplCopyWith<
          _$SeriesContentsDataLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookshelfContentsAddStateImplCopyWith<$Res> {
  factory _$$BookshelfContentsAddStateImplCopyWith(
          _$BookshelfContentsAddStateImpl value,
          $Res Function(_$BookshelfContentsAddStateImpl) then) =
      __$$BookshelfContentsAddStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyBookshelfResult data});

  $MyBookshelfResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$BookshelfContentsAddStateImplCopyWithImpl<$Res>
    extends _$SeriesListAPIStateCopyWithImpl<$Res,
        _$BookshelfContentsAddStateImpl>
    implements _$$BookshelfContentsAddStateImplCopyWith<$Res> {
  __$$BookshelfContentsAddStateImplCopyWithImpl(
      _$BookshelfContentsAddStateImpl _value,
      $Res Function(_$BookshelfContentsAddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BookshelfContentsAddStateImpl(
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

class _$BookshelfContentsAddStateImpl implements _BookshelfContentsAddState {
  const _$BookshelfContentsAddStateImpl(this.data);

  @override
  final MyBookshelfResult data;

  @override
  String toString() {
    return 'SeriesListAPIState.bookshelfContentsAddState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookshelfContentsAddStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookshelfContentsAddStateImplCopyWith<_$BookshelfContentsAddStateImpl>
      get copyWith => __$$BookshelfContentsAddStateImplCopyWithImpl<
          _$BookshelfContentsAddStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(DetailItemInformationResult data)
        seriesContentsDataLoadedState,
    required TResult Function(MyBookshelfResult data) bookshelfContentsAddState,
  }) {
    return bookshelfContentsAddState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult? Function(MyBookshelfResult data)? bookshelfContentsAddState,
  }) {
    return bookshelfContentsAddState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(DetailItemInformationResult data)?
        seriesContentsDataLoadedState,
    TResult Function(MyBookshelfResult data)? bookshelfContentsAddState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsAddState != null) {
      return bookshelfContentsAddState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_SeriesContentsDataLoadedState value)
        seriesContentsDataLoadedState,
    required TResult Function(_BookshelfContentsAddState value)
        bookshelfContentsAddState,
  }) {
    return bookshelfContentsAddState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult? Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
  }) {
    return bookshelfContentsAddState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_SeriesContentsDataLoadedState value)?
        seriesContentsDataLoadedState,
    TResult Function(_BookshelfContentsAddState value)?
        bookshelfContentsAddState,
    required TResult orElse(),
  }) {
    if (bookshelfContentsAddState != null) {
      return bookshelfContentsAddState(this);
    }
    return orElse();
  }
}

abstract class _BookshelfContentsAddState implements SeriesListAPIState {
  const factory _BookshelfContentsAddState(final MyBookshelfResult data) =
      _$BookshelfContentsAddStateImpl;

  MyBookshelfResult get data;
  @JsonKey(ignore: true)
  _$$BookshelfContentsAddStateImplCopyWith<_$BookshelfContentsAddStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
