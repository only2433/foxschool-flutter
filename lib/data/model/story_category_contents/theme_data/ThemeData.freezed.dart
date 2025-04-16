// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ThemeData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeData _$ThemeDataFromJson(Map<String, dynamic> json) {
  return _ThemeData.fromJson(json);
}

/// @nodoc
mixin _$ThemeData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeDataCopyWith<ThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeDataCopyWith<$Res> {
  factory $ThemeDataCopyWith(ThemeData value, $Res Function(ThemeData) then) =
      _$ThemeDataCopyWithImpl<$Res, ThemeData>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$ThemeDataCopyWithImpl<$Res, $Val extends ThemeData>
    implements $ThemeDataCopyWith<$Res> {
  _$ThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeDataImplCopyWith<$Res>
    implements $ThemeDataCopyWith<$Res> {
  factory _$$ThemeDataImplCopyWith(
          _$ThemeDataImpl value, $Res Function(_$ThemeDataImpl) then) =
      __$$ThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$ThemeDataImplCopyWithImpl<$Res>
    extends _$ThemeDataCopyWithImpl<$Res, _$ThemeDataImpl>
    implements _$$ThemeDataImplCopyWith<$Res> {
  __$$ThemeDataImplCopyWithImpl(
      _$ThemeDataImpl _value, $Res Function(_$ThemeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ThemeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeDataImpl implements _ThemeData {
  _$ThemeDataImpl({this.id = "", this.name = ""});

  factory _$ThemeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeDataImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ThemeData(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeDataImplCopyWith<_$ThemeDataImpl> get copyWith =>
      __$$ThemeDataImplCopyWithImpl<_$ThemeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeDataImplToJson(
      this,
    );
  }
}

abstract class _ThemeData implements ThemeData {
  factory _ThemeData({final String id, final String name}) = _$ThemeDataImpl;

  factory _ThemeData.fromJson(Map<String, dynamic> json) =
      _$ThemeDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ThemeDataImplCopyWith<_$ThemeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
