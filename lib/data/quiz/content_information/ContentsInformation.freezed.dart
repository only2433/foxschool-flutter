// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ContentsInformation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentsInformation _$ContentsInformationFromJson(Map<String, dynamic> json) {
  return _ContentsInformation.fromJson(json);
}

/// @nodoc
mixin _$ContentsInformation {
  @JsonKey(name: 'id')
  String get contentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get contentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_name')
  String get contentSubName => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentsInformationCopyWith<ContentsInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentsInformationCopyWith<$Res> {
  factory $ContentsInformationCopyWith(
          ContentsInformation value, $Res Function(ContentsInformation) then) =
      _$ContentsInformationCopyWithImpl<$Res, ContentsInformation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String contentID,
      @JsonKey(name: 'name') String contentName,
      @JsonKey(name: 'sub_name') String contentSubName,
      int level});
}

/// @nodoc
class _$ContentsInformationCopyWithImpl<$Res, $Val extends ContentsInformation>
    implements $ContentsInformationCopyWith<$Res> {
  _$ContentsInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentID = null,
    Object? contentName = null,
    Object? contentSubName = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      contentName: null == contentName
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String,
      contentSubName: null == contentSubName
          ? _value.contentSubName
          : contentSubName // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentsInformationImplCopyWith<$Res>
    implements $ContentsInformationCopyWith<$Res> {
  factory _$$ContentsInformationImplCopyWith(_$ContentsInformationImpl value,
          $Res Function(_$ContentsInformationImpl) then) =
      __$$ContentsInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String contentID,
      @JsonKey(name: 'name') String contentName,
      @JsonKey(name: 'sub_name') String contentSubName,
      int level});
}

/// @nodoc
class __$$ContentsInformationImplCopyWithImpl<$Res>
    extends _$ContentsInformationCopyWithImpl<$Res, _$ContentsInformationImpl>
    implements _$$ContentsInformationImplCopyWith<$Res> {
  __$$ContentsInformationImplCopyWithImpl(_$ContentsInformationImpl _value,
      $Res Function(_$ContentsInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentID = null,
    Object? contentName = null,
    Object? contentSubName = null,
    Object? level = null,
  }) {
    return _then(_$ContentsInformationImpl(
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      contentName: null == contentName
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String,
      contentSubName: null == contentSubName
          ? _value.contentSubName
          : contentSubName // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentsInformationImpl implements _ContentsInformation {
  _$ContentsInformationImpl(
      {@JsonKey(name: 'id') this.contentID = "",
      @JsonKey(name: 'name') this.contentName = "",
      @JsonKey(name: 'sub_name') this.contentSubName = "",
      this.level = -1});

  factory _$ContentsInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentsInformationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String contentID;
  @override
  @JsonKey(name: 'name')
  final String contentName;
  @override
  @JsonKey(name: 'sub_name')
  final String contentSubName;
  @override
  @JsonKey()
  final int level;

  @override
  String toString() {
    return 'ContentsInformation(contentID: $contentID, contentName: $contentName, contentSubName: $contentSubName, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsInformationImpl &&
            (identical(other.contentID, contentID) ||
                other.contentID == contentID) &&
            (identical(other.contentName, contentName) ||
                other.contentName == contentName) &&
            (identical(other.contentSubName, contentSubName) ||
                other.contentSubName == contentSubName) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentID, contentName, contentSubName, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsInformationImplCopyWith<_$ContentsInformationImpl> get copyWith =>
      __$$ContentsInformationImplCopyWithImpl<_$ContentsInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentsInformationImplToJson(
      this,
    );
  }
}

abstract class _ContentsInformation implements ContentsInformation {
  factory _ContentsInformation(
      {@JsonKey(name: 'id') final String contentID,
      @JsonKey(name: 'name') final String contentName,
      @JsonKey(name: 'sub_name') final String contentSubName,
      final int level}) = _$ContentsInformationImpl;

  factory _ContentsInformation.fromJson(Map<String, dynamic> json) =
      _$ContentsInformationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get contentID;
  @override
  @JsonKey(name: 'name')
  String get contentName;
  @override
  @JsonKey(name: 'sub_name')
  String get contentSubName;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$ContentsInformationImplCopyWith<_$ContentsInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
