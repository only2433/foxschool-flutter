// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BookshelfListUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookshelfListUIState {
  bool get isContentsLoading => throw _privateConstructorUsedError;
  List<ContentsBaseResult> get itemList => throw _privateConstructorUsedError;
  int get selectItemCount => throw _privateConstructorUsedError;
  bool get isEnableBottomSelectView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookshelfListUIStateCopyWith<BookshelfListUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookshelfListUIStateCopyWith<$Res> {
  factory $BookshelfListUIStateCopyWith(BookshelfListUIState value,
          $Res Function(BookshelfListUIState) then) =
      _$BookshelfListUIStateCopyWithImpl<$Res, BookshelfListUIState>;
  @useResult
  $Res call(
      {bool isContentsLoading,
      List<ContentsBaseResult> itemList,
      int selectItemCount,
      bool isEnableBottomSelectView});
}

/// @nodoc
class _$BookshelfListUIStateCopyWithImpl<$Res,
        $Val extends BookshelfListUIState>
    implements $BookshelfListUIStateCopyWith<$Res> {
  _$BookshelfListUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? itemList = null,
    Object? selectItemCount = null,
    Object? isEnableBottomSelectView = null,
  }) {
    return _then(_value.copyWith(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      selectItemCount: null == selectItemCount
          ? _value.selectItemCount
          : selectItemCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnableBottomSelectView: null == isEnableBottomSelectView
          ? _value.isEnableBottomSelectView
          : isEnableBottomSelectView // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookshelfListUIStateImplCopyWith<$Res>
    implements $BookshelfListUIStateCopyWith<$Res> {
  factory _$$BookshelfListUIStateImplCopyWith(_$BookshelfListUIStateImpl value,
          $Res Function(_$BookshelfListUIStateImpl) then) =
      __$$BookshelfListUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isContentsLoading,
      List<ContentsBaseResult> itemList,
      int selectItemCount,
      bool isEnableBottomSelectView});
}

/// @nodoc
class __$$BookshelfListUIStateImplCopyWithImpl<$Res>
    extends _$BookshelfListUIStateCopyWithImpl<$Res, _$BookshelfListUIStateImpl>
    implements _$$BookshelfListUIStateImplCopyWith<$Res> {
  __$$BookshelfListUIStateImplCopyWithImpl(_$BookshelfListUIStateImpl _value,
      $Res Function(_$BookshelfListUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? itemList = null,
    Object? selectItemCount = null,
    Object? isEnableBottomSelectView = null,
  }) {
    return _then(_$BookshelfListUIStateImpl(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemList: null == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      selectItemCount: null == selectItemCount
          ? _value.selectItemCount
          : selectItemCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnableBottomSelectView: null == isEnableBottomSelectView
          ? _value.isEnableBottomSelectView
          : isEnableBottomSelectView // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookshelfListUIStateImpl implements _BookshelfListUIState {
  _$BookshelfListUIStateImpl(
      {required this.isContentsLoading,
      required final List<ContentsBaseResult> itemList,
      required this.selectItemCount,
      required this.isEnableBottomSelectView})
      : _itemList = itemList;

  @override
  final bool isContentsLoading;
  final List<ContentsBaseResult> _itemList;
  @override
  List<ContentsBaseResult> get itemList {
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemList);
  }

  @override
  final int selectItemCount;
  @override
  final bool isEnableBottomSelectView;

  @override
  String toString() {
    return 'BookshelfListUIState(isContentsLoading: $isContentsLoading, itemList: $itemList, selectItemCount: $selectItemCount, isEnableBottomSelectView: $isEnableBottomSelectView)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookshelfListUIStateImpl &&
            (identical(other.isContentsLoading, isContentsLoading) ||
                other.isContentsLoading == isContentsLoading) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            (identical(other.selectItemCount, selectItemCount) ||
                other.selectItemCount == selectItemCount) &&
            (identical(
                    other.isEnableBottomSelectView, isEnableBottomSelectView) ||
                other.isEnableBottomSelectView == isEnableBottomSelectView));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isContentsLoading,
      const DeepCollectionEquality().hash(_itemList),
      selectItemCount,
      isEnableBottomSelectView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookshelfListUIStateImplCopyWith<_$BookshelfListUIStateImpl>
      get copyWith =>
          __$$BookshelfListUIStateImplCopyWithImpl<_$BookshelfListUIStateImpl>(
              this, _$identity);
}

abstract class _BookshelfListUIState implements BookshelfListUIState {
  factory _BookshelfListUIState(
          {required final bool isContentsLoading,
          required final List<ContentsBaseResult> itemList,
          required final int selectItemCount,
          required final bool isEnableBottomSelectView}) =
      _$BookshelfListUIStateImpl;

  @override
  bool get isContentsLoading;
  @override
  List<ContentsBaseResult> get itemList;
  @override
  int get selectItemCount;
  @override
  bool get isEnableBottomSelectView;
  @override
  @JsonKey(ignore: true)
  _$$BookshelfListUIStateImplCopyWith<_$BookshelfListUIStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
