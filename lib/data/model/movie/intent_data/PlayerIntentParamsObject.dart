

import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'PlayerIntentParamsObject.freezed.dart';

@freezed
class PlayerIntentParamsObject with _$PlayerIntentParamsObject
{
  factory PlayerIntentParamsObject({
    required List<ContentsBaseResult> list,

    @Default(0)
    int homeworkNumber
  }) = _PlayerIntentParamsObject;
}