import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'VersionDataResult.freezed.dart';
part 'VersionDataResult.g.dart';

@freezed
class VersionDataResult with _$VersionDataResult
{
  factory VersionDataResult({
    
    @JsonKey(name: 'installed_version')
    @Default("")
    String installedVersion,
    
    @JsonKey(name: 'lastest_version')
    @Default("")
    String lastestVersion,
    
    @JsonKey(name: 'store_url')
    @Default("")
    String storeUrl,
    
    @JsonKey(name: 'player_type')
    @Default("")
    String playerType,

    @JsonKey(name: 'is_installed_latest')
    @Default(false)
    bool isInstalledLatest,

    @JsonKey(name: 'force_update')
    @Default(false)
    bool isForceUpdate
  }) = _VersionDateResult;

  factory VersionDataResult.fromJson(Map<String, dynamic> json) => _$VersionDataResultFromJson(json);
}