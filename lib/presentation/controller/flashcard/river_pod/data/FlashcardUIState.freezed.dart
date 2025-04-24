// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FlashcardUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardUIState {
  List<Widget> get pageList => throw _privateConstructorUsedError;
  bool get isAutoMode => throw _privateConstructorUsedError;
  bool get isShuffleMode => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  bool get isShowHelpPage => throw _privateConstructorUsedError;
  List<FlashcardDataResult> get flashcardItemList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardUIStateCopyWith<FlashcardUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardUIStateCopyWith<$Res> {
  factory $FlashcardUIStateCopyWith(
          FlashcardUIState value, $Res Function(FlashcardUIState) then) =
      _$FlashcardUIStateCopyWithImpl<$Res, FlashcardUIState>;
  @useResult
  $Res call(
      {List<Widget> pageList,
      bool isAutoMode,
      bool isShuffleMode,
      bool isBookmarked,
      bool isShowHelpPage,
      List<FlashcardDataResult> flashcardItemList});
}

/// @nodoc
class _$FlashcardUIStateCopyWithImpl<$Res, $Val extends FlashcardUIState>
    implements $FlashcardUIStateCopyWith<$Res> {
  _$FlashcardUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageList = null,
    Object? isAutoMode = null,
    Object? isShuffleMode = null,
    Object? isBookmarked = null,
    Object? isShowHelpPage = null,
    Object? flashcardItemList = null,
  }) {
    return _then(_value.copyWith(
      pageList: null == pageList
          ? _value.pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      isAutoMode: null == isAutoMode
          ? _value.isAutoMode
          : isAutoMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffleMode: null == isShuffleMode
          ? _value.isShuffleMode
          : isShuffleMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowHelpPage: null == isShowHelpPage
          ? _value.isShowHelpPage
          : isShowHelpPage // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardItemList: null == flashcardItemList
          ? _value.flashcardItemList
          : flashcardItemList // ignore: cast_nullable_to_non_nullable
              as List<FlashcardDataResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardUIStateImplCopyWith<$Res>
    implements $FlashcardUIStateCopyWith<$Res> {
  factory _$$FlashcardUIStateImplCopyWith(_$FlashcardUIStateImpl value,
          $Res Function(_$FlashcardUIStateImpl) then) =
      __$$FlashcardUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Widget> pageList,
      bool isAutoMode,
      bool isShuffleMode,
      bool isBookmarked,
      bool isShowHelpPage,
      List<FlashcardDataResult> flashcardItemList});
}

/// @nodoc
class __$$FlashcardUIStateImplCopyWithImpl<$Res>
    extends _$FlashcardUIStateCopyWithImpl<$Res, _$FlashcardUIStateImpl>
    implements _$$FlashcardUIStateImplCopyWith<$Res> {
  __$$FlashcardUIStateImplCopyWithImpl(_$FlashcardUIStateImpl _value,
      $Res Function(_$FlashcardUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageList = null,
    Object? isAutoMode = null,
    Object? isShuffleMode = null,
    Object? isBookmarked = null,
    Object? isShowHelpPage = null,
    Object? flashcardItemList = null,
  }) {
    return _then(_$FlashcardUIStateImpl(
      pageList: null == pageList
          ? _value._pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      isAutoMode: null == isAutoMode
          ? _value.isAutoMode
          : isAutoMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isShuffleMode: null == isShuffleMode
          ? _value.isShuffleMode
          : isShuffleMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowHelpPage: null == isShowHelpPage
          ? _value.isShowHelpPage
          : isShowHelpPage // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardItemList: null == flashcardItemList
          ? _value._flashcardItemList
          : flashcardItemList // ignore: cast_nullable_to_non_nullable
              as List<FlashcardDataResult>,
    ));
  }
}

/// @nodoc

class _$FlashcardUIStateImpl implements _FlashcardUIState {
  _$FlashcardUIStateImpl(
      {required final List<Widget> pageList,
      required this.isAutoMode,
      required this.isShuffleMode,
      required this.isBookmarked,
      required this.isShowHelpPage,
      required final List<FlashcardDataResult> flashcardItemList})
      : _pageList = pageList,
        _flashcardItemList = flashcardItemList;

  final List<Widget> _pageList;
  @override
  List<Widget> get pageList {
    if (_pageList is EqualUnmodifiableListView) return _pageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageList);
  }

  @override
  final bool isAutoMode;
  @override
  final bool isShuffleMode;
  @override
  final bool isBookmarked;
  @override
  final bool isShowHelpPage;
  final List<FlashcardDataResult> _flashcardItemList;
  @override
  List<FlashcardDataResult> get flashcardItemList {
    if (_flashcardItemList is EqualUnmodifiableListView)
      return _flashcardItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcardItemList);
  }

  @override
  String toString() {
    return 'FlashcardUIState(pageList: $pageList, isAutoMode: $isAutoMode, isShuffleMode: $isShuffleMode, isBookmarked: $isBookmarked, isShowHelpPage: $isShowHelpPage, flashcardItemList: $flashcardItemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardUIStateImpl &&
            const DeepCollectionEquality().equals(other._pageList, _pageList) &&
            (identical(other.isAutoMode, isAutoMode) ||
                other.isAutoMode == isAutoMode) &&
            (identical(other.isShuffleMode, isShuffleMode) ||
                other.isShuffleMode == isShuffleMode) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isShowHelpPage, isShowHelpPage) ||
                other.isShowHelpPage == isShowHelpPage) &&
            const DeepCollectionEquality()
                .equals(other._flashcardItemList, _flashcardItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pageList),
      isAutoMode,
      isShuffleMode,
      isBookmarked,
      isShowHelpPage,
      const DeepCollectionEquality().hash(_flashcardItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardUIStateImplCopyWith<_$FlashcardUIStateImpl> get copyWith =>
      __$$FlashcardUIStateImplCopyWithImpl<_$FlashcardUIStateImpl>(
          this, _$identity);
}

abstract class _FlashcardUIState implements FlashcardUIState {
  factory _FlashcardUIState(
          {required final List<Widget> pageList,
          required final bool isAutoMode,
          required final bool isShuffleMode,
          required final bool isBookmarked,
          required final bool isShowHelpPage,
          required final List<FlashcardDataResult> flashcardItemList}) =
      _$FlashcardUIStateImpl;

  @override
  List<Widget> get pageList;
  @override
  bool get isAutoMode;
  @override
  bool get isShuffleMode;
  @override
  bool get isBookmarked;
  @override
  bool get isShowHelpPage;
  @override
  List<FlashcardDataResult> get flashcardItemList;
  @override
  @JsonKey(ignore: true)
  _$$FlashcardUIStateImplCopyWith<_$FlashcardUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
