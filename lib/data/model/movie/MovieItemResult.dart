import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'caption/CaptionInformationResult.dart';

part 'MovieItemResult.freezed.dart'; // Include this line
part 'MovieItemResult.g.dart';

@freezed
class MovieItemResult with _$MovieItemResult {
  factory MovieItemResult({
    @JsonKey(name: 'id')
    @Default("")
    String contentID,

    @JsonKey(name: 'record_key')
    @Default("")
    String recordKey,

    @JsonKey(name: 'total_time')
    @Default(0)
    int totalTime,

    @JsonKey(name: 'mp4_url')
    @Default("")
    String movieMP4Url,

    @JsonKey(name: 'm3u8_url')
    @Default("")
    String movieHLSUrl,

    @JsonKey(name: 'preview_time')
    @Default(0)
    int previewTime,

    @JsonKey(name: 'subtitle_group_count')
    @Default(0)
    int pageByPageMaxCount,

    @JsonKey(name: 'next_content')
    ContentsBaseResult? nextContent,

    @JsonKey(name: 'subtitle')
    @Default([])
    List<CaptionInformationResult> captionList,

  }) = _MovieItemResult;

  factory MovieItemResult.fromJson(Map<String, dynamic> data) => _$MovieItemResultFromJson(data);
}