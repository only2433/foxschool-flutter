// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VersionDataResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionDateResultImpl _$$VersionDateResultImplFromJson(
        Map<String, dynamic> json) =>
    _$VersionDateResultImpl(
      installedVersion: json['installed_version'] as String? ?? "",
      lastestVersion: json['lastest_version'] as String? ?? "",
      storeUrl: json['store_url'] as String? ?? "",
      playerType: json['player_type'] as String? ?? "",
      isInstalledLatest: json['is_installed_latest'] as bool? ?? false,
      isForceUpdate: json['force_update'] as bool? ?? false,
    );

Map<String, dynamic> _$$VersionDateResultImplToJson(
        _$VersionDateResultImpl instance) =>
    <String, dynamic>{
      'installed_version': instance.installedVersion,
      'lastest_version': instance.lastestVersion,
      'store_url': instance.storeUrl,
      'player_type': instance.playerType,
      'is_installed_latest': instance.isInstalledLatest,
      'force_update': instance.isForceUpdate,
    };
