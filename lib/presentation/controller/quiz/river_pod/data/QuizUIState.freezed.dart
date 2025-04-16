// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'QuizUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizUIState {
  bool get isContentsLoading => throw _privateConstructorUsedError;
  List<Widget> get widgetList => throw _privateConstructorUsedError;
  bool get enableTaskbox => throw _privateConstructorUsedError;
  bool get enableAnswerReportButton => throw _privateConstructorUsedError;
  int get correctCount => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  QuizUserInteractionState get userInteractionState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizUIStateCopyWith<QuizUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizUIStateCopyWith<$Res> {
  factory $QuizUIStateCopyWith(
          QuizUIState value, $Res Function(QuizUIState) then) =
      _$QuizUIStateCopyWithImpl<$Res, QuizUIState>;
  @useResult
  $Res call(
      {bool isContentsLoading,
      List<Widget> widgetList,
      bool enableTaskbox,
      bool enableAnswerReportButton,
      int correctCount,
      int totalCount,
      QuizUserInteractionState userInteractionState});
}

/// @nodoc
class _$QuizUIStateCopyWithImpl<$Res, $Val extends QuizUIState>
    implements $QuizUIStateCopyWith<$Res> {
  _$QuizUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? widgetList = null,
    Object? enableTaskbox = null,
    Object? enableAnswerReportButton = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? userInteractionState = null,
  }) {
    return _then(_value.copyWith(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      widgetList: null == widgetList
          ? _value.widgetList
          : widgetList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      enableTaskbox: null == enableTaskbox
          ? _value.enableTaskbox
          : enableTaskbox // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAnswerReportButton: null == enableAnswerReportButton
          ? _value.enableAnswerReportButton
          : enableAnswerReportButton // ignore: cast_nullable_to_non_nullable
              as bool,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInteractionState: null == userInteractionState
          ? _value.userInteractionState
          : userInteractionState // ignore: cast_nullable_to_non_nullable
              as QuizUserInteractionState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizUIStateImplCopyWith<$Res>
    implements $QuizUIStateCopyWith<$Res> {
  factory _$$QuizUIStateImplCopyWith(
          _$QuizUIStateImpl value, $Res Function(_$QuizUIStateImpl) then) =
      __$$QuizUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isContentsLoading,
      List<Widget> widgetList,
      bool enableTaskbox,
      bool enableAnswerReportButton,
      int correctCount,
      int totalCount,
      QuizUserInteractionState userInteractionState});
}

/// @nodoc
class __$$QuizUIStateImplCopyWithImpl<$Res>
    extends _$QuizUIStateCopyWithImpl<$Res, _$QuizUIStateImpl>
    implements _$$QuizUIStateImplCopyWith<$Res> {
  __$$QuizUIStateImplCopyWithImpl(
      _$QuizUIStateImpl _value, $Res Function(_$QuizUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isContentsLoading = null,
    Object? widgetList = null,
    Object? enableTaskbox = null,
    Object? enableAnswerReportButton = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? userInteractionState = null,
  }) {
    return _then(_$QuizUIStateImpl(
      isContentsLoading: null == isContentsLoading
          ? _value.isContentsLoading
          : isContentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      widgetList: null == widgetList
          ? _value._widgetList
          : widgetList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      enableTaskbox: null == enableTaskbox
          ? _value.enableTaskbox
          : enableTaskbox // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAnswerReportButton: null == enableAnswerReportButton
          ? _value.enableAnswerReportButton
          : enableAnswerReportButton // ignore: cast_nullable_to_non_nullable
              as bool,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInteractionState: null == userInteractionState
          ? _value.userInteractionState
          : userInteractionState // ignore: cast_nullable_to_non_nullable
              as QuizUserInteractionState,
    ));
  }
}

/// @nodoc

class _$QuizUIStateImpl implements _QuizUIState {
  _$QuizUIStateImpl(
      {required this.isContentsLoading,
      required final List<Widget> widgetList,
      required this.enableTaskbox,
      required this.enableAnswerReportButton,
      required this.correctCount,
      required this.totalCount,
      required this.userInteractionState})
      : _widgetList = widgetList;

  @override
  final bool isContentsLoading;
  final List<Widget> _widgetList;
  @override
  List<Widget> get widgetList {
    if (_widgetList is EqualUnmodifiableListView) return _widgetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgetList);
  }

  @override
  final bool enableTaskbox;
  @override
  final bool enableAnswerReportButton;
  @override
  final int correctCount;
  @override
  final int totalCount;
  @override
  final QuizUserInteractionState userInteractionState;

  @override
  String toString() {
    return 'QuizUIState(isContentsLoading: $isContentsLoading, widgetList: $widgetList, enableTaskbox: $enableTaskbox, enableAnswerReportButton: $enableAnswerReportButton, correctCount: $correctCount, totalCount: $totalCount, userInteractionState: $userInteractionState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizUIStateImpl &&
            (identical(other.isContentsLoading, isContentsLoading) ||
                other.isContentsLoading == isContentsLoading) &&
            const DeepCollectionEquality()
                .equals(other._widgetList, _widgetList) &&
            (identical(other.enableTaskbox, enableTaskbox) ||
                other.enableTaskbox == enableTaskbox) &&
            (identical(
                    other.enableAnswerReportButton, enableAnswerReportButton) ||
                other.enableAnswerReportButton == enableAnswerReportButton) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.userInteractionState, userInteractionState) ||
                other.userInteractionState == userInteractionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isContentsLoading,
      const DeepCollectionEquality().hash(_widgetList),
      enableTaskbox,
      enableAnswerReportButton,
      correctCount,
      totalCount,
      userInteractionState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizUIStateImplCopyWith<_$QuizUIStateImpl> get copyWith =>
      __$$QuizUIStateImplCopyWithImpl<_$QuizUIStateImpl>(this, _$identity);
}

abstract class _QuizUIState implements QuizUIState {
  factory _QuizUIState(
          {required final bool isContentsLoading,
          required final List<Widget> widgetList,
          required final bool enableTaskbox,
          required final bool enableAnswerReportButton,
          required final int correctCount,
          required final int totalCount,
          required final QuizUserInteractionState userInteractionState}) =
      _$QuizUIStateImpl;

  @override
  bool get isContentsLoading;
  @override
  List<Widget> get widgetList;
  @override
  bool get enableTaskbox;
  @override
  bool get enableAnswerReportButton;
  @override
  int get correctCount;
  @override
  int get totalCount;
  @override
  QuizUserInteractionState get userInteractionState;
  @override
  @JsonKey(ignore: true)
  _$$QuizUIStateImplCopyWith<_$QuizUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
