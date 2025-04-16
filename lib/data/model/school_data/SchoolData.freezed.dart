// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SchoolData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SchoolData _$SchoolDataFromJson(Map<String, dynamic> json) {
  return _SchoolData.fromJson(json);
}

/// @nodoc
mixin _$SchoolData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolDataCopyWith<SchoolData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolDataCopyWith<$Res> {
  factory $SchoolDataCopyWith(
          SchoolData value, $Res Function(SchoolData) then) =
      _$SchoolDataCopyWithImpl<$Res, SchoolData>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$SchoolDataCopyWithImpl<$Res, $Val extends SchoolData>
    implements $SchoolDataCopyWith<$Res> {
  _$SchoolDataCopyWithImpl(this._value, this._then);

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
abstract class _$$SchoolDataImplCopyWith<$Res>
    implements $SchoolDataCopyWith<$Res> {
  factory _$$SchoolDataImplCopyWith(
          _$SchoolDataImpl value, $Res Function(_$SchoolDataImpl) then) =
      __$$SchoolDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$SchoolDataImplCopyWithImpl<$Res>
    extends _$SchoolDataCopyWithImpl<$Res, _$SchoolDataImpl>
    implements _$$SchoolDataImplCopyWith<$Res> {
  __$$SchoolDataImplCopyWithImpl(
      _$SchoolDataImpl _value, $Res Function(_$SchoolDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SchoolDataImpl(
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
class _$SchoolDataImpl implements _SchoolData {
  _$SchoolDataImpl({this.id = "", this.name = ""});

  factory _$SchoolDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchoolDataImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'SchoolData(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolDataImplCopyWith<_$SchoolDataImpl> get copyWith =>
      __$$SchoolDataImplCopyWithImpl<_$SchoolDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchoolDataImplToJson(
      this,
    );
  }
}

abstract class _SchoolData implements SchoolData {
  factory _SchoolData({final String id, final String name}) = _$SchoolDataImpl;

  factory _SchoolData.fromJson(Map<String, dynamic> json) =
      _$SchoolDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SchoolDataImplCopyWith<_$SchoolDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
