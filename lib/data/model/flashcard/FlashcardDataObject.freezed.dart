// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FlashcardDataObject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardDataObject {
  String get contentsID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  VocabularyType get vocabularyType => throw _privateConstructorUsedError;
  List<VocabularyDataResult> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashcardDataObjectCopyWith<FlashcardDataObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardDataObjectCopyWith<$Res> {
  factory $FlashcardDataObjectCopyWith(
          FlashcardDataObject value, $Res Function(FlashcardDataObject) then) =
      _$FlashcardDataObjectCopyWithImpl<$Res, FlashcardDataObject>;
  @useResult
  $Res call(
      {String contentsID,
      String title,
      String subTitle,
      VocabularyType vocabularyType,
      List<VocabularyDataResult> list});
}

/// @nodoc
class _$FlashcardDataObjectCopyWithImpl<$Res, $Val extends FlashcardDataObject>
    implements $FlashcardDataObjectCopyWith<$Res> {
  _$FlashcardDataObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentsID = null,
    Object? title = null,
    Object? subTitle = null,
    Object? vocabularyType = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      contentsID: null == contentsID
          ? _value.contentsID
          : contentsID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularyType: null == vocabularyType
          ? _value.vocabularyType
          : vocabularyType // ignore: cast_nullable_to_non_nullable
              as VocabularyType,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDataResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardDataObjectImplCopyWith<$Res>
    implements $FlashcardDataObjectCopyWith<$Res> {
  factory _$$FlashcardDataObjectImplCopyWith(_$FlashcardDataObjectImpl value,
          $Res Function(_$FlashcardDataObjectImpl) then) =
      __$$FlashcardDataObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contentsID,
      String title,
      String subTitle,
      VocabularyType vocabularyType,
      List<VocabularyDataResult> list});
}

/// @nodoc
class __$$FlashcardDataObjectImplCopyWithImpl<$Res>
    extends _$FlashcardDataObjectCopyWithImpl<$Res, _$FlashcardDataObjectImpl>
    implements _$$FlashcardDataObjectImplCopyWith<$Res> {
  __$$FlashcardDataObjectImplCopyWithImpl(_$FlashcardDataObjectImpl _value,
      $Res Function(_$FlashcardDataObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentsID = null,
    Object? title = null,
    Object? subTitle = null,
    Object? vocabularyType = null,
    Object? list = null,
  }) {
    return _then(_$FlashcardDataObjectImpl(
      contentsID: null == contentsID
          ? _value.contentsID
          : contentsID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularyType: null == vocabularyType
          ? _value.vocabularyType
          : vocabularyType // ignore: cast_nullable_to_non_nullable
              as VocabularyType,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDataResult>,
    ));
  }
}

/// @nodoc

class _$FlashcardDataObjectImpl extends _FlashcardDataObject {
  _$FlashcardDataObjectImpl(
      {required this.contentsID,
      required this.title,
      required this.subTitle,
      required this.vocabularyType,
      final List<VocabularyDataResult> list = const []})
      : _list = list,
        super._();

  @override
  final String contentsID;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final VocabularyType vocabularyType;
  final List<VocabularyDataResult> _list;
  @override
  @JsonKey()
  List<VocabularyDataResult> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'FlashcardDataObject(contentsID: $contentsID, title: $title, subTitle: $subTitle, vocabularyType: $vocabularyType, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardDataObjectImpl &&
            (identical(other.contentsID, contentsID) ||
                other.contentsID == contentsID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.vocabularyType, vocabularyType) ||
                other.vocabularyType == vocabularyType) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentsID, title, subTitle,
      vocabularyType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardDataObjectImplCopyWith<_$FlashcardDataObjectImpl> get copyWith =>
      __$$FlashcardDataObjectImplCopyWithImpl<_$FlashcardDataObjectImpl>(
          this, _$identity);
}

abstract class _FlashcardDataObject extends FlashcardDataObject {
  factory _FlashcardDataObject(
      {required final String contentsID,
      required final String title,
      required final String subTitle,
      required final VocabularyType vocabularyType,
      final List<VocabularyDataResult> list}) = _$FlashcardDataObjectImpl;
  _FlashcardDataObject._() : super._();

  @override
  String get contentsID;
  @override
  String get title;
  @override
  String get subTitle;
  @override
  VocabularyType get vocabularyType;
  @override
  List<VocabularyDataResult> get list;
  @override
  @JsonKey(ignore: true)
  _$$FlashcardDataObjectImplCopyWith<_$FlashcardDataObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
