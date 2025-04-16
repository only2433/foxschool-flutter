// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'VersionDataResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VersionDataResult _$VersionDataResultFromJson(Map<String, dynamic> json) {
  return _VersionDateResult.fromJson(json);
}

/// @nodoc
mixin _$VersionDataResult {
  @JsonKey(name: 'installed_version')
  String get installedVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastest_version')
  String get lastestVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_url')
  String get storeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_type')
  String get playerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_installed_latest')
  bool get isInstalledLatest => throw _privateConstructorUsedError;
  @JsonKey(name: 'force_update')
  bool get isForceUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionDataResultCopyWith<VersionDataResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionDataResultCopyWith<$Res> {
  factory $VersionDataResultCopyWith(
          VersionDataResult value, $Res Function(VersionDataResult) then) =
      _$VersionDataResultCopyWithImpl<$Res, VersionDataResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'installed_version') String installedVersion,
      @JsonKey(name: 'lastest_version') String lastestVersion,
      @JsonKey(name: 'store_url') String storeUrl,
      @JsonKey(name: 'player_type') String playerType,
      @JsonKey(name: 'is_installed_latest') bool isInstalledLatest,
      @JsonKey(name: 'force_update') bool isForceUpdate});
}

/// @nodoc
class _$VersionDataResultCopyWithImpl<$Res, $Val extends VersionDataResult>
    implements $VersionDataResultCopyWith<$Res> {
  _$VersionDataResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedVersion = null,
    Object? lastestVersion = null,
    Object? storeUrl = null,
    Object? playerType = null,
    Object? isInstalledLatest = null,
    Object? isForceUpdate = null,
  }) {
    return _then(_value.copyWith(
      installedVersion: null == installedVersion
          ? _value.installedVersion
          : installedVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lastestVersion: null == lastestVersion
          ? _value.lastestVersion
          : lastestVersion // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      playerType: null == playerType
          ? _value.playerType
          : playerType // ignore: cast_nullable_to_non_nullable
              as String,
      isInstalledLatest: null == isInstalledLatest
          ? _value.isInstalledLatest
          : isInstalledLatest // ignore: cast_nullable_to_non_nullable
              as bool,
      isForceUpdate: null == isForceUpdate
          ? _value.isForceUpdate
          : isForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionDateResultImplCopyWith<$Res>
    implements $VersionDataResultCopyWith<$Res> {
  factory _$$VersionDateResultImplCopyWith(_$VersionDateResultImpl value,
          $Res Function(_$VersionDateResultImpl) then) =
      __$$VersionDateResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'installed_version') String installedVersion,
      @JsonKey(name: 'lastest_version') String lastestVersion,
      @JsonKey(name: 'store_url') String storeUrl,
      @JsonKey(name: 'player_type') String playerType,
      @JsonKey(name: 'is_installed_latest') bool isInstalledLatest,
      @JsonKey(name: 'force_update') bool isForceUpdate});
}

/// @nodoc
class __$$VersionDateResultImplCopyWithImpl<$Res>
    extends _$VersionDataResultCopyWithImpl<$Res, _$VersionDateResultImpl>
    implements _$$VersionDateResultImplCopyWith<$Res> {
  __$$VersionDateResultImplCopyWithImpl(_$VersionDateResultImpl _value,
      $Res Function(_$VersionDateResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedVersion = null,
    Object? lastestVersion = null,
    Object? storeUrl = null,
    Object? playerType = null,
    Object? isInstalledLatest = null,
    Object? isForceUpdate = null,
  }) {
    return _then(_$VersionDateResultImpl(
      installedVersion: null == installedVersion
          ? _value.installedVersion
          : installedVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lastestVersion: null == lastestVersion
          ? _value.lastestVersion
          : lastestVersion // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
      playerType: null == playerType
          ? _value.playerType
          : playerType // ignore: cast_nullable_to_non_nullable
              as String,
      isInstalledLatest: null == isInstalledLatest
          ? _value.isInstalledLatest
          : isInstalledLatest // ignore: cast_nullable_to_non_nullable
              as bool,
      isForceUpdate: null == isForceUpdate
          ? _value.isForceUpdate
          : isForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionDateResultImpl
    with DiagnosticableTreeMixin
    implements _VersionDateResult {
  _$VersionDateResultImpl(
      {@JsonKey(name: 'installed_version') this.installedVersion = "",
      @JsonKey(name: 'lastest_version') this.lastestVersion = "",
      @JsonKey(name: 'store_url') this.storeUrl = "",
      @JsonKey(name: 'player_type') this.playerType = "",
      @JsonKey(name: 'is_installed_latest') this.isInstalledLatest = false,
      @JsonKey(name: 'force_update') this.isForceUpdate = false});

  factory _$VersionDateResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionDateResultImplFromJson(json);

  @override
  @JsonKey(name: 'installed_version')
  final String installedVersion;
  @override
  @JsonKey(name: 'lastest_version')
  final String lastestVersion;
  @override
  @JsonKey(name: 'store_url')
  final String storeUrl;
  @override
  @JsonKey(name: 'player_type')
  final String playerType;
  @override
  @JsonKey(name: 'is_installed_latest')
  final bool isInstalledLatest;
  @override
  @JsonKey(name: 'force_update')
  final bool isForceUpdate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VersionDataResult(installedVersion: $installedVersion, lastestVersion: $lastestVersion, storeUrl: $storeUrl, playerType: $playerType, isInstalledLatest: $isInstalledLatest, isForceUpdate: $isForceUpdate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VersionDataResult'))
      ..add(DiagnosticsProperty('installedVersion', installedVersion))
      ..add(DiagnosticsProperty('lastestVersion', lastestVersion))
      ..add(DiagnosticsProperty('storeUrl', storeUrl))
      ..add(DiagnosticsProperty('playerType', playerType))
      ..add(DiagnosticsProperty('isInstalledLatest', isInstalledLatest))
      ..add(DiagnosticsProperty('isForceUpdate', isForceUpdate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionDateResultImpl &&
            (identical(other.installedVersion, installedVersion) ||
                other.installedVersion == installedVersion) &&
            (identical(other.lastestVersion, lastestVersion) ||
                other.lastestVersion == lastestVersion) &&
            (identical(other.storeUrl, storeUrl) ||
                other.storeUrl == storeUrl) &&
            (identical(other.playerType, playerType) ||
                other.playerType == playerType) &&
            (identical(other.isInstalledLatest, isInstalledLatest) ||
                other.isInstalledLatest == isInstalledLatest) &&
            (identical(other.isForceUpdate, isForceUpdate) ||
                other.isForceUpdate == isForceUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, installedVersion, lastestVersion,
      storeUrl, playerType, isInstalledLatest, isForceUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionDateResultImplCopyWith<_$VersionDateResultImpl> get copyWith =>
      __$$VersionDateResultImplCopyWithImpl<_$VersionDateResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionDateResultImplToJson(
      this,
    );
  }
}

abstract class _VersionDateResult implements VersionDataResult {
  factory _VersionDateResult(
          {@JsonKey(name: 'installed_version') final String installedVersion,
          @JsonKey(name: 'lastest_version') final String lastestVersion,
          @JsonKey(name: 'store_url') final String storeUrl,
          @JsonKey(name: 'player_type') final String playerType,
          @JsonKey(name: 'is_installed_latest') final bool isInstalledLatest,
          @JsonKey(name: 'force_update') final bool isForceUpdate}) =
      _$VersionDateResultImpl;

  factory _VersionDateResult.fromJson(Map<String, dynamic> json) =
      _$VersionDateResultImpl.fromJson;

  @override
  @JsonKey(name: 'installed_version')
  String get installedVersion;
  @override
  @JsonKey(name: 'lastest_version')
  String get lastestVersion;
  @override
  @JsonKey(name: 'store_url')
  String get storeUrl;
  @override
  @JsonKey(name: 'player_type')
  String get playerType;
  @override
  @JsonKey(name: 'is_installed_latest')
  bool get isInstalledLatest;
  @override
  @JsonKey(name: 'force_update')
  bool get isForceUpdate;
  @override
  @JsonKey(ignore: true)
  _$$VersionDateResultImplCopyWith<_$VersionDateResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
