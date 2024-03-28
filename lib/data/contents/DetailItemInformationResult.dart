

import 'package:foxschool/data/contents/series_information/SeriesInformation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'contents_base/ContentsBaseResult.dart';

part 'DetailItemInformationResult.freezed.dart';
part 'DetailItemInformationResult.g.dart';

@freezed
class DetailItemInformationResult with _$DetailItemInformationResult
{
  factory DetailItemInformationResult({

    @JsonKey(name:'latest_study')
    @Default("")
    String lastStudyContentID,

    @JsonKey(name:'list')
    @Default([])
    List<ContentsBaseResult> contentsList,

    @JsonKey(name:'info')
    SeriesInformation? seriesInformation

  }) = _DetailItemInformationResult;

  DetailItemInformationResult._();

  factory DetailItemInformationResult.fromJson(Map<String, dynamic> data) => _$DetailItemInformationResultFromJson(data);

  String getSeriesID()
  {
    return seriesInformation?.id ?? "";
  }

  bool isSingleSeries()
  {
    return seriesInformation?.isSingle() ?? true;
  }

  int getSeriesLevel()
  {
    return seriesInformation?.level ?? 0;
  }

  String getSeriesARLevel()
  {
    if(seriesInformation == null || seriesInformation!.ARLevel == 0.0)
      {
        return "0.0";
      }
    return seriesInformation!.ARLevel.toString();
  }

  bool isStillOnSeries()
  {
    if(contentsList.length < seriesInformation!.totalCount)
      {
        return true;
      }
    return false;
  }
}