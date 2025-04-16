
import 'package:foxschool/data/model/main/series/base/SeriesBaseResult.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/enum/TransitionType.dart';
import 'base/color_data/ColorData.dart';
import 'base/series_data/SeriesData.dart';

part 'SeriesInformationResult.g.dart';

@JsonSerializable()
class SeriesInformationResult extends SeriesBaseResult
{
  @JsonKey(name: 'contents_count', defaultValue: -1)
  final int contentsCount;

  @JsonKey(defaultValue: -1)
  final int level;

  @JsonKey(name: 'is_single', defaultValue: "")
  String isSingle;

  SeriesInformationResult({
    required String id,
    required String name,
    required String thumbnailUrl,
    required int freeSeriesSortNumber,
    required int freeSingleSortNumber,
    required int basicSortNumber,
    String seriesType = Common.CONTENT_TYPE_STORY,
    TransitionType transitionType = TransitionType.PAIR_IMAGE,
    required this.contentsCount,
    required this.level,
    required this.isSingle,
  }) : super(
    id: id,
    name: name,
    thumbnailUrl: thumbnailUrl,
    freeSeriesSortNumber: freeSeriesSortNumber,
    freeSingleSortNumber: freeSingleSortNumber,
    basicSortNumber: basicSortNumber,
    seriesType: seriesType,
    transitionType: transitionType
  );

  bool isSingleSeries()
  {
    if(isSingle == "Y") {
      return true;
    }

    return false;
  }

  factory SeriesInformationResult.fromJson(Map<String, dynamic> data) => _$SeriesInformationResultFromJson(data);

  @override
  Map<String, dynamic> toJson() => _$SeriesInformationResultToJson(this);
}