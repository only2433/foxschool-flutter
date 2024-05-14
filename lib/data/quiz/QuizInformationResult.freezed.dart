// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizInformationResult _$QuizInformationResultFromJson(
    Map<String, dynamic> json) {
  return _QuizInformationResult.fromJson(json);
}

/// @nodoc
mixin _$QuizInformationResult {
  @JsonKey(name: 'id')
  int get quizID => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  int get quizLimitTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_count')
  int get quizCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get quizType => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_image_url')
  String get correctImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'incorrect_image_url')
  String get incorrectImageUrl => throw _privateConstructorUsedError;
  ContentsInformation? get content => throw _privateConstructorUsedError;
  List<QuizItemResult>? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizInformationResultCopyWith<QuizInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizInformationResultCopyWith<$Res> {
  factory $QuizInformationResultCopyWith(QuizInformationResult value,
          $Res Function(QuizInformationResult) then) =
      _$QuizInformationResultCopyWithImpl<$Res, QuizInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int quizID,
      @JsonKey(name: 'time') int quizLimitTime,
      @JsonKey(name: 'quiz_count') int quizCount,
      @JsonKey(name: 'type') String quizType,
      @JsonKey(name: 'correct_image_url') String correctImageUrl,
      @JsonKey(name: 'incorrect_image_url') String incorrectImageUrl,
      ContentsInformation? content,
      List<QuizItemResult>? questions});

  $ContentsInformationCopyWith<$Res>? get content;
}

/// @nodoc
class _$QuizInformationResultCopyWithImpl<$Res,
        $Val extends QuizInformationResult>
    implements $QuizInformationResultCopyWith<$Res> {
  _$QuizInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizID = null,
    Object? quizLimitTime = null,
    Object? quizCount = null,
    Object? quizType = null,
    Object? correctImageUrl = null,
    Object? incorrectImageUrl = null,
    Object? content = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      quizID: null == quizID
          ? _value.quizID
          : quizID // ignore: cast_nullable_to_non_nullable
              as int,
      quizLimitTime: null == quizLimitTime
          ? _value.quizLimitTime
          : quizLimitTime // ignore: cast_nullable_to_non_nullable
              as int,
      quizCount: null == quizCount
          ? _value.quizCount
          : quizCount // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as String,
      correctImageUrl: null == correctImageUrl
          ? _value.correctImageUrl
          : correctImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectImageUrl: null == incorrectImageUrl
          ? _value.incorrectImageUrl
          : incorrectImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentsInformation?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizItemResult>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentsInformationCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ContentsInformationCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizInformationResultImplCopyWith<$Res>
    implements $QuizInformationResultCopyWith<$Res> {
  factory _$$QuizInformationResultImplCopyWith(
          _$QuizInformationResultImpl value,
          $Res Function(_$QuizInformationResultImpl) then) =
      __$$QuizInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int quizID,
      @JsonKey(name: 'time') int quizLimitTime,
      @JsonKey(name: 'quiz_count') int quizCount,
      @JsonKey(name: 'type') String quizType,
      @JsonKey(name: 'correct_image_url') String correctImageUrl,
      @JsonKey(name: 'incorrect_image_url') String incorrectImageUrl,
      ContentsInformation? content,
      List<QuizItemResult>? questions});

  @override
  $ContentsInformationCopyWith<$Res>? get content;
}

/// @nodoc
class __$$QuizInformationResultImplCopyWithImpl<$Res>
    extends _$QuizInformationResultCopyWithImpl<$Res,
        _$QuizInformationResultImpl>
    implements _$$QuizInformationResultImplCopyWith<$Res> {
  __$$QuizInformationResultImplCopyWithImpl(_$QuizInformationResultImpl _value,
      $Res Function(_$QuizInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizID = null,
    Object? quizLimitTime = null,
    Object? quizCount = null,
    Object? quizType = null,
    Object? correctImageUrl = null,
    Object? incorrectImageUrl = null,
    Object? content = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$QuizInformationResultImpl(
      quizID: null == quizID
          ? _value.quizID
          : quizID // ignore: cast_nullable_to_non_nullable
              as int,
      quizLimitTime: null == quizLimitTime
          ? _value.quizLimitTime
          : quizLimitTime // ignore: cast_nullable_to_non_nullable
              as int,
      quizCount: null == quizCount
          ? _value.quizCount
          : quizCount // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as String,
      correctImageUrl: null == correctImageUrl
          ? _value.correctImageUrl
          : correctImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectImageUrl: null == incorrectImageUrl
          ? _value.incorrectImageUrl
          : incorrectImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentsInformation?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizItemResult>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizInformationResultImpl extends _QuizInformationResult {
  _$QuizInformationResultImpl(
      {@JsonKey(name: 'id') this.quizID = -1,
      @JsonKey(name: 'time') this.quizLimitTime = -1,
      @JsonKey(name: 'quiz_count') this.quizCount = -1,
      @JsonKey(name: 'type') this.quizType = "",
      @JsonKey(name: 'correct_image_url') this.correctImageUrl = "",
      @JsonKey(name: 'incorrect_image_url') this.incorrectImageUrl = "",
      this.content,
      final List<QuizItemResult>? questions})
      : _questions = questions,
        super._();

  factory _$QuizInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizInformationResultImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int quizID;
  @override
  @JsonKey(name: 'time')
  final int quizLimitTime;
  @override
  @JsonKey(name: 'quiz_count')
  final int quizCount;
  @override
  @JsonKey(name: 'type')
  final String quizType;
  @override
  @JsonKey(name: 'correct_image_url')
  final String correctImageUrl;
  @override
  @JsonKey(name: 'incorrect_image_url')
  final String incorrectImageUrl;
  @override
  final ContentsInformation? content;
  final List<QuizItemResult>? _questions;
  @override
  List<QuizItemResult>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuizInformationResult(quizID: $quizID, quizLimitTime: $quizLimitTime, quizCount: $quizCount, quizType: $quizType, correctImageUrl: $correctImageUrl, incorrectImageUrl: $incorrectImageUrl, content: $content, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizInformationResultImpl &&
            (identical(other.quizID, quizID) || other.quizID == quizID) &&
            (identical(other.quizLimitTime, quizLimitTime) ||
                other.quizLimitTime == quizLimitTime) &&
            (identical(other.quizCount, quizCount) ||
                other.quizCount == quizCount) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType) &&
            (identical(other.correctImageUrl, correctImageUrl) ||
                other.correctImageUrl == correctImageUrl) &&
            (identical(other.incorrectImageUrl, incorrectImageUrl) ||
                other.incorrectImageUrl == incorrectImageUrl) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizID,
      quizLimitTime,
      quizCount,
      quizType,
      correctImageUrl,
      incorrectImageUrl,
      content,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizInformationResultImplCopyWith<_$QuizInformationResultImpl>
      get copyWith => __$$QuizInformationResultImplCopyWithImpl<
          _$QuizInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizInformationResultImplToJson(
      this,
    );
  }
}

abstract class _QuizInformationResult extends QuizInformationResult {
  factory _QuizInformationResult(
      {@JsonKey(name: 'id') final int quizID,
      @JsonKey(name: 'time') final int quizLimitTime,
      @JsonKey(name: 'quiz_count') final int quizCount,
      @JsonKey(name: 'type') final String quizType,
      @JsonKey(name: 'correct_image_url') final String correctImageUrl,
      @JsonKey(name: 'incorrect_image_url') final String incorrectImageUrl,
      final ContentsInformation? content,
      final List<QuizItemResult>? questions}) = _$QuizInformationResultImpl;
  _QuizInformationResult._() : super._();

  factory _QuizInformationResult.fromJson(Map<String, dynamic> json) =
      _$QuizInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get quizID;
  @override
  @JsonKey(name: 'time')
  int get quizLimitTime;
  @override
  @JsonKey(name: 'quiz_count')
  int get quizCount;
  @override
  @JsonKey(name: 'type')
  String get quizType;
  @override
  @JsonKey(name: 'correct_image_url')
  String get correctImageUrl;
  @override
  @JsonKey(name: 'incorrect_image_url')
  String get incorrectImageUrl;
  @override
  ContentsInformation? get content;
  @override
  List<QuizItemResult>? get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuizInformationResultImplCopyWith<_$QuizInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
