// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CategoryListAPIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryListAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CommonAPIState state) common,
    required TResult Function(StoryCategoryContentsResult result)
        contentsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(StoryCategoryContentsResult result)? contentsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(StoryCategoryContentsResult result)? contentsLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListAPIStateCopyWith<$Res> {
  factory $CategoryListAPIStateCopyWith(CategoryListAPIState value,
          $Res Function(CategoryListAPIState) then) =
      _$CategoryListAPIStateCopyWithImpl<$Res, CategoryListAPIState>;
}

/// @nodoc
class _$CategoryListAPIStateCopyWithImpl<$Res,
        $Val extends CategoryListAPIState>
    implements $CategoryListAPIStateCopyWith<$Res> {
  _$CategoryListAPIStateCopyWithImpl(this._value, this._then);

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
    extends _$CategoryListAPIStateCopyWithImpl<$Res, _$CommonImpl>
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
    return 'CategoryListAPIState.common(state: $state)';
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
    required TResult Function(StoryCategoryContentsResult result)
        contentsLoadedState,
  }) {
    return common(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(StoryCategoryContentsResult result)? contentsLoadedState,
  }) {
    return common?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(StoryCategoryContentsResult result)? contentsLoadedState,
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
  }) {
    return common(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
  }) {
    return common?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    required TResult orElse(),
  }) {
    if (common != null) {
      return common(this);
    }
    return orElse();
  }
}

abstract class _Common implements CategoryListAPIState {
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
  $Res call({StoryCategoryContentsResult result});

  $StoryCategoryContentsResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ContentsLoadedStateImplCopyWithImpl<$Res>
    extends _$CategoryListAPIStateCopyWithImpl<$Res, _$ContentsLoadedStateImpl>
    implements _$$ContentsLoadedStateImplCopyWith<$Res> {
  __$$ContentsLoadedStateImplCopyWithImpl(_$ContentsLoadedStateImpl _value,
      $Res Function(_$ContentsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ContentsLoadedStateImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as StoryCategoryContentsResult,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCategoryContentsResultCopyWith<$Res> get result {
    return $StoryCategoryContentsResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$ContentsLoadedStateImpl implements _ContentsLoadedState {
  const _$ContentsLoadedStateImpl(this.result);

  @override
  final StoryCategoryContentsResult result;

  @override
  String toString() {
    return 'CategoryListAPIState.contentsLoadedState(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsLoadedStateImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

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
    required TResult Function(StoryCategoryContentsResult result)
        contentsLoadedState,
  }) {
    return contentsLoadedState(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CommonAPIState state)? common,
    TResult? Function(StoryCategoryContentsResult result)? contentsLoadedState,
  }) {
    return contentsLoadedState?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CommonAPIState state)? common,
    TResult Function(StoryCategoryContentsResult result)? contentsLoadedState,
    required TResult orElse(),
  }) {
    if (contentsLoadedState != null) {
      return contentsLoadedState(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Common value) common,
    required TResult Function(_ContentsLoadedState value) contentsLoadedState,
  }) {
    return contentsLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Common value)? common,
    TResult? Function(_ContentsLoadedState value)? contentsLoadedState,
  }) {
    return contentsLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Common value)? common,
    TResult Function(_ContentsLoadedState value)? contentsLoadedState,
    required TResult orElse(),
  }) {
    if (contentsLoadedState != null) {
      return contentsLoadedState(this);
    }
    return orElse();
  }
}

abstract class _ContentsLoadedState implements CategoryListAPIState {
  const factory _ContentsLoadedState(final StoryCategoryContentsResult result) =
      _$ContentsLoadedStateImpl;

  StoryCategoryContentsResult get result;
  @JsonKey(ignore: true)
  _$$ContentsLoadedStateImplCopyWith<_$ContentsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
