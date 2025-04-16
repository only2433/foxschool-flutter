// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MyBookshelfResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyBookshelfResult _$MyBookshelfResultFromJson(Map<String, dynamic> json) {
  return _MyBookshelfResult.fromJson(json);
}

/// @nodoc
mixin _$MyBookshelfResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'contents_count')
  int get contentsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyBookshelfResultCopyWith<MyBookshelfResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookshelfResultCopyWith<$Res> {
  factory $MyBookshelfResultCopyWith(
          MyBookshelfResult value, $Res Function(MyBookshelfResult) then) =
      _$MyBookshelfResultCopyWithImpl<$Res, MyBookshelfResult>;
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      @JsonKey(name: 'contents_count') int contentsCount});
}

/// @nodoc
class _$MyBookshelfResultCopyWithImpl<$Res, $Val extends MyBookshelfResult>
    implements $MyBookshelfResultCopyWith<$Res> {
  _$MyBookshelfResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? contentsCount = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      contentsCount: null == contentsCount
          ? _value.contentsCount
          : contentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyBookshelfResultImplCopyWith<$Res>
    implements $MyBookshelfResultCopyWith<$Res> {
  factory _$$MyBookshelfResultImplCopyWith(_$MyBookshelfResultImpl value,
          $Res Function(_$MyBookshelfResultImpl) then) =
      __$$MyBookshelfResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      @JsonKey(name: 'contents_count') int contentsCount});
}

/// @nodoc
class __$$MyBookshelfResultImplCopyWithImpl<$Res>
    extends _$MyBookshelfResultCopyWithImpl<$Res, _$MyBookshelfResultImpl>
    implements _$$MyBookshelfResultImplCopyWith<$Res> {
  __$$MyBookshelfResultImplCopyWithImpl(_$MyBookshelfResultImpl _value,
      $Res Function(_$MyBookshelfResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? contentsCount = null,
  }) {
    return _then(_$MyBookshelfResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      contentsCount: null == contentsCount
          ? _value.contentsCount
          : contentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyBookshelfResultImpl implements _MyBookshelfResult {
  _$MyBookshelfResultImpl(
      {this.id = "",
      this.name = "",
      this.color = "",
      @JsonKey(name: 'contents_count') this.contentsCount = 0});

  factory _$MyBookshelfResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyBookshelfResultImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey(name: 'contents_count')
  final int contentsCount;

  @override
  String toString() {
    return 'MyBookshelfResult(id: $id, name: $name, color: $color, contentsCount: $contentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBookshelfResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.contentsCount, contentsCount) ||
                other.contentsCount == contentsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, contentsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyBookshelfResultImplCopyWith<_$MyBookshelfResultImpl> get copyWith =>
      __$$MyBookshelfResultImplCopyWithImpl<_$MyBookshelfResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyBookshelfResultImplToJson(
      this,
    );
  }
}

abstract class _MyBookshelfResult implements MyBookshelfResult {
  factory _MyBookshelfResult(
          {final String id,
          final String name,
          final String color,
          @JsonKey(name: 'contents_count') final int contentsCount}) =
      _$MyBookshelfResultImpl;

  factory _MyBookshelfResult.fromJson(Map<String, dynamic> json) =
      _$MyBookshelfResultImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  @JsonKey(name: 'contents_count')
  int get contentsCount;
  @override
  @JsonKey(ignore: true)
  _$$MyBookshelfResultImplCopyWith<_$MyBookshelfResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
