
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ContentsInformation.freezed.dart';
part 'ContentsInformation.g.dart';

@freezed
class ContentsInformation with _$ContentsInformation
{
  factory ContentsInformation({

    @JsonKey(name: 'id')
    @Default("")
    String contentID,

    @JsonKey(name: 'name')
    @Default("")
    String contentName,

    @JsonKey(name: 'sub_name')
    @Default("")
    String contentSubName,

    @Default(-1)
    int level,

  }) = _ContentsInformation;

  factory ContentsInformation.fromJson(Map<String, dynamic> data) => _$ContentsInformationFromJson(data);
}