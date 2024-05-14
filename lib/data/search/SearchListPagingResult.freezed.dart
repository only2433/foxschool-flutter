// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchListPagingResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchListPagingResult _$SearchListPagingResultFromJson(
    Map<String, dynamic> json) {
  return _SearchListPagingResult.fromJson(json);
}

/// @nodoc
mixin _$SearchListPagingResult {
  List<ContentsBaseResult> get list => throw _privateConstructorUsedError;
  MetaDataPagingResult? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchListPagingResultCopyWith<SearchListPagingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchListPagingResultCopyWith<$Res> {
  factory $SearchListPagingResultCopyWith(SearchListPagingResult value,
          $Res Function(SearchListPagingResult) then) =
      _$SearchListPagingResultCopyWithImpl<$Res, SearchListPagingResult>;
  @useResult
  $Res call({List<ContentsBaseResult> list, MetaDataPagingResult? meta});

  $MetaDataPagingResultCopyWith<$Res>? get meta;
}

/// @nodoc
class _$SearchListPagingResultCopyWithImpl<$Res,
        $Val extends SearchListPagingResult>
    implements $SearchListPagingResultCopyWith<$Res> {
  _$SearchListPagingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDataPagingResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDataPagingResultCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaDataPagingResultCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchListPagingResultImplCopyWith<$Res>
    implements $SearchListPagingResultCopyWith<$Res> {
  factory _$$SearchListPagingResultImplCopyWith(
          _$SearchListPagingResultImpl value,
          $Res Function(_$SearchListPagingResultImpl) then) =
      __$$SearchListPagingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContentsBaseResult> list, MetaDataPagingResult? meta});

  @override
  $MetaDataPagingResultCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$SearchListPagingResultImplCopyWithImpl<$Res>
    extends _$SearchListPagingResultCopyWithImpl<$Res,
        _$SearchListPagingResultImpl>
    implements _$$SearchListPagingResultImplCopyWith<$Res> {
  __$$SearchListPagingResultImplCopyWithImpl(
      _$SearchListPagingResultImpl _value,
      $Res Function(_$SearchListPagingResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? meta = freezed,
  }) {
    return _then(_$SearchListPagingResultImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDataPagingResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchListPagingResultImpl extends _SearchListPagingResult {
  _$SearchListPagingResultImpl(
      {final List<ContentsBaseResult> list = const [], this.meta})
      : _list = list,
        super._();

  factory _$SearchListPagingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchListPagingResultImplFromJson(json);

  final List<ContentsBaseResult> _list;
  @override
  @JsonKey()
  List<ContentsBaseResult> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final MetaDataPagingResult? meta;

  @override
  String toString() {
    return 'SearchListPagingResult(list: $list, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchListPagingResultImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchListPagingResultImplCopyWith<_$SearchListPagingResultImpl>
      get copyWith => __$$SearchListPagingResultImplCopyWithImpl<
          _$SearchListPagingResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchListPagingResultImplToJson(
      this,
    );
  }
}

abstract class _SearchListPagingResult extends SearchListPagingResult {
  factory _SearchListPagingResult(
      {final List<ContentsBaseResult> list,
      final MetaDataPagingResult? meta}) = _$SearchListPagingResultImpl;
  _SearchListPagingResult._() : super._();

  factory _SearchListPagingResult.fromJson(Map<String, dynamic> json) =
      _$SearchListPagingResultImpl.fromJson;

  @override
  List<ContentsBaseResult> get list;
  @override
  MetaDataPagingResult? get meta;
  @override
  @JsonKey(ignore: true)
  _$$SearchListPagingResultImplCopyWith<_$SearchListPagingResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
