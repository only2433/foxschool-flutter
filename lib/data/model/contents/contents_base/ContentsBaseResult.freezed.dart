// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ContentsBaseResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentsBaseResult _$ContentsBaseResultFromJson(Map<String, dynamic> json) {
  return _ContentsBaseResult.fromJson(json);
}

/// @nodoc
mixin _$ContentsBaseResult {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'seq')
  int get index => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_name')
  String get subName => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_info')
  ServiceSupportedTypeResult? get serviceInfo =>
      throw _privateConstructorUsedError;
  String get story_chk => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isOptionDisable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentsBaseResultCopyWith<ContentsBaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentsBaseResultCopyWith<$Res> {
  factory $ContentsBaseResultCopyWith(
          ContentsBaseResult value, $Res Function(ContentsBaseResult) then) =
      _$ContentsBaseResultCopyWithImpl<$Res, ContentsBaseResult>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'seq') int index,
      String type,
      String name,
      @JsonKey(name: 'sub_name') String subName,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'service_info') ServiceSupportedTypeResult? serviceInfo,
      String story_chk,
      bool isSelected,
      bool isOptionDisable});

  $ServiceSupportedTypeResultCopyWith<$Res>? get serviceInfo;
}

/// @nodoc
class _$ContentsBaseResultCopyWithImpl<$Res, $Val extends ContentsBaseResult>
    implements $ContentsBaseResultCopyWith<$Res> {
  _$ContentsBaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? type = null,
    Object? name = null,
    Object? subName = null,
    Object? thumbnailUrl = null,
    Object? serviceInfo = freezed,
    Object? story_chk = null,
    Object? isSelected = null,
    Object? isOptionDisable = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subName: null == subName
          ? _value.subName
          : subName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      serviceInfo: freezed == serviceInfo
          ? _value.serviceInfo
          : serviceInfo // ignore: cast_nullable_to_non_nullable
              as ServiceSupportedTypeResult?,
      story_chk: null == story_chk
          ? _value.story_chk
          : story_chk // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptionDisable: null == isOptionDisable
          ? _value.isOptionDisable
          : isOptionDisable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceSupportedTypeResultCopyWith<$Res>? get serviceInfo {
    if (_value.serviceInfo == null) {
      return null;
    }

    return $ServiceSupportedTypeResultCopyWith<$Res>(_value.serviceInfo!,
        (value) {
      return _then(_value.copyWith(serviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentsBaseResultImplCopyWith<$Res>
    implements $ContentsBaseResultCopyWith<$Res> {
  factory _$$ContentsBaseResultImplCopyWith(_$ContentsBaseResultImpl value,
          $Res Function(_$ContentsBaseResultImpl) then) =
      __$$ContentsBaseResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'seq') int index,
      String type,
      String name,
      @JsonKey(name: 'sub_name') String subName,
      @JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'service_info') ServiceSupportedTypeResult? serviceInfo,
      String story_chk,
      bool isSelected,
      bool isOptionDisable});

  @override
  $ServiceSupportedTypeResultCopyWith<$Res>? get serviceInfo;
}

/// @nodoc
class __$$ContentsBaseResultImplCopyWithImpl<$Res>
    extends _$ContentsBaseResultCopyWithImpl<$Res, _$ContentsBaseResultImpl>
    implements _$$ContentsBaseResultImplCopyWith<$Res> {
  __$$ContentsBaseResultImplCopyWithImpl(_$ContentsBaseResultImpl _value,
      $Res Function(_$ContentsBaseResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? type = null,
    Object? name = null,
    Object? subName = null,
    Object? thumbnailUrl = null,
    Object? serviceInfo = freezed,
    Object? story_chk = null,
    Object? isSelected = null,
    Object? isOptionDisable = null,
  }) {
    return _then(_$ContentsBaseResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subName: null == subName
          ? _value.subName
          : subName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      serviceInfo: freezed == serviceInfo
          ? _value.serviceInfo
          : serviceInfo // ignore: cast_nullable_to_non_nullable
              as ServiceSupportedTypeResult?,
      story_chk: null == story_chk
          ? _value.story_chk
          : story_chk // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isOptionDisable: null == isOptionDisable
          ? _value.isOptionDisable
          : isOptionDisable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentsBaseResultImpl extends _ContentsBaseResult {
  _$ContentsBaseResultImpl(
      {this.id = "",
      @JsonKey(name: 'seq') this.index = 0,
      this.type = Common.CONTENT_TYPE_STORY,
      this.name = "",
      @JsonKey(name: 'sub_name') this.subName = "",
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl = "",
      @JsonKey(name: 'service_info') this.serviceInfo,
      this.story_chk = "",
      this.isSelected = false,
      this.isOptionDisable = false})
      : super._();

  factory _$ContentsBaseResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentsBaseResultImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'seq')
  final int index;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'sub_name')
  final String subName;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  @override
  @JsonKey(name: 'service_info')
  final ServiceSupportedTypeResult? serviceInfo;
  @override
  @JsonKey()
  final String story_chk;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool isOptionDisable;

  @override
  String toString() {
    return 'ContentsBaseResult(id: $id, index: $index, type: $type, name: $name, subName: $subName, thumbnailUrl: $thumbnailUrl, serviceInfo: $serviceInfo, story_chk: $story_chk, isSelected: $isSelected, isOptionDisable: $isOptionDisable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsBaseResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subName, subName) || other.subName == subName) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.serviceInfo, serviceInfo) ||
                other.serviceInfo == serviceInfo) &&
            (identical(other.story_chk, story_chk) ||
                other.story_chk == story_chk) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isOptionDisable, isOptionDisable) ||
                other.isOptionDisable == isOptionDisable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, index, type, name, subName,
      thumbnailUrl, serviceInfo, story_chk, isSelected, isOptionDisable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsBaseResultImplCopyWith<_$ContentsBaseResultImpl> get copyWith =>
      __$$ContentsBaseResultImplCopyWithImpl<_$ContentsBaseResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentsBaseResultImplToJson(
      this,
    );
  }
}

abstract class _ContentsBaseResult extends ContentsBaseResult {
  factory _ContentsBaseResult(
      {final String id,
      @JsonKey(name: 'seq') final int index,
      final String type,
      final String name,
      @JsonKey(name: 'sub_name') final String subName,
      @JsonKey(name: 'thumbnail_url') final String thumbnailUrl,
      @JsonKey(name: 'service_info')
      final ServiceSupportedTypeResult? serviceInfo,
      final String story_chk,
      final bool isSelected,
      final bool isOptionDisable}) = _$ContentsBaseResultImpl;
  _ContentsBaseResult._() : super._();

  factory _ContentsBaseResult.fromJson(Map<String, dynamic> json) =
      _$ContentsBaseResultImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'seq')
  int get index;
  @override
  String get type;
  @override
  String get name;
  @override
  @JsonKey(name: 'sub_name')
  String get subName;
  @override
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl;
  @override
  @JsonKey(name: 'service_info')
  ServiceSupportedTypeResult? get serviceInfo;
  @override
  String get story_chk;
  @override
  bool get isSelected;
  @override
  bool get isOptionDisable;
  @override
  @JsonKey(ignore: true)
  _$$ContentsBaseResultImplCopyWith<_$ContentsBaseResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
