// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ColorData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ColorData _$ColorDataFromJson(Map<String, dynamic> json) {
  return _ColorData.fromJson(json);
}

/// @nodoc
mixin _$ColorData {
  @JsonKey(name: 'status_bar')
  String get statusBar => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorDataCopyWith<ColorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorDataCopyWith<$Res> {
  factory $ColorDataCopyWith(ColorData value, $Res Function(ColorData) then) =
      _$ColorDataCopyWithImpl<$Res, ColorData>;
  @useResult
  $Res call({@JsonKey(name: 'status_bar') String statusBar, String title});
}

/// @nodoc
class _$ColorDataCopyWithImpl<$Res, $Val extends ColorData>
    implements $ColorDataCopyWith<$Res> {
  _$ColorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusBar = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      statusBar: null == statusBar
          ? _value.statusBar
          : statusBar // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorDataImplCopyWith<$Res>
    implements $ColorDataCopyWith<$Res> {
  factory _$$ColorDataImplCopyWith(
          _$ColorDataImpl value, $Res Function(_$ColorDataImpl) then) =
      __$$ColorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'status_bar') String statusBar, String title});
}

/// @nodoc
class __$$ColorDataImplCopyWithImpl<$Res>
    extends _$ColorDataCopyWithImpl<$Res, _$ColorDataImpl>
    implements _$$ColorDataImplCopyWith<$Res> {
  __$$ColorDataImplCopyWithImpl(
      _$ColorDataImpl _value, $Res Function(_$ColorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusBar = null,
    Object? title = null,
  }) {
    return _then(_$ColorDataImpl(
      statusBar: null == statusBar
          ? _value.statusBar
          : statusBar // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorDataImpl implements _ColorData {
  _$ColorDataImpl(
      {@JsonKey(name: 'status_bar') this.statusBar = "", this.title = ""});

  factory _$ColorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorDataImplFromJson(json);

  @override
  @JsonKey(name: 'status_bar')
  final String statusBar;
  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'ColorData(statusBar: $statusBar, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorDataImpl &&
            (identical(other.statusBar, statusBar) ||
                other.statusBar == statusBar) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusBar, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorDataImplCopyWith<_$ColorDataImpl> get copyWith =>
      __$$ColorDataImplCopyWithImpl<_$ColorDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorDataImplToJson(
      this,
    );
  }
}

abstract class _ColorData implements ColorData {
  factory _ColorData(
      {@JsonKey(name: 'status_bar') final String statusBar,
      final String title}) = _$ColorDataImpl;

  factory _ColorData.fromJson(Map<String, dynamic> json) =
      _$ColorDataImpl.fromJson;

  @override
  @JsonKey(name: 'status_bar')
  String get statusBar;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ColorDataImplCopyWith<_$ColorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
