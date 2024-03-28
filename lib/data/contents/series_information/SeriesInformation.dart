



import 'package:freezed_annotation/freezed_annotation.dart';

part 'SeriesInformation.freezed.dart';
part 'SeriesInformation.g.dart';

@freezed
class SeriesInformation with _$SeriesInformation
{
  factory SeriesInformation({

    @Default("")
    String id,

    @Default("")
    String is_single,

    @Default(-1)
    int level,

    @JsonKey(name:'contents_count')
    @Default(0)
    int totalCount,

    @JsonKey(name:'ar_level')
    @Default(0.0)
    double ARLevel

  }) = _SeriesInformation;

  SeriesInformation._();

  bool isSingle()
  {
    if(is_single == "")
      {
        return false;
      }
    return is_single == "Y" ? true : false;
  }

  factory SeriesInformation.fromJson(Map<String, dynamic> data) => _$SeriesInformationFromJson(data);
}