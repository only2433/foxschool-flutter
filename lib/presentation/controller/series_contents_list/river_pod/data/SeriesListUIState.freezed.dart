// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SeriesListUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeriesListUIState {
  bool get isContentsLoading => throw _privateConstructorUsedError;
  Color get titleColor => throw _privateConstructorUsedError;
  String get seriesColor => throw _privateConstructorUsedError;
  bool get isFullName => throw _privateConstructorUsedError;
  List<ContentsBaseResult> get itemList => throw _privateConstructorUsedError;
  int get selectItemCount => throw _privateConstructorUsedError;
  bool get isEnableBottomSelectView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesListUIStateCopyWith<SeriesListUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesListUIStateCopyWith<$Res> {
  factory $SeriesListUIStateCopyWith(
          SeriesListUIState value, $Res Function(SeriesListUIState) then) =
      _$SeriesListUIStateCopyWithImpl<$Res, SeriesListUIState>;
  @useResult
  $Res call(
      {bool isContentsLoading,
      Color titleColor,
      String seriesColor,
      bool isFullName,
      List<ContentsBaseResult> itemList,
      int selectItemCount,
      bool isEnableBottomSelectView});
}

/// @nodoc
class _$SeriesListUIStateCopyWithImpl<$Res, $Val extends SeriesListUIState>
    implements $SeriesListUIStateCopyWith<$Res> {
  _$SeriesListUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? titleColor = null,
    Object? seriesColor = null,
    Object? isFullName = null,
    Object? itemList = null,
    Object? selectItemCount = null,
    Object? isEnableBottomSelectView = null,
  }) {
    return _then(_value.copyWith(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      seriesColor: null == seriesColor
          ? _value.seriesColor
          : seriesColor // ignore: cast_nullable_to_non_nullable
              as String,
      isFullName: null == isFullName
          ? _value.isFullName
          : isFullName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SeriesListUIStateImplCopyWith<$Res>
    implements $SeriesListUIStateCopyWith<$Res> {
  factory _$$SeriesListUIStateImplCopyWith(_$SeriesListUIStateImpl value,
          $Res Function(_$SeriesListUIStateImpl) then) =
      __$$SeriesListUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isContentsLoading,
      Color titleColor,
      String seriesColor,
      bool isFullName,
      List<ContentsBaseResult> itemList,
      int selectItemCount,
      bool isEnableBottomSelectView});
}

/// @nodoc
class __$$SeriesListUIStateImplCopyWithImpl<$Res>
    extends _$SeriesListUIStateCopyWithImpl<$Res, _$SeriesListUIStateImpl>
    implements _$$SeriesListUIStateImplCopyWith<$Res> {
  __$$SeriesListUIStateImplCopyWithImpl(_$SeriesListUIStateImpl _value,
      $Res Function(_$SeriesListUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? titleColor = null,
    Object? seriesColor = null,
    Object? isFullName = null,
    Object? itemList = null,
    Object? selectItemCount = null,
    Object? isEnableBottomSelectView = null,
  }) {
    return _then(_$SeriesListUIStateImpl(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      seriesColor: null == seriesColor
          ? _value.seriesColor
          : seriesColor // ignore: cast_nullable_to_non_nullable
              as String,
      isFullName: null == isFullName
          ? _value.isFullName
          : isFullName // ignore: cast_nullable_to_non_nullable
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

class _$SeriesListUIStateImpl implements _SeriesListUIState {
  _$SeriesListUIStateImpl(
      {required this.isContentsLoading,
      required this.titleColor,
      required this.seriesColor,
      required this.isFullName,
      required final List<ContentsBaseResult> itemList,
      required this.selectItemCount,
      required this.isEnableBottomSelectView})
      : _itemList = itemList;

  @override
  final bool isContentsLoading;
  @override
  final Color titleColor;
  @override
  final String seriesColor;
  @override
  final bool isFullName;
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
    return 'SeriesListUIState(isContentsLoading: $isContentsLoading, titleColor: $titleColor, seriesColor: $seriesColor, isFullName: $isFullName, itemList: $itemList, selectItemCount: $selectItemCount, isEnableBottomSelectView: $isEnableBottomSelectView)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesListUIStateImpl &&
            (identical(other.isContentsLoading, isContentsLoading) ||
                other.isContentsLoading == isContentsLoading) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.seriesColor, seriesColor) ||
                other.seriesColor == seriesColor) &&
            (identical(other.isFullName, isFullName) ||
                other.isFullName == isFullName) &&
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
      titleColor,
      seriesColor,
      isFullName,
      const DeepCollectionEquality().hash(_itemList),
      selectItemCount,
      isEnableBottomSelectView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesListUIStateImplCopyWith<_$SeriesListUIStateImpl> get copyWith =>
      __$$SeriesListUIStateImplCopyWithImpl<_$SeriesListUIStateImpl>(
          this, _$identity);
}

abstract class _SeriesListUIState implements SeriesListUIState {
  factory _SeriesListUIState(
      {required final bool isContentsLoading,
      required final Color titleColor,
      required final String seriesColor,
      required final bool isFullName,
      required final List<ContentsBaseResult> itemList,
      required final int selectItemCount,
      required final bool isEnableBottomSelectView}) = _$SeriesListUIStateImpl;

  @override
  bool get isContentsLoading;
  @override
  Color get titleColor;
  @override
  String get seriesColor;
  @override
  bool get isFullName;
  @override
  List<ContentsBaseResult> get itemList;
  @override
  int get selectItemCount;
  @override
  bool get isEnableBottomSelectView;
  @override
  @JsonKey(ignore: true)
  _$$SeriesListUIStateImplCopyWith<_$SeriesListUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
