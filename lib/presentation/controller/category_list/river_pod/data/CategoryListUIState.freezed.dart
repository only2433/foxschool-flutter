// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CategoryListUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryListUIState {
  bool get isContentsLoading => throw _privateConstructorUsedError;
  Color get titleColor => throw _privateConstructorUsedError;
  List<SeriesInformationResult> get contentsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryListUIStateCopyWith<CategoryListUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListUIStateCopyWith<$Res> {
  factory $CategoryListUIStateCopyWith(
          CategoryListUIState value, $Res Function(CategoryListUIState) then) =
      _$CategoryListUIStateCopyWithImpl<$Res, CategoryListUIState>;
  @useResult
  $Res call(
      {bool isContentsLoading,
      Color titleColor,
      List<SeriesInformationResult> contentsList});
}

/// @nodoc
class _$CategoryListUIStateCopyWithImpl<$Res, $Val extends CategoryListUIState>
    implements $CategoryListUIStateCopyWith<$Res> {
  _$CategoryListUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? titleColor = null,
    Object? contentsList = null,
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
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryListUIStateImplCopyWith<$Res>
    implements $CategoryListUIStateCopyWith<$Res> {
  factory _$$CategoryListUIStateImplCopyWith(_$CategoryListUIStateImpl value,
          $Res Function(_$CategoryListUIStateImpl) then) =
      __$$CategoryListUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isContentsLoading,
      Color titleColor,
      List<SeriesInformationResult> contentsList});
}

/// @nodoc
class __$$CategoryListUIStateImplCopyWithImpl<$Res>
    extends _$CategoryListUIStateCopyWithImpl<$Res, _$CategoryListUIStateImpl>
    implements _$$CategoryListUIStateImplCopyWith<$Res> {
  __$$CategoryListUIStateImplCopyWithImpl(_$CategoryListUIStateImpl _value,
      $Res Function(_$CategoryListUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? titleColor = null,
    Object? contentsList = null,
  }) {
    return _then(_$CategoryListUIStateImpl(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ));
  }
}

/// @nodoc

class _$CategoryListUIStateImpl implements _CategoryListUIState {
  _$CategoryListUIStateImpl(
      {required this.isContentsLoading,
      required this.titleColor,
      required final List<SeriesInformationResult> contentsList})
      : _contentsList = contentsList;

  @override
  final bool isContentsLoading;
  @override
  final Color titleColor;
  final List<SeriesInformationResult> _contentsList;
  @override
  List<SeriesInformationResult> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

  @override
  String toString() {
    return 'CategoryListUIState(isContentsLoading: $isContentsLoading, titleColor: $titleColor, contentsList: $contentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListUIStateImpl &&
            (identical(other.isContentsLoading, isContentsLoading) ||
                other.isContentsLoading == isContentsLoading) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isContentsLoading, titleColor,
      const DeepCollectionEquality().hash(_contentsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListUIStateImplCopyWith<_$CategoryListUIStateImpl> get copyWith =>
      __$$CategoryListUIStateImplCopyWithImpl<_$CategoryListUIStateImpl>(
          this, _$identity);
}

abstract class _CategoryListUIState implements CategoryListUIState {
  factory _CategoryListUIState(
          {required final bool isContentsLoading,
          required final Color titleColor,
          required final List<SeriesInformationResult> contentsList}) =
      _$CategoryListUIStateImpl;

  @override
  bool get isContentsLoading;
  @override
  Color get titleColor;
  @override
  List<SeriesInformationResult> get contentsList;
  @override
  @JsonKey(ignore: true)
  _$$CategoryListUIStateImplCopyWith<_$CategoryListUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
