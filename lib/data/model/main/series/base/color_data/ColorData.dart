
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ColorData.freezed.dart';
part 'ColorData.g.dart';

@freezed
class ColorData with _$ColorData
{
  factory ColorData({

    @JsonKey(name: 'status_bar')
    @Default("")
    String statusBar,

    @Default("")
    String title,
  }) = _ColorData;

  factory ColorData.fromJson(Map<String, dynamic> data) => _$ColorDataFromJson(data);
}