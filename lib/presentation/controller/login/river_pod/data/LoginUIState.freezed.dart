// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginUIState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginUIState {
  String get schoolName => throw _privateConstructorUsedError;
  List<SchoolData> get schoolList => throw _privateConstructorUsedError;
  bool get isAutoLogin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginUIStateCopyWith<LoginUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUIStateCopyWith<$Res> {
  factory $LoginUIStateCopyWith(
          LoginUIState value, $Res Function(LoginUIState) then) =
      _$LoginUIStateCopyWithImpl<$Res, LoginUIState>;
  @useResult
  $Res call({String schoolName, List<SchoolData> schoolList, bool isAutoLogin});
}

/// @nodoc
class _$LoginUIStateCopyWithImpl<$Res, $Val extends LoginUIState>
    implements $LoginUIStateCopyWith<$Res> {
  _$LoginUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolName = null,
    Object? schoolList = null,
    Object? isAutoLogin = null,
  }) {
    return _then(_value.copyWith(
      schoolName: null == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolList: null == schoolList
          ? _value.schoolList
          : schoolList // ignore: cast_nullable_to_non_nullable
              as List<SchoolData>,
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginUIStateImplCopyWith<$Res>
    implements $LoginUIStateCopyWith<$Res> {
  factory _$$LoginUIStateImplCopyWith(
          _$LoginUIStateImpl value, $Res Function(_$LoginUIStateImpl) then) =
      __$$LoginUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String schoolName, List<SchoolData> schoolList, bool isAutoLogin});
}

/// @nodoc
class __$$LoginUIStateImplCopyWithImpl<$Res>
    extends _$LoginUIStateCopyWithImpl<$Res, _$LoginUIStateImpl>
    implements _$$LoginUIStateImplCopyWith<$Res> {
  __$$LoginUIStateImplCopyWithImpl(
      _$LoginUIStateImpl _value, $Res Function(_$LoginUIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolName = null,
    Object? schoolList = null,
    Object? isAutoLogin = null,
  }) {
    return _then(_$LoginUIStateImpl(
      schoolName: null == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolList: null == schoolList
          ? _value._schoolList
          : schoolList // ignore: cast_nullable_to_non_nullable
              as List<SchoolData>,
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginUIStateImpl implements _LoginUIState {
  _$LoginUIStateImpl(
      {required this.schoolName,
      required final List<SchoolData> schoolList,
      required this.isAutoLogin})
      : _schoolList = schoolList;

  @override
  final String schoolName;
  final List<SchoolData> _schoolList;
  @override
  List<SchoolData> get schoolList {
    if (_schoolList is EqualUnmodifiableListView) return _schoolList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schoolList);
  }

  @override
  final bool isAutoLogin;

  @override
  String toString() {
    return 'LoginUIState(schoolName: $schoolName, schoolList: $schoolList, isAutoLogin: $isAutoLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUIStateImpl &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            const DeepCollectionEquality()
                .equals(other._schoolList, _schoolList) &&
            (identical(other.isAutoLogin, isAutoLogin) ||
                other.isAutoLogin == isAutoLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolName,
      const DeepCollectionEquality().hash(_schoolList), isAutoLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUIStateImplCopyWith<_$LoginUIStateImpl> get copyWith =>
      __$$LoginUIStateImplCopyWithImpl<_$LoginUIStateImpl>(this, _$identity);
}

abstract class _LoginUIState implements LoginUIState {
  factory _LoginUIState(
      {required final String schoolName,
      required final List<SchoolData> schoolList,
      required final bool isAutoLogin}) = _$LoginUIStateImpl;

  @override
  String get schoolName;
  @override
  List<SchoolData> get schoolList;
  @override
  bool get isAutoLogin;
  @override
  @JsonKey(ignore: true)
  _$$LoginUIStateImplCopyWith<_$LoginUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
