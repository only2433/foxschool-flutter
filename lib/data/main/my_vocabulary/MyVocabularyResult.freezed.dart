// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MyVocabularyResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyVocabularyResult _$MyVocabularyResultFromJson(Map<String, dynamic> json) {
  return _MyVocabularyResult.fromJson(json);
}

/// @nodoc
mixin _$MyVocabularyResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'words_count')
  int get wordsCount => throw _privateConstructorUsedError;
  String get contentID => throw _privateConstructorUsedError;
  VocabularyType get vocabularyType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyVocabularyResultCopyWith<MyVocabularyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyVocabularyResultCopyWith<$Res> {
  factory $MyVocabularyResultCopyWith(
          MyVocabularyResult value, $Res Function(MyVocabularyResult) then) =
      _$MyVocabularyResultCopyWithImpl<$Res, MyVocabularyResult>;
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      @JsonKey(name: 'words_count') int wordsCount,
      String contentID,
      VocabularyType vocabularyType});
}

/// @nodoc
class _$MyVocabularyResultCopyWithImpl<$Res, $Val extends MyVocabularyResult>
    implements $MyVocabularyResultCopyWith<$Res> {
  _$MyVocabularyResultCopyWithImpl(this._value, this._then);

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
    Object? wordsCount = null,
    Object? contentID = null,
    Object? vocabularyType = null,
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
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularyType: null == vocabularyType
          ? _value.vocabularyType
          : vocabularyType // ignore: cast_nullable_to_non_nullable
              as VocabularyType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyVocabularyResultImplCopyWith<$Res>
    implements $MyVocabularyResultCopyWith<$Res> {
  factory _$$MyVocabularyResultImplCopyWith(_$MyVocabularyResultImpl value,
          $Res Function(_$MyVocabularyResultImpl) then) =
      __$$MyVocabularyResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String color,
      @JsonKey(name: 'words_count') int wordsCount,
      String contentID,
      VocabularyType vocabularyType});
}

/// @nodoc
class __$$MyVocabularyResultImplCopyWithImpl<$Res>
    extends _$MyVocabularyResultCopyWithImpl<$Res, _$MyVocabularyResultImpl>
    implements _$$MyVocabularyResultImplCopyWith<$Res> {
  __$$MyVocabularyResultImplCopyWithImpl(_$MyVocabularyResultImpl _value,
      $Res Function(_$MyVocabularyResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? wordsCount = null,
    Object? contentID = null,
    Object? vocabularyType = null,
  }) {
    return _then(_$MyVocabularyResultImpl(
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
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularyType: null == vocabularyType
          ? _value.vocabularyType
          : vocabularyType // ignore: cast_nullable_to_non_nullable
              as VocabularyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyVocabularyResultImpl implements _MyVocabularyResult {
  _$MyVocabularyResultImpl(
      {this.id = "",
      this.name = "",
      this.color = "",
      @JsonKey(name: 'words_count') this.wordsCount = 0,
      this.contentID = "",
      this.vocabularyType = VocabularyType.VOCABULARY_CONTENTS});

  factory _$MyVocabularyResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyVocabularyResultImplFromJson(json);

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
  @JsonKey(name: 'words_count')
  final int wordsCount;
  @override
  @JsonKey()
  final String contentID;
  @override
  @JsonKey()
  final VocabularyType vocabularyType;

  @override
  String toString() {
    return 'MyVocabularyResult(id: $id, name: $name, color: $color, wordsCount: $wordsCount, contentID: $contentID, vocabularyType: $vocabularyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyVocabularyResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.wordsCount, wordsCount) ||
                other.wordsCount == wordsCount) &&
            (identical(other.contentID, contentID) ||
                other.contentID == contentID) &&
            (identical(other.vocabularyType, vocabularyType) ||
                other.vocabularyType == vocabularyType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, color, wordsCount, contentID, vocabularyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyVocabularyResultImplCopyWith<_$MyVocabularyResultImpl> get copyWith =>
      __$$MyVocabularyResultImplCopyWithImpl<_$MyVocabularyResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyVocabularyResultImplToJson(
      this,
    );
  }
}

abstract class _MyVocabularyResult implements MyVocabularyResult {
  factory _MyVocabularyResult(
      {final String id,
      final String name,
      final String color,
      @JsonKey(name: 'words_count') final int wordsCount,
      final String contentID,
      final VocabularyType vocabularyType}) = _$MyVocabularyResultImpl;

  factory _MyVocabularyResult.fromJson(Map<String, dynamic> json) =
      _$MyVocabularyResultImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  @JsonKey(name: 'words_count')
  int get wordsCount;
  @override
  String get contentID;
  @override
  VocabularyType get vocabularyType;
  @override
  @JsonKey(ignore: true)
  _$$MyVocabularyResultImplCopyWith<_$MyVocabularyResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
