// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TextExampleObject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextExampleObject _$TextExampleObjectFromJson(Map<String, dynamic> json) {
  return _TextExampleObject.fromJson(json);
}

/// @nodoc
mixin _$TextExampleObject {
  @JsonKey(name: 'number')
  int get exampleIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get exampleText => throw _privateConstructorUsedError;
  @JsonKey(name: 'sound_url')
  String get exampleSoundUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextExampleObjectCopyWith<TextExampleObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextExampleObjectCopyWith<$Res> {
  factory $TextExampleObjectCopyWith(
          TextExampleObject value, $Res Function(TextExampleObject) then) =
      _$TextExampleObjectCopyWithImpl<$Res, TextExampleObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int exampleIndex,
      @JsonKey(name: 'text') String exampleText,
      @JsonKey(name: 'sound_url') String exampleSoundUrl});
}

/// @nodoc
class _$TextExampleObjectCopyWithImpl<$Res, $Val extends TextExampleObject>
    implements $TextExampleObjectCopyWith<$Res> {
  _$TextExampleObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleIndex = null,
    Object? exampleText = null,
    Object? exampleSoundUrl = null,
  }) {
    return _then(_value.copyWith(
      exampleIndex: null == exampleIndex
          ? _value.exampleIndex
          : exampleIndex // ignore: cast_nullable_to_non_nullable
              as int,
      exampleText: null == exampleText
          ? _value.exampleText
          : exampleText // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSoundUrl: null == exampleSoundUrl
          ? _value.exampleSoundUrl
          : exampleSoundUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextExampleObjectImplCopyWith<$Res>
    implements $TextExampleObjectCopyWith<$Res> {
  factory _$$TextExampleObjectImplCopyWith(_$TextExampleObjectImpl value,
          $Res Function(_$TextExampleObjectImpl) then) =
      __$$TextExampleObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int exampleIndex,
      @JsonKey(name: 'text') String exampleText,
      @JsonKey(name: 'sound_url') String exampleSoundUrl});
}

/// @nodoc
class __$$TextExampleObjectImplCopyWithImpl<$Res>
    extends _$TextExampleObjectCopyWithImpl<$Res, _$TextExampleObjectImpl>
    implements _$$TextExampleObjectImplCopyWith<$Res> {
  __$$TextExampleObjectImplCopyWithImpl(_$TextExampleObjectImpl _value,
      $Res Function(_$TextExampleObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleIndex = null,
    Object? exampleText = null,
    Object? exampleSoundUrl = null,
  }) {
    return _then(_$TextExampleObjectImpl(
      exampleIndex: null == exampleIndex
          ? _value.exampleIndex
          : exampleIndex // ignore: cast_nullable_to_non_nullable
              as int,
      exampleText: null == exampleText
          ? _value.exampleText
          : exampleText // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSoundUrl: null == exampleSoundUrl
          ? _value.exampleSoundUrl
          : exampleSoundUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextExampleObjectImpl implements _TextExampleObject {
  _$TextExampleObjectImpl(
      {@JsonKey(name: 'number') this.exampleIndex = -1,
      @JsonKey(name: 'text') this.exampleText = "",
      @JsonKey(name: 'sound_url') this.exampleSoundUrl = ""});

  factory _$TextExampleObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextExampleObjectImplFromJson(json);

  @override
  @JsonKey(name: 'number')
  final int exampleIndex;
  @override
  @JsonKey(name: 'text')
  final String exampleText;
  @override
  @JsonKey(name: 'sound_url')
  final String exampleSoundUrl;

  @override
  String toString() {
    return 'TextExampleObject(exampleIndex: $exampleIndex, exampleText: $exampleText, exampleSoundUrl: $exampleSoundUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextExampleObjectImpl &&
            (identical(other.exampleIndex, exampleIndex) ||
                other.exampleIndex == exampleIndex) &&
            (identical(other.exampleText, exampleText) ||
                other.exampleText == exampleText) &&
            (identical(other.exampleSoundUrl, exampleSoundUrl) ||
                other.exampleSoundUrl == exampleSoundUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exampleIndex, exampleText, exampleSoundUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextExampleObjectImplCopyWith<_$TextExampleObjectImpl> get copyWith =>
      __$$TextExampleObjectImplCopyWithImpl<_$TextExampleObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextExampleObjectImplToJson(
      this,
    );
  }
}

abstract class _TextExampleObject implements TextExampleObject {
  factory _TextExampleObject(
          {@JsonKey(name: 'number') final int exampleIndex,
          @JsonKey(name: 'text') final String exampleText,
          @JsonKey(name: 'sound_url') final String exampleSoundUrl}) =
      _$TextExampleObjectImpl;

  factory _TextExampleObject.fromJson(Map<String, dynamic> json) =
      _$TextExampleObjectImpl.fromJson;

  @override
  @JsonKey(name: 'number')
  int get exampleIndex;
  @override
  @JsonKey(name: 'text')
  String get exampleText;
  @override
  @JsonKey(name: 'sound_url')
  String get exampleSoundUrl;
  @override
  @JsonKey(ignore: true)
  _$$TextExampleObjectImplCopyWith<_$TextExampleObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
