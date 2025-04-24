// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FlashcardTaskState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardTaskState {
  int get currentStudyPage => throw _privateConstructorUsedError;
  int get maxStudyPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardTaskStateCopyWith<FlashcardTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardTaskStateCopyWith<$Res> {
  factory $FlashcardTaskStateCopyWith(
          FlashcardTaskState value, $Res Function(FlashcardTaskState) then) =
      _$FlashcardTaskStateCopyWithImpl<$Res, FlashcardTaskState>;
  @useResult
  $Res call({int currentStudyPage, int maxStudyPage});
}

/// @nodoc
class _$FlashcardTaskStateCopyWithImpl<$Res, $Val extends FlashcardTaskState>
    implements $FlashcardTaskStateCopyWith<$Res> {
  _$FlashcardTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStudyPage = null,
    Object? maxStudyPage = null,
  }) {
    return _then(_value.copyWith(
      currentStudyPage: null == currentStudyPage
          ? _value.currentStudyPage
          : currentStudyPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxStudyPage: null == maxStudyPage
          ? _value.maxStudyPage
          : maxStudyPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardTaskStateImplCopyWith<$Res>
    implements $FlashcardTaskStateCopyWith<$Res> {
  factory _$$FlashcardTaskStateImplCopyWith(_$FlashcardTaskStateImpl value,
          $Res Function(_$FlashcardTaskStateImpl) then) =
      __$$FlashcardTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStudyPage, int maxStudyPage});
}

/// @nodoc
class __$$FlashcardTaskStateImplCopyWithImpl<$Res>
    extends _$FlashcardTaskStateCopyWithImpl<$Res, _$FlashcardTaskStateImpl>
    implements _$$FlashcardTaskStateImplCopyWith<$Res> {
  __$$FlashcardTaskStateImplCopyWithImpl(_$FlashcardTaskStateImpl _value,
      $Res Function(_$FlashcardTaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStudyPage = null,
    Object? maxStudyPage = null,
  }) {
    return _then(_$FlashcardTaskStateImpl(
      currentStudyPage: null == currentStudyPage
          ? _value.currentStudyPage
          : currentStudyPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxStudyPage: null == maxStudyPage
          ? _value.maxStudyPage
          : maxStudyPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FlashcardTaskStateImpl implements _FlashcardTaskState {
  _$FlashcardTaskStateImpl(
      {required this.currentStudyPage, required this.maxStudyPage});

  @override
  final int currentStudyPage;
  @override
  final int maxStudyPage;

  @override
  String toString() {
    return 'FlashcardTaskState(currentStudyPage: $currentStudyPage, maxStudyPage: $maxStudyPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardTaskStateImpl &&
            (identical(other.currentStudyPage, currentStudyPage) ||
                other.currentStudyPage == currentStudyPage) &&
            (identical(other.maxStudyPage, maxStudyPage) ||
                other.maxStudyPage == maxStudyPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStudyPage, maxStudyPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardTaskStateImplCopyWith<_$FlashcardTaskStateImpl> get copyWith =>
      __$$FlashcardTaskStateImplCopyWithImpl<_$FlashcardTaskStateImpl>(
          this, _$identity);
}

abstract class _FlashcardTaskState implements FlashcardTaskState {
  factory _FlashcardTaskState(
      {required final int currentStudyPage,
      required final int maxStudyPage}) = _$FlashcardTaskStateImpl;

  @override
  int get currentStudyPage;
  @override
  int get maxStudyPage;
  @override
  @JsonKey(ignore: true)
  _$$FlashcardTaskStateImplCopyWith<_$FlashcardTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
