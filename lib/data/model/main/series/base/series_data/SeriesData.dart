
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SeriesData.freezed.dart';
part 'SeriesData.g.dart';

@freezed
class SeriesData with _$SeriesData
{
  factory SeriesData({

    @Default("")
    String introduction,

    @Default("")
    String categories
  }) = _SeriesData;

  factory SeriesData.fromJson(Map<String, dynamic> data) => _$SeriesDataFromJson(data);
}