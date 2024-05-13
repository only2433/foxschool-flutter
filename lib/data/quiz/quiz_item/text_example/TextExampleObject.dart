
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'TextExampleObject.freezed.dart';
part 'TextExampleObject.g.dart';

@freezed
class TextExampleObject with _$TextExampleObject
{
  factory TextExampleObject({

    @JsonKey(name:'number')
    @Default(-1)
    int exampleIndex,

    @JsonKey(name:'text')
    @Default("")
    String exampleText,

    @JsonKey(name:'sound_url')
    @Default("")
    String exampleSoundUrl

  }) = _TextExampleObject;

  factory TextExampleObject.fromJson(Map<String, dynamic> data) => _$TextExampleObjectFromJson(data);
}