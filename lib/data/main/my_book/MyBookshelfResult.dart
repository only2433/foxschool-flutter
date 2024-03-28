
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyBookshelfResult.freezed.dart';
part 'MyBookshelfResult.g.dart';

@freezed
class MyBookshelfResult with _$MyBookshelfResult
{
  factory MyBookshelfResult({

    @Default("")
    String id,

    @Default("")
    String name,

    @Default("")
    String color,

    @JsonKey(name:'contents_count')
    @Default(0)
    int contentsCount
  }) = _MyBookshelfResult;

  factory MyBookshelfResult.fromJson(Map<String, dynamic> data) => _$MyBookshelfResultFromJson(data);
}