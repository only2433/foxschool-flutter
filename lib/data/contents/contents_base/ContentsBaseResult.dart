
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/Common.dart';
import '../service_supported_type/ServiceSupportedTypeResult.dart';

part 'ContentsBaseResult.freezed.dart';
part 'ContentsBaseResult.g.dart';

@freezed
class ContentsBaseResult with _$ContentsBaseResult
{
  factory ContentsBaseResult({
    @Default("")
    String id,

    @JsonKey(name:'seq')
    @Default(0)
    int index,

    @Default(Common.CONTENT_TYPE_STORY)
    String type,
    
    @Default("")
    String name,

    @JsonKey(name:'sub_name')
    @Default("")
    String subName,

    @JsonKey(name:'thumbnail_url')
    @Default("")
    String thumbnailUrl,

    @JsonKey(name:'service_info')
    ServiceSupportedTypeResult? serviceInfo,

    @Default("")
    String story_chk,

    @Default(false)
    bool isSelected,

    @Default(false)
    bool isOptionDisable
  }) = _ContentsBaseResult;

  ContentsBaseResult._();
  
  String getContentsName()
  {
    String result = "";
    if(subName == "")
      {
        result = name;
      }
    else
      {
        result = '$name: $subName';
      }
    return result;
  }

  String getSubName()
  {
    String result = "";
    if(subName == "")
    {
      result = name;
    }
    else
    {
      result = subName;
    }
    return result;
  }

  ContentsBaseResult setIndex(int i)
  {
    return copyWith(index: i);
  }


  factory ContentsBaseResult.fromJson(Map<String, dynamic> data) => _$ContentsBaseResultFromJson(data);

}