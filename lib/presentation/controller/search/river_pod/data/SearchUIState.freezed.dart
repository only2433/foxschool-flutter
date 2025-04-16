// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchUIState {
  SearchType get searchType => throw _privateConstructorUsedError;
  SearchItemLoadType get itemLoadType => throw _privateConstructorUsedError;
  List<ContentsBaseResult> get contentsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchUIStateCopyWith<SearchUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUIStateCopyWith<$Res> {
  factory $SearchUIStateCopyWith(
          SearchUIState value, $Res Function(SearchUIState) then) =
      _$SearchUIStateCopyWithImpl<$Res, SearchUIState>;
  @useResult
  $Res call(
      {SearchType searchType,
      SearchItemLoadType itemLoadType,
      List<ContentsBaseResult> contentsList});
}

/// @nodoc
class _$SearchUIStateCopyWithImpl<$Res, $Val extends SearchUIState>
    implements $SearchUIStateCopyWith<$Res> {
  _$SearchUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchType = null,
    Object? itemLoadType = null,
    Object? contentsList = null,
  }) {
    return _then(_value.copyWith(
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
      itemLoadType: null == itemLoadType
          ? _value.itemLoadType
          : itemLoadType // ignore: cast_nullable_to_non_nullable
              as SearchItemLoadType,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUIStateImplCopyWith<$Res>
    implements $SearchUIStateCopyWith<$Res> {
  factory _$$SearchUIStateImplCopyWith(
          _$SearchUIStateImpl value, $Res Function(_$SearchUIStateImpl) then) =
      __$$SearchUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchType searchType,
      SearchItemLoadType itemLoadType,
      List<ContentsBaseResult> contentsList});
}

/// @nodoc
class __$$SearchUIStateImplCopyWithImpl<$Res>
    extends _$SearchUIStateCopyWithImpl<$Res, _$SearchUIStateImpl>
    implements _$$SearchUIStateImplCopyWith<$Res> {
  __$$SearchUIStateImplCopyWithImpl(
      _$SearchUIStateImpl _value, $Res Function(_$SearchUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchType = null,
    Object? itemLoadType = null,
    Object? contentsList = null,
  }) {
    return _then(_$SearchUIStateImpl(
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
      itemLoadType: null == itemLoadType
          ? _value.itemLoadType
          : itemLoadType // ignore: cast_nullable_to_non_nullable
              as SearchItemLoadType,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
    ));
  }
}

/// @nodoc

class _$SearchUIStateImpl implements _SearchUIState {
  _$SearchUIStateImpl(
      {required this.searchType,
      required this.itemLoadType,
      required final List<ContentsBaseResult> contentsList})
      : _contentsList = contentsList;

  @override
  final SearchType searchType;
  @override
  final SearchItemLoadType itemLoadType;
  final List<ContentsBaseResult> _contentsList;
  @override
  List<ContentsBaseResult> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

  @override
  String toString() {
    return 'SearchUIState(searchType: $searchType, itemLoadType: $itemLoadType, contentsList: $contentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUIStateImpl &&
            (identical(other.searchType, searchType) ||
                other.searchType == searchType) &&
            (identical(other.itemLoadType, itemLoadType) ||
                other.itemLoadType == itemLoadType) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchType, itemLoadType,
      const DeepCollectionEquality().hash(_contentsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUIStateImplCopyWith<_$SearchUIStateImpl> get copyWith =>
      __$$SearchUIStateImplCopyWithImpl<_$SearchUIStateImpl>(this, _$identity);
}

abstract class _SearchUIState implements SearchUIState {
  factory _SearchUIState(
          {required final SearchType searchType,
          required final SearchItemLoadType itemLoadType,
          required final List<ContentsBaseResult> contentsList}) =
      _$SearchUIStateImpl;

  @override
  SearchType get searchType;
  @override
  SearchItemLoadType get itemLoadType;
  @override
  List<ContentsBaseResult> get contentsList;
  @override
  @JsonKey(ignore: true)
  _$$SearchUIStateImplCopyWith<_$SearchUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
