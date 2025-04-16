
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
part 'MainStoryInformationResult.freezed.dart';
part 'MainStoryInformationResult.g.dart';

@freezed
class MainStoryInformationResult with _$MainStoryInformationResult
{
  factory MainStoryInformationResult({

    @JsonKey(name: 'levels')
    @Default([])
    List<SeriesInformationResult> levelsList,

    @JsonKey(name: 'categories')
    @Default([])
    List<SeriesInformationResult> categoriesList,

  }) = _MainStoryInformationResult;

  MainStoryInformationResult._();
  

  factory MainStoryInformationResult.fromJson(Map<String, dynamic> data) => _$MainStoryInformationResultFromJson(data);

}