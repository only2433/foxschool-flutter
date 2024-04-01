

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ThemeData.freezed.dart';
part 'ThemeData.g.dart';

@freezed
class ThemeData with _$ThemeData
{
  factory ThemeData({

    @Default("")
    String id,

    @Default("")
    String name

  }) = _ThemeData;

  factory ThemeData.fromJson(Map<String, dynamic> data) => _$ThemeDataFromJson(data);
}