// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MainInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainInformationResult _$MainInformationResultFromJson(
    Map<String, dynamic> json) {
  return _MainInformationResult.fromJson(json);
}

/// @nodoc
mixin _$MainInformationResult {
  @JsonKey(name: 'levels')
  List<SeriesInformationResult> get levelsList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'categories')
  List<SeriesInformationResult> get categoriesList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainInformationResultCopyWith<MainInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainInformationResultCopyWith<$Res> {
  factory $MainInformationResultCopyWith(MainInformationResult value,
          $Res Function(MainInformationResult) then) =
      _$MainInformationResultCopyWithImpl<$Res, MainInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'levels') List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      List<SeriesInformationResult> categoriesList});
}

/// @nodoc
class _$MainInformationResultCopyWithImpl<$Res,
        $Val extends MainInformationResult>
    implements $MainInformationResultCopyWith<$Res> {
  _$MainInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelsList = null,
    Object? categoriesList = null,
  }) {
    return _then(_value.copyWith(
      levelsList: null == levelsList
          ? _value.levelsList
          : levelsList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
      categoriesList: null == categoriesList
          ? _value.categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainInformationResultImplCopyWith<$Res>
    implements $MainInformationResultCopyWith<$Res> {
  factory _$$MainInformationResultImplCopyWith(
          _$MainInformationResultImpl value,
          $Res Function(_$MainInformationResultImpl) then) =
      __$$MainInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'levels') List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      List<SeriesInformationResult> categoriesList});
}

/// @nodoc
class __$$MainInformationResultImplCopyWithImpl<$Res>
    extends _$MainInformationResultCopyWithImpl<$Res,
        _$MainInformationResultImpl>
    implements _$$MainInformationResultImplCopyWith<$Res> {
  __$$MainInformationResultImplCopyWithImpl(_$MainInformationResultImpl _value,
      $Res Function(_$MainInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelsList = null,
    Object? categoriesList = null,
  }) {
    return _then(_$MainInformationResultImpl(
      levelsList: null == levelsList
          ? _value._levelsList
          : levelsList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
      categoriesList: null == categoriesList
          ? _value._categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainInformationResultImpl extends _MainInformationResult {
  _$MainInformationResultImpl(
      {@JsonKey(name: 'levels')
      final List<SeriesInformationResult> levelsList = const [],
      @JsonKey(name: 'categories')
      final List<SeriesInformationResult> categoriesList = const []})
      : _levelsList = levelsList,
        _categoriesList = categoriesList,
        super._();

  factory _$MainInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainInformationResultImplFromJson(json);

  final List<SeriesInformationResult> _levelsList;
  @override
  @JsonKey(name: 'levels')
  List<SeriesInformationResult> get levelsList {
    if (_levelsList is EqualUnmodifiableListView) return _levelsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_levelsList);
  }

  final List<SeriesInformationResult> _categoriesList;
  @override
  @JsonKey(name: 'categories')
  List<SeriesInformationResult> get categoriesList {
    if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesList);
  }

  @override
  String toString() {
    return 'MainInformationResult(levelsList: $levelsList, categoriesList: $categoriesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainInformationResultImpl &&
            const DeepCollectionEquality()
                .equals(other._levelsList, _levelsList) &&
            const DeepCollectionEquality()
                .equals(other._categoriesList, _categoriesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_levelsList),
      const DeepCollectionEquality().hash(_categoriesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainInformationResultImplCopyWith<_$MainInformationResultImpl>
      get copyWith => __$$MainInformationResultImplCopyWithImpl<
          _$MainInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainInformationResultImplToJson(
      this,
    );
  }
}

abstract class _MainInformationResult extends MainInformationResult {
  factory _MainInformationResult(
      {@JsonKey(name: 'levels') final List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      final List<SeriesInformationResult>
          categoriesList}) = _$MainInformationResultImpl;
  _MainInformationResult._() : super._();

  factory _MainInformationResult.fromJson(Map<String, dynamic> json) =
      _$MainInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'levels')
  List<SeriesInformationResult> get levelsList;
  @override
  @JsonKey(name: 'categories')
  List<SeriesInformationResult> get categoriesList;
  @override
  @JsonKey(ignore: true)
  _$$MainInformationResultImplCopyWith<_$MainInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
