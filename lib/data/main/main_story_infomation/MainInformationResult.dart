
import 'package:freezed_annotation/freezed_annotation.dart';

import '../series/SeriesInformationResult.dart';

part 'MainInformationResult.freezed.dart';
part 'MainInformationResult.g.dart';

@freezed
class MainInformationResult with _$MainInformationResult
{
  factory MainInformationResult({

    @JsonKey(name: 'levels')
    @Default([])
    List<SeriesInformationResult> levelsList,

    @JsonKey(name: 'categories')
    @Default([])
    List<SeriesInformationResult> categoriesList,

  }) = _MainInformationResult;

  MainInformationResult._();
  

  factory MainInformationResult.fromJson(Map<String, dynamic> data) => _$MainInformationResultFromJson(data);

}