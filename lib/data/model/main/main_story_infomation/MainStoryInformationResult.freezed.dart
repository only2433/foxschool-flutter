// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MainStoryInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainStoryInformationResult _$MainStoryInformationResultFromJson(
    Map<String, dynamic> json) {
  return _MainStoryInformationResult.fromJson(json);
}

/// @nodoc
mixin _$MainStoryInformationResult {
  @JsonKey(name: 'levels')
  List<SeriesInformationResult> get levelsList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'categories')
  List<SeriesInformationResult> get categoriesList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainStoryInformationResultCopyWith<MainStoryInformationResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStoryInformationResultCopyWith<$Res> {
  factory $MainStoryInformationResultCopyWith(MainStoryInformationResult value,
          $Res Function(MainStoryInformationResult) then) =
      _$MainStoryInformationResultCopyWithImpl<$Res,
          MainStoryInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'levels') List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      List<SeriesInformationResult> categoriesList});
}

/// @nodoc
class _$MainStoryInformationResultCopyWithImpl<$Res,
        $Val extends MainStoryInformationResult>
    implements $MainStoryInformationResultCopyWith<$Res> {
  _$MainStoryInformationResultCopyWithImpl(this._value, this._then);

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
abstract class _$$MainStoryInformationResultImplCopyWith<$Res>
    implements $MainStoryInformationResultCopyWith<$Res> {
  factory _$$MainStoryInformationResultImplCopyWith(
          _$MainStoryInformationResultImpl value,
          $Res Function(_$MainStoryInformationResultImpl) then) =
      __$$MainStoryInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'levels') List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      List<SeriesInformationResult> categoriesList});
}

/// @nodoc
class __$$MainStoryInformationResultImplCopyWithImpl<$Res>
    extends _$MainStoryInformationResultCopyWithImpl<$Res,
        _$MainStoryInformationResultImpl>
    implements _$$MainStoryInformationResultImplCopyWith<$Res> {
  __$$MainStoryInformationResultImplCopyWithImpl(
      _$MainStoryInformationResultImpl _value,
      $Res Function(_$MainStoryInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelsList = null,
    Object? categoriesList = null,
  }) {
    return _then(_$MainStoryInformationResultImpl(
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
class _$MainStoryInformationResultImpl extends _MainStoryInformationResult {
  _$MainStoryInformationResultImpl(
      {@JsonKey(name: 'levels')
      final List<SeriesInformationResult> levelsList = const [],
      @JsonKey(name: 'categories')
      final List<SeriesInformationResult> categoriesList = const []})
      : _levelsList = levelsList,
        _categoriesList = categoriesList,
        super._();

  factory _$MainStoryInformationResultImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MainStoryInformationResultImplFromJson(json);

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
    return 'MainStoryInformationResult(levelsList: $levelsList, categoriesList: $categoriesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStoryInformationResultImpl &&
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
  _$$MainStoryInformationResultImplCopyWith<_$MainStoryInformationResultImpl>
      get copyWith => __$$MainStoryInformationResultImplCopyWithImpl<
          _$MainStoryInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainStoryInformationResultImplToJson(
      this,
    );
  }
}

abstract class _MainStoryInformationResult extends MainStoryInformationResult {
  factory _MainStoryInformationResult(
      {@JsonKey(name: 'levels') final List<SeriesInformationResult> levelsList,
      @JsonKey(name: 'categories')
      final List<SeriesInformationResult>
          categoriesList}) = _$MainStoryInformationResultImpl;
  _MainStoryInformationResult._() : super._();

  factory _MainStoryInformationResult.fromJson(Map<String, dynamic> json) =
      _$MainStoryInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'levels')
  List<SeriesInformationResult> get levelsList;
  @override
  @JsonKey(name: 'categories')
  List<SeriesInformationResult> get categoriesList;
  @override
  @JsonKey(ignore: true)
  _$$MainStoryInformationResultImplCopyWith<_$MainStoryInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
