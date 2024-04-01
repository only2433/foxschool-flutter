// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'StoryCategoryContentsResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryCategoryContentsResult _$StoryCategoryContentsResultFromJson(
    Map<String, dynamic> json) {
  return _StoryCategoryContentsResult.fromJson(json);
}

/// @nodoc
mixin _$StoryCategoryContentsResult {
  @JsonKey(name: 'theme_info')
  ThemeData? get themeInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'children')
  List<SeriesInformationResult> get itemList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCategoryContentsResultCopyWith<StoryCategoryContentsResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCategoryContentsResultCopyWith<$Res> {
  factory $StoryCategoryContentsResultCopyWith(
          StoryCategoryContentsResult value,
          $Res Function(StoryCategoryContentsResult) then) =
      _$StoryCategoryContentsResultCopyWithImpl<$Res,
          StoryCategoryContentsResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'theme_info') ThemeData? themeInfo,
      @JsonKey(name: 'children') List<SeriesInformationResult> itemList});

  $ThemeDataCopyWith<$Res>? get themeInfo;
}

/// @nodoc
class _$StoryCategoryContentsResultCopyWithImpl<$Res,
        $Val extends StoryCategoryContentsResult>
    implements $StoryCategoryContentsResultCopyWith<$Res> {
  _$StoryCategoryContentsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeInfo = freezed,
    Object? itemList = null,
  }) {
    return _then(_value.copyWith(
      themeInfo: freezed == themeInfo
          ? _value.themeInfo
          : themeInfo // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeDataCopyWith<$Res>? get themeInfo {
    if (_value.themeInfo == null) {
      return null;
    }

    return $ThemeDataCopyWith<$Res>(_value.themeInfo!, (value) {
      return _then(_value.copyWith(themeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryCategoryContentsResultImplCopyWith<$Res>
    implements $StoryCategoryContentsResultCopyWith<$Res> {
  factory _$$StoryCategoryContentsResultImplCopyWith(
          _$StoryCategoryContentsResultImpl value,
          $Res Function(_$StoryCategoryContentsResultImpl) then) =
      __$$StoryCategoryContentsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'theme_info') ThemeData? themeInfo,
      @JsonKey(name: 'children') List<SeriesInformationResult> itemList});

  @override
  $ThemeDataCopyWith<$Res>? get themeInfo;
}

/// @nodoc
class __$$StoryCategoryContentsResultImplCopyWithImpl<$Res>
    extends _$StoryCategoryContentsResultCopyWithImpl<$Res,
        _$StoryCategoryContentsResultImpl>
    implements _$$StoryCategoryContentsResultImplCopyWith<$Res> {
  __$$StoryCategoryContentsResultImplCopyWithImpl(
      _$StoryCategoryContentsResultImpl _value,
      $Res Function(_$StoryCategoryContentsResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeInfo = freezed,
    Object? itemList = null,
  }) {
    return _then(_$StoryCategoryContentsResultImpl(
      themeInfo: freezed == themeInfo
          ? _value.themeInfo
          : themeInfo // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      itemList: null == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryCategoryContentsResultImpl
    implements _StoryCategoryContentsResult {
  _$StoryCategoryContentsResultImpl(
      {@JsonKey(name: 'theme_info') this.themeInfo,
      @JsonKey(name: 'children')
      final List<SeriesInformationResult> itemList = const []})
      : _itemList = itemList;

  factory _$StoryCategoryContentsResultImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StoryCategoryContentsResultImplFromJson(json);

  @override
  @JsonKey(name: 'theme_info')
  final ThemeData? themeInfo;
  final List<SeriesInformationResult> _itemList;
  @override
  @JsonKey(name: 'children')
  List<SeriesInformationResult> get itemList {
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemList);
  }

  @override
  String toString() {
    return 'StoryCategoryContentsResult(themeInfo: $themeInfo, itemList: $itemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryCategoryContentsResultImpl &&
            (identical(other.themeInfo, themeInfo) ||
                other.themeInfo == themeInfo) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, themeInfo, const DeepCollectionEquality().hash(_itemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryCategoryContentsResultImplCopyWith<_$StoryCategoryContentsResultImpl>
      get copyWith => __$$StoryCategoryContentsResultImplCopyWithImpl<
          _$StoryCategoryContentsResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryCategoryContentsResultImplToJson(
      this,
    );
  }
}

abstract class _StoryCategoryContentsResult
    implements StoryCategoryContentsResult {
  factory _StoryCategoryContentsResult(
          {@JsonKey(name: 'theme_info') final ThemeData? themeInfo,
          @JsonKey(name: 'children')
          final List<SeriesInformationResult> itemList}) =
      _$StoryCategoryContentsResultImpl;

  factory _StoryCategoryContentsResult.fromJson(Map<String, dynamic> json) =
      _$StoryCategoryContentsResultImpl.fromJson;

  @override
  @JsonKey(name: 'theme_info')
  ThemeData? get themeInfo;
  @override
  @JsonKey(name: 'children')
  List<SeriesInformationResult> get itemList;
  @override
  @JsonKey(ignore: true)
  _$$StoryCategoryContentsResultImplCopyWith<_$StoryCategoryContentsResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
