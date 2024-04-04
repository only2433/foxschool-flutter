

import 'package:freezed_annotation/freezed_annotation.dart';

part 'MetaDataPagingResult.freezed.dart';
part 'MetaDataPagingResult.g.dart';

@freezed
class MetaDataPagingResult with _$MetaDataPagingResult
{
  factory MetaDataPagingResult({

    @JsonKey(name:'current_page')
    @Default(0)
    int currentPage,

    @JsonKey(name:'last_page')
    @Default(0)
    int lastPage,

    @JsonKey(name:'per_page')
    @Default(0)
    int perPage,

    @JsonKey(name:'total_page')
    @Default(0)
    int totalPage

  }) = _MetaDataPagingResult;

  factory MetaDataPagingResult.fromJson(Map<String, dynamic> data) => _$MetaDataPagingResultFromJson(data);
}