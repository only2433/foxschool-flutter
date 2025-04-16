// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ManagementMybooksAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManagementMybooksAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementMybooksAPIStateCopyWith<$Res> {
  factory $ManagementMybooksAPIStateCopyWith(ManagementMybooksAPIState value,
          $Res Function(ManagementMybooksAPIState) then) =
      _$ManagementMybooksAPIStateCopyWithImpl<$Res, ManagementMybooksAPIState>;
}

/// @nodoc
class _$ManagementMybooksAPIStateCopyWithImpl<$Res,
        $Val extends ManagementMybooksAPIState>
    implements $ManagementMybooksAPIStateCopyWith<$Res> {
  _$ManagementMybooksAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'ManagementMybooksAPIState.common(state: $state)';
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
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
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
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements ManagementMybooksAPIState {
  const factory _Common(final CommonAPIState state) = _$CommonImpl;

  CommonAPIState get state;
  @JsonKey(ignore: true)
  _$$CommonImplCopyWith<_$CommonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateBookshelfImplCopyWith<$Res> {
  factory _$$CreateBookshelfImplCopyWith(_$CreateBookshelfImpl value,
          $Res Function(_$CreateBookshelfImpl) then) =
      __$$CreateBookshelfImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyBookshelfResult result});

  $MyBookshelfResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$CreateBookshelfImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res, _$CreateBookshelfImpl>
    implements _$$CreateBookshelfImplCopyWith<$Res> {
  __$$CreateBookshelfImplCopyWithImpl(
      _$CreateBookshelfImpl _value, $Res Function(_$CreateBookshelfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CreateBookshelfImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MyBookshelfResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyBookshelfResultCopyWith<$Res> get result {
    return $MyBookshelfResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$CreateBookshelfImpl implements _CreateBookshelf {
  const _$CreateBookshelfImpl(this.result);

  @override
  final MyBookshelfResult result;

  @override
  String toString() {
    return 'ManagementMybooksAPIState.createBookshelf(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookshelfImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookshelfImplCopyWith<_$CreateBookshelfImpl> get copyWith =>
      __$$CreateBookshelfImplCopyWithImpl<_$CreateBookshelfImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return createBookshelf(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return createBookshelf?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (createBookshelf != null) {
      return createBookshelf(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return createBookshelf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return createBookshelf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (createBookshelf != null) {
      return createBookshelf(this);
    }
    return orElse();
  }
}

abstract class _CreateBookshelf implements ManagementMybooksAPIState {
  const factory _CreateBookshelf(final MyBookshelfResult result) =
      _$CreateBookshelfImpl;

  MyBookshelfResult get result;
  @JsonKey(ignore: true)
  _$$CreateBookshelfImplCopyWith<_$CreateBookshelfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateVocabularyImplCopyWith<$Res> {
  factory _$$CreateVocabularyImplCopyWith(_$CreateVocabularyImpl value,
          $Res Function(_$CreateVocabularyImpl) then) =
      __$$CreateVocabularyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyVocabularyResult result});

  $MyVocabularyResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$CreateVocabularyImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res,
        _$CreateVocabularyImpl>
    implements _$$CreateVocabularyImplCopyWith<$Res> {
  __$$CreateVocabularyImplCopyWithImpl(_$CreateVocabularyImpl _value,
      $Res Function(_$CreateVocabularyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CreateVocabularyImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MyVocabularyResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyVocabularyResultCopyWith<$Res> get result {
    return $MyVocabularyResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$CreateVocabularyImpl implements _CreateVocabulary {
  const _$CreateVocabularyImpl(this.result);

  @override
  final MyVocabularyResult result;

  @override
  String toString() {
    return 'ManagementMybooksAPIState.createVocabulary(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVocabularyImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVocabularyImplCopyWith<_$CreateVocabularyImpl> get copyWith =>
      __$$CreateVocabularyImplCopyWithImpl<_$CreateVocabularyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return createVocabulary(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return createVocabulary?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (createVocabulary != null) {
      return createVocabulary(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return createVocabulary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return createVocabulary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (createVocabulary != null) {
      return createVocabulary(this);
    }
    return orElse();
  }
}

abstract class _CreateVocabulary implements ManagementMybooksAPIState {
  const factory _CreateVocabulary(final MyVocabularyResult result) =
      _$CreateVocabularyImpl;

  MyVocabularyResult get result;
  @JsonKey(ignore: true)
  _$$CreateVocabularyImplCopyWith<_$CreateVocabularyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBookshelfImplCopyWith<$Res> {
  factory _$$UpdateBookshelfImplCopyWith(_$UpdateBookshelfImpl value,
          $Res Function(_$UpdateBookshelfImpl) then) =
      __$$UpdateBookshelfImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyBookshelfResult result});

  $MyBookshelfResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$UpdateBookshelfImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res, _$UpdateBookshelfImpl>
    implements _$$UpdateBookshelfImplCopyWith<$Res> {
  __$$UpdateBookshelfImplCopyWithImpl(
      _$UpdateBookshelfImpl _value, $Res Function(_$UpdateBookshelfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$UpdateBookshelfImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MyBookshelfResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyBookshelfResultCopyWith<$Res> get result {
    return $MyBookshelfResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$UpdateBookshelfImpl implements _UpdateBookshelf {
  const _$UpdateBookshelfImpl(this.result);

  @override
  final MyBookshelfResult result;

  @override
  String toString() {
    return 'ManagementMybooksAPIState.updateBookshelf(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBookshelfImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBookshelfImplCopyWith<_$UpdateBookshelfImpl> get copyWith =>
      __$$UpdateBookshelfImplCopyWithImpl<_$UpdateBookshelfImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return updateBookshelf(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return updateBookshelf?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (updateBookshelf != null) {
      return updateBookshelf(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return updateBookshelf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return updateBookshelf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (updateBookshelf != null) {
      return updateBookshelf(this);
    }
    return orElse();
  }
}

abstract class _UpdateBookshelf implements ManagementMybooksAPIState {
  const factory _UpdateBookshelf(final MyBookshelfResult result) =
      _$UpdateBookshelfImpl;

  MyBookshelfResult get result;
  @JsonKey(ignore: true)
  _$$UpdateBookshelfImplCopyWith<_$UpdateBookshelfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateVocabularyImplCopyWith<$Res> {
  factory _$$UpdateVocabularyImplCopyWith(_$UpdateVocabularyImpl value,
          $Res Function(_$UpdateVocabularyImpl) then) =
      __$$UpdateVocabularyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyVocabularyResult result});

  $MyVocabularyResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$UpdateVocabularyImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res,
        _$UpdateVocabularyImpl>
    implements _$$UpdateVocabularyImplCopyWith<$Res> {
  __$$UpdateVocabularyImplCopyWithImpl(_$UpdateVocabularyImpl _value,
      $Res Function(_$UpdateVocabularyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$UpdateVocabularyImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MyVocabularyResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyVocabularyResultCopyWith<$Res> get result {
    return $MyVocabularyResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$UpdateVocabularyImpl implements _UpdateVocabulary {
  const _$UpdateVocabularyImpl(this.result);

  @override
  final MyVocabularyResult result;

  @override
  String toString() {
    return 'ManagementMybooksAPIState.updateVocabulary(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVocabularyImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVocabularyImplCopyWith<_$UpdateVocabularyImpl> get copyWith =>
      __$$UpdateVocabularyImplCopyWithImpl<_$UpdateVocabularyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return updateVocabulary(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return updateVocabulary?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (updateVocabulary != null) {
      return updateVocabulary(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return updateVocabulary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return updateVocabulary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (updateVocabulary != null) {
      return updateVocabulary(this);
    }
    return orElse();
  }
}

abstract class _UpdateVocabulary implements ManagementMybooksAPIState {
  const factory _UpdateVocabulary(final MyVocabularyResult result) =
      _$UpdateVocabularyImpl;

  MyVocabularyResult get result;
  @JsonKey(ignore: true)
  _$$UpdateVocabularyImplCopyWith<_$UpdateVocabularyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBookshelfImplCopyWith<$Res> {
  factory _$$DeleteBookshelfImplCopyWith(_$DeleteBookshelfImpl value,
          $Res Function(_$DeleteBookshelfImpl) then) =
      __$$DeleteBookshelfImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteBookshelfImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res, _$DeleteBookshelfImpl>
    implements _$$DeleteBookshelfImplCopyWith<$Res> {
  __$$DeleteBookshelfImplCopyWithImpl(
      _$DeleteBookshelfImpl _value, $Res Function(_$DeleteBookshelfImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteBookshelfImpl implements _DeleteBookshelf {
  const _$DeleteBookshelfImpl();

  @override
  String toString() {
    return 'ManagementMybooksAPIState.deleteBookshelf()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteBookshelfImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return deleteBookshelf();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return deleteBookshelf?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (deleteBookshelf != null) {
      return deleteBookshelf();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return deleteBookshelf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return deleteBookshelf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (deleteBookshelf != null) {
      return deleteBookshelf(this);
    }
    return orElse();
  }
}

abstract class _DeleteBookshelf implements ManagementMybooksAPIState {
  const factory _DeleteBookshelf() = _$DeleteBookshelfImpl;
}

/// @nodoc
abstract class _$$DeleteVocabularyImplCopyWith<$Res> {
  factory _$$DeleteVocabularyImplCopyWith(_$DeleteVocabularyImpl value,
          $Res Function(_$DeleteVocabularyImpl) then) =
      __$$DeleteVocabularyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteVocabularyImplCopyWithImpl<$Res>
    extends _$ManagementMybooksAPIStateCopyWithImpl<$Res,
        _$DeleteVocabularyImpl>
    implements _$$DeleteVocabularyImplCopyWith<$Res> {
  __$$DeleteVocabularyImplCopyWithImpl(_$DeleteVocabularyImpl _value,
      $Res Function(_$DeleteVocabularyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteVocabularyImpl implements _DeleteVocabulary {
  const _$DeleteVocabularyImpl();

  @override
  String toString() {
    return 'ManagementMybooksAPIState.deleteVocabulary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteVocabularyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(MyBookshelfResult result) createBookshelf,
    required TResult Function(MyVocabularyResult result) createVocabulary,
    required TResult Function(MyBookshelfResult result) updateBookshelf,
    required TResult Function(MyVocabularyResult result) updateVocabulary,
    required TResult Function() deleteBookshelf,
    required TResult Function() deleteVocabulary,
  }) {
    return deleteVocabulary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(MyBookshelfResult result)? createBookshelf,
    TResult? Function(MyVocabularyResult result)? createVocabulary,
    TResult? Function(MyBookshelfResult result)? updateBookshelf,
    TResult? Function(MyVocabularyResult result)? updateVocabulary,
    TResult? Function()? deleteBookshelf,
    TResult? Function()? deleteVocabulary,
  }) {
    return deleteVocabulary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(MyBookshelfResult result)? createBookshelf,
    TResult Function(MyVocabularyResult result)? createVocabulary,
    TResult Function(MyBookshelfResult result)? updateBookshelf,
    TResult Function(MyVocabularyResult result)? updateVocabulary,
    TResult Function()? deleteBookshelf,
    TResult Function()? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (deleteVocabulary != null) {
      return deleteVocabulary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_CreateBookshelf value) createBookshelf,
    required TResult Function(_CreateVocabulary value) createVocabulary,
    required TResult Function(_UpdateBookshelf value) updateBookshelf,
    required TResult Function(_UpdateVocabulary value) updateVocabulary,
    required TResult Function(_DeleteBookshelf value) deleteBookshelf,
    required TResult Function(_DeleteVocabulary value) deleteVocabulary,
  }) {
    return deleteVocabulary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_CreateBookshelf value)? createBookshelf,
    TResult? Function(_CreateVocabulary value)? createVocabulary,
    TResult? Function(_UpdateBookshelf value)? updateBookshelf,
    TResult? Function(_UpdateVocabulary value)? updateVocabulary,
    TResult? Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult? Function(_DeleteVocabulary value)? deleteVocabulary,
  }) {
    return deleteVocabulary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_CreateBookshelf value)? createBookshelf,
    TResult Function(_CreateVocabulary value)? createVocabulary,
    TResult Function(_UpdateBookshelf value)? updateBookshelf,
    TResult Function(_UpdateVocabulary value)? updateVocabulary,
    TResult Function(_DeleteBookshelf value)? deleteBookshelf,
    TResult Function(_DeleteVocabulary value)? deleteVocabulary,
    required TResult orElse(),
  }) {
    if (deleteVocabulary != null) {
      return deleteVocabulary(this);
    }
    return orElse();
  }
}

abstract class _DeleteVocabulary implements ManagementMybooksAPIState {
  const factory _DeleteVocabulary() = _$DeleteVocabularyImpl;
}
