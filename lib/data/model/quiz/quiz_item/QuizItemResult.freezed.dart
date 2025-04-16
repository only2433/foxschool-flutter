// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizItemResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizItemResult _$QuizItemResultFromJson(Map<String, dynamic> json) {
  return _QuizItemResult.fromJson(json);
}

/// @nodoc
mixin _$QuizItemResult {
  @JsonKey(name: 'number')
  int get questionIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get questionTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  int get answerIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'sound_url')
  String get questionSoundUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<TextExampleObject> get examples => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizItemResultCopyWith<QuizItemResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemResultCopyWith<$Res> {
  factory $QuizItemResultCopyWith(
          QuizItemResult value, $Res Function(QuizItemResult) then) =
      _$QuizItemResultCopyWithImpl<$Res, QuizItemResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int questionIndex,
      @JsonKey(name: 'text') String questionTitle,
      @JsonKey(name: 'answer') int answerIndex,
      @JsonKey(name: 'sound_url') String questionSoundUrl,
      @JsonKey(name: 'items') List<TextExampleObject> examples});
}

/// @nodoc
class _$QuizItemResultCopyWithImpl<$Res, $Val extends QuizItemResult>
    implements $QuizItemResultCopyWith<$Res> {
  _$QuizItemResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionIndex = null,
    Object? questionTitle = null,
    Object? answerIndex = null,
    Object? questionSoundUrl = null,
    Object? examples = null,
  }) {
    return _then(_value.copyWith(
      questionIndex: null == questionIndex
          ? _value.questionIndex
          : questionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      answerIndex: null == answerIndex
          ? _value.answerIndex
          : answerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionSoundUrl: null == questionSoundUrl
          ? _value.questionSoundUrl
          : questionSoundUrl // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<TextExampleObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizItemResultImplCopyWith<$Res>
    implements $QuizItemResultCopyWith<$Res> {
  factory _$$QuizItemResultImplCopyWith(_$QuizItemResultImpl value,
          $Res Function(_$QuizItemResultImpl) then) =
      __$$QuizItemResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'number') int questionIndex,
      @JsonKey(name: 'text') String questionTitle,
      @JsonKey(name: 'answer') int answerIndex,
      @JsonKey(name: 'sound_url') String questionSoundUrl,
      @JsonKey(name: 'items') List<TextExampleObject> examples});
}

/// @nodoc
class __$$QuizItemResultImplCopyWithImpl<$Res>
    extends _$QuizItemResultCopyWithImpl<$Res, _$QuizItemResultImpl>
    implements _$$QuizItemResultImplCopyWith<$Res> {
  __$$QuizItemResultImplCopyWithImpl(
      _$QuizItemResultImpl _value, $Res Function(_$QuizItemResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionIndex = null,
    Object? questionTitle = null,
    Object? answerIndex = null,
    Object? questionSoundUrl = null,
    Object? examples = null,
  }) {
    return _then(_$QuizItemResultImpl(
      questionIndex: null == questionIndex
          ? _value.questionIndex
          : questionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      answerIndex: null == answerIndex
          ? _value.answerIndex
          : answerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionSoundUrl: null == questionSoundUrl
          ? _value.questionSoundUrl
          : questionSoundUrl // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<TextExampleObject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizItemResultImpl extends _QuizItemResult {
  _$QuizItemResultImpl(
      {@JsonKey(name: 'number') this.questionIndex = -1,
      @JsonKey(name: 'text') this.questionTitle = "",
      @JsonKey(name: 'answer') this.answerIndex = -1,
      @JsonKey(name: 'sound_url') this.questionSoundUrl = "",
      @JsonKey(name: 'items')
      final List<TextExampleObject> examples = const []})
      : _examples = examples,
        super._();

  factory _$QuizItemResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizItemResultImplFromJson(json);

  @override
  @JsonKey(name: 'number')
  final int questionIndex;
  @override
  @JsonKey(name: 'text')
  final String questionTitle;
  @override
  @JsonKey(name: 'answer')
  final int answerIndex;
  @override
  @JsonKey(name: 'sound_url')
  final String questionSoundUrl;
  final List<TextExampleObject> _examples;
  @override
  @JsonKey(name: 'items')
  List<TextExampleObject> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'QuizItemResult(questionIndex: $questionIndex, questionTitle: $questionTitle, answerIndex: $answerIndex, questionSoundUrl: $questionSoundUrl, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizItemResultImpl &&
            (identical(other.questionIndex, questionIndex) ||
                other.questionIndex == questionIndex) &&
            (identical(other.questionTitle, questionTitle) ||
                other.questionTitle == questionTitle) &&
            (identical(other.answerIndex, answerIndex) ||
                other.answerIndex == answerIndex) &&
            (identical(other.questionSoundUrl, questionSoundUrl) ||
                other.questionSoundUrl == questionSoundUrl) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionIndex,
      questionTitle,
      answerIndex,
      questionSoundUrl,
      const DeepCollectionEquality().hash(_examples));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizItemResultImplCopyWith<_$QuizItemResultImpl> get copyWith =>
      __$$QuizItemResultImplCopyWithImpl<_$QuizItemResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizItemResultImplToJson(
      this,
    );
  }
}

abstract class _QuizItemResult extends QuizItemResult {
  factory _QuizItemResult(
          {@JsonKey(name: 'number') final int questionIndex,
          @JsonKey(name: 'text') final String questionTitle,
          @JsonKey(name: 'answer') final int answerIndex,
          @JsonKey(name: 'sound_url') final String questionSoundUrl,
          @JsonKey(name: 'items') final List<TextExampleObject> examples}) =
      _$QuizItemResultImpl;
  _QuizItemResult._() : super._();

  factory _QuizItemResult.fromJson(Map<String, dynamic> json) =
      _$QuizItemResultImpl.fromJson;

  @override
  @JsonKey(name: 'number')
  int get questionIndex;
  @override
  @JsonKey(name: 'text')
  String get questionTitle;
  @override
  @JsonKey(name: 'answer')
  int get answerIndex;
  @override
  @JsonKey(name: 'sound_url')
  String get questionSoundUrl;
  @override
  @JsonKey(name: 'items')
  List<TextExampleObject> get examples;
  @override
  @JsonKey(ignore: true)
  _$$QuizItemResultImplCopyWith<_$QuizItemResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
