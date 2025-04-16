// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ManagementMybooksUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManagementMybooksUIState {
  MyBooksColorType get colorType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  String get buttonText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagementMybooksUIStateCopyWith<ManagementMybooksUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementMybooksUIStateCopyWith<$Res> {
  factory $ManagementMybooksUIStateCopyWith(ManagementMybooksUIState value,
          $Res Function(ManagementMybooksUIState) then) =
      _$ManagementMybooksUIStateCopyWithImpl<$Res, ManagementMybooksUIState>;
  @useResult
  $Res call(
      {MyBooksColorType colorType,
      String title,
      String bookName,
      String buttonText});
}

/// @nodoc
class _$ManagementMybooksUIStateCopyWithImpl<$Res,
        $Val extends ManagementMybooksUIState>
    implements $ManagementMybooksUIStateCopyWith<$Res> {
  _$ManagementMybooksUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorType = null,
    Object? title = null,
    Object? bookName = null,
    Object? buttonText = null,
  }) {
    return _then(_value.copyWith(
      colorType: null == colorType
          ? _value.colorType
          : colorType // ignore: cast_nullable_to_non_nullable
              as MyBooksColorType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagementMybooksUIStateImplCopyWith<$Res>
    implements $ManagementMybooksUIStateCopyWith<$Res> {
  factory _$$ManagementMybooksUIStateImplCopyWith(
          _$ManagementMybooksUIStateImpl value,
          $Res Function(_$ManagementMybooksUIStateImpl) then) =
      __$$ManagementMybooksUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MyBooksColorType colorType,
      String title,
      String bookName,
      String buttonText});
}

/// @nodoc
class __$$ManagementMybooksUIStateImplCopyWithImpl<$Res>
    extends _$ManagementMybooksUIStateCopyWithImpl<$Res,
        _$ManagementMybooksUIStateImpl>
    implements _$$ManagementMybooksUIStateImplCopyWith<$Res> {
  __$$ManagementMybooksUIStateImplCopyWithImpl(
      _$ManagementMybooksUIStateImpl _value,
      $Res Function(_$ManagementMybooksUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorType = null,
    Object? title = null,
    Object? bookName = null,
    Object? buttonText = null,
  }) {
    return _then(_$ManagementMybooksUIStateImpl(
      colorType: null == colorType
          ? _value.colorType
          : colorType // ignore: cast_nullable_to_non_nullable
              as MyBooksColorType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ManagementMybooksUIStateImpl implements _ManagementMybooksUIState {
  _$ManagementMybooksUIStateImpl(
      {required this.colorType,
      required this.title,
      required this.bookName,
      required this.buttonText});

  @override
  final MyBooksColorType colorType;
  @override
  final String title;
  @override
  final String bookName;
  @override
  final String buttonText;

  @override
  String toString() {
    return 'ManagementMybooksUIState(colorType: $colorType, title: $title, bookName: $bookName, buttonText: $buttonText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagementMybooksUIStateImpl &&
            (identical(other.colorType, colorType) ||
                other.colorType == colorType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.buttonText, buttonText) ||
                other.buttonText == buttonText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, colorType, title, bookName, buttonText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagementMybooksUIStateImplCopyWith<_$ManagementMybooksUIStateImpl>
      get copyWith => __$$ManagementMybooksUIStateImplCopyWithImpl<
          _$ManagementMybooksUIStateImpl>(this, _$identity);
}

abstract class _ManagementMybooksUIState implements ManagementMybooksUIState {
  factory _ManagementMybooksUIState(
      {required final MyBooksColorType colorType,
      required final String title,
      required final String bookName,
      required final String buttonText}) = _$ManagementMybooksUIStateImpl;

  @override
  MyBooksColorType get colorType;
  @override
  String get title;
  @override
  String get bookName;
  @override
  String get buttonText;
  @override
  @JsonKey(ignore: true)
  _$$ManagementMybooksUIStateImplCopyWith<_$ManagementMybooksUIStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
