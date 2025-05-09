
import 'package:foxschool/data/model/main/series/base/series_data/SeriesData.dart';
import 'package:foxschool/enum/TransitionType.dart';
import 'package:json_annotation/json_annotation.dart';


import '../../../../../common/Common.dart';
import 'color_data/ColorData.dart';

part "SeriesBaseResult.g.dart";

@JsonSerializable()
class SeriesBaseResult
{
  @JsonKey(defaultValue: "")
  final String id;

  @JsonKey(defaultValue: "")
  final String name;

  @JsonKey(name: 'thumbnail_url', defaultValue: "")
  final String thumbnailUrl;

  ColorData? colors;
  SeriesData? series;

  @JsonKey(name: 'free_single_sort_number', defaultValue: 0)
  final int freeSingleSortNumber;

  @JsonKey(name: 'free_series_sort_number', defaultValue: 0)
  final int freeSeriesSortNumber;

  @JsonKey(name: 'basic_sort_number', defaultValue: 0)
  final int basicSortNumber;

  String seriesType;
  TransitionType transitionType;

  SeriesBaseResult({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    this.colors,
    this.series,
    required this.freeSeriesSortNumber,
    required this.freeSingleSortNumber,
    required this.basicSortNumber,
    this.seriesType = Common.CONTENT_TYPE_STORY,
    this.transitionType = TransitionType.PAIR_IMAGE
  });

  String getStatusColor()
  {
    return colors?.statusBar ?? "#1a8ec7";
  }

  String getTitleColor()
  {
    return colors?.title ?? "#20b1f9";
  }

  String getIntroduction()
  {
    return series?.introduction ?? "";
  }

  String getCategoryData()
  {
    return series?.categories ?? "";
  }


  factory SeriesBaseResult.fromJson(Map<String, dynamic> data) => _$SeriesBaseResultFromJson(data);

  Map<String, dynamic> toJson() => _$SeriesBaseResultToJson(this);

}