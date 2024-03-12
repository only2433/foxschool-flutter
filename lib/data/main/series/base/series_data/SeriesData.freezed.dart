// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SeriesData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeriesData _$SeriesDataFromJson(Map<String, dynamic> json) {
  return _SeriesData.fromJson(json);
}

/// @nodoc
mixin _$SeriesData {
  String get introduction => throw _privateConstructorUsedError;
  String get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesDataCopyWith<SeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesDataCopyWith<$Res> {
  factory $SeriesDataCopyWith(
          SeriesData value, $Res Function(SeriesData) then) =
      _$SeriesDataCopyWithImpl<$Res, SeriesData>;
  @useResult
  $Res call({String introduction, String categories});
}

/// @nodoc
class _$SeriesDataCopyWithImpl<$Res, $Val extends SeriesData>
    implements $SeriesDataCopyWith<$Res> {
  _$SeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introduction = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      introduction: null == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesDataImplCopyWith<$Res>
    implements $SeriesDataCopyWith<$Res> {
  factory _$$SeriesDataImplCopyWith(
          _$SeriesDataImpl value, $Res Function(_$SeriesDataImpl) then) =
      __$$SeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String introduction, String categories});
}

/// @nodoc
class __$$SeriesDataImplCopyWithImpl<$Res>
    extends _$SeriesDataCopyWithImpl<$Res, _$SeriesDataImpl>
    implements _$$SeriesDataImplCopyWith<$Res> {
  __$$SeriesDataImplCopyWithImpl(
      _$SeriesDataImpl _value, $Res Function(_$SeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introduction = null,
    Object? categories = null,
  }) {
    return _then(_$SeriesDataImpl(
      introduction: null == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesDataImpl implements _SeriesData {
  _$SeriesDataImpl({this.introduction = "", this.categories = ""});

  factory _$SeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesDataImplFromJson(json);

  @override
  @JsonKey()
  final String introduction;
  @override
  @JsonKey()
  final String categories;

  @override
  String toString() {
    return 'SeriesData(introduction: $introduction, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesDataImpl &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, introduction, categories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesDataImplCopyWith<_$SeriesDataImpl> get copyWith =>
      __$$SeriesDataImplCopyWithImpl<_$SeriesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesDataImplToJson(
      this,
    );
  }
}

abstract class _SeriesData implements SeriesData {
  factory _SeriesData({final String introduction, final String categories}) =
      _$SeriesDataImpl;

  factory _SeriesData.fromJson(Map<String, dynamic> json) =
      _$SeriesDataImpl.fromJson;

  @override
  String get introduction;
  @override
  String get categories;
  @override
  @JsonKey(ignore: true)
  _$$SeriesDataImplCopyWith<_$SeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
