// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FlashcardDataResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlashcardDataResult _$FlashcardDataResultFromJson(Map<String, dynamic> json) {
  return _FlashcardDataResult.fromJson(json);
}

/// @nodoc
mixin _$FlashcardDataResult {
  VocabularyDataResult get vocabularyDataResult =>
      throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get cardNumber => throw _privateConstructorUsedError;
  bool get isBookmark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashcardDataResultCopyWith<FlashcardDataResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardDataResultCopyWith<$Res> {
  factory $FlashcardDataResultCopyWith(
          FlashcardDataResult value, $Res Function(FlashcardDataResult) then) =
      _$FlashcardDataResultCopyWithImpl<$Res, FlashcardDataResult>;
  @useResult
  $Res call(
      {VocabularyDataResult vocabularyDataResult,
      int index,
      int cardNumber,
      bool isBookmark});

  $VocabularyDataResultCopyWith<$Res> get vocabularyDataResult;
}

/// @nodoc
class _$FlashcardDataResultCopyWithImpl<$Res, $Val extends FlashcardDataResult>
    implements $FlashcardDataResultCopyWith<$Res> {
  _$FlashcardDataResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocabularyDataResult = null,
    Object? index = null,
    Object? cardNumber = null,
    Object? isBookmark = null,
  }) {
    return _then(_value.copyWith(
      vocabularyDataResult: null == vocabularyDataResult
          ? _value.vocabularyDataResult
          : vocabularyDataResult // ignore: cast_nullable_to_non_nullable
              as VocabularyDataResult,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isBookmark: null == isBookmark
          ? _value.isBookmark
          : isBookmark // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VocabularyDataResultCopyWith<$Res> get vocabularyDataResult {
    return $VocabularyDataResultCopyWith<$Res>(_value.vocabularyDataResult,
        (value) {
      return _then(_value.copyWith(vocabularyDataResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlashcardDataResultImplCopyWith<$Res>
    implements $FlashcardDataResultCopyWith<$Res> {
  factory _$$FlashcardDataResultImplCopyWith(_$FlashcardDataResultImpl value,
          $Res Function(_$FlashcardDataResultImpl) then) =
      __$$FlashcardDataResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VocabularyDataResult vocabularyDataResult,
      int index,
      int cardNumber,
      bool isBookmark});

  @override
  $VocabularyDataResultCopyWith<$Res> get vocabularyDataResult;
}

/// @nodoc
class __$$FlashcardDataResultImplCopyWithImpl<$Res>
    extends _$FlashcardDataResultCopyWithImpl<$Res, _$FlashcardDataResultImpl>
    implements _$$FlashcardDataResultImplCopyWith<$Res> {
  __$$FlashcardDataResultImplCopyWithImpl(_$FlashcardDataResultImpl _value,
      $Res Function(_$FlashcardDataResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocabularyDataResult = null,
    Object? index = null,
    Object? cardNumber = null,
    Object? isBookmark = null,
  }) {
    return _then(_$FlashcardDataResultImpl(
      vocabularyDataResult: null == vocabularyDataResult
          ? _value.vocabularyDataResult
          : vocabularyDataResult // ignore: cast_nullable_to_non_nullable
              as VocabularyDataResult,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isBookmark: null == isBookmark
          ? _value.isBookmark
          : isBookmark // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardDataResultImpl extends _FlashcardDataResult {
  _$FlashcardDataResultImpl(
      {required this.vocabularyDataResult,
      this.index = 0,
      this.cardNumber = 0,
      this.isBookmark = false})
      : super._();

  factory _$FlashcardDataResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardDataResultImplFromJson(json);

  @override
  final VocabularyDataResult vocabularyDataResult;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int cardNumber;
  @override
  @JsonKey()
  final bool isBookmark;

  @override
  String toString() {
    return 'FlashcardDataResult(vocabularyDataResult: $vocabularyDataResult, index: $index, cardNumber: $cardNumber, isBookmark: $isBookmark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardDataResultImpl &&
            (identical(other.vocabularyDataResult, vocabularyDataResult) ||
                other.vocabularyDataResult == vocabularyDataResult) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.isBookmark, isBookmark) ||
                other.isBookmark == isBookmark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, vocabularyDataResult, index, cardNumber, isBookmark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardDataResultImplCopyWith<_$FlashcardDataResultImpl> get copyWith =>
      __$$FlashcardDataResultImplCopyWithImpl<_$FlashcardDataResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardDataResultImplToJson(
      this,
    );
  }
}

abstract class _FlashcardDataResult extends FlashcardDataResult {
  factory _FlashcardDataResult(
      {required final VocabularyDataResult vocabularyDataResult,
      final int index,
      final int cardNumber,
      final bool isBookmark}) = _$FlashcardDataResultImpl;
  _FlashcardDataResult._() : super._();

  factory _FlashcardDataResult.fromJson(Map<String, dynamic> json) =
      _$FlashcardDataResultImpl.fromJson;

  @override
  VocabularyDataResult get vocabularyDataResult;
  @override
  int get index;
  @override
  int get cardNumber;
  @override
  bool get isBookmark;
  @override
  @JsonKey(ignore: true)
  _$$FlashcardDataResultImplCopyWith<_$FlashcardDataResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
