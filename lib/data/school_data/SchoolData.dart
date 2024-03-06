
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SchoolData.freezed.dart';
part 'SchoolData.g.dart';


@freezed
class SchoolData with _$SchoolData
{
  factory SchoolData({
    @Default("")
    String id,

    @Default("")
    String name,
  }) = _SchoolData;

  factory SchoolData.fromJson(Map<String, dynamic> json) => _$SchoolDataFromJson(json);
}