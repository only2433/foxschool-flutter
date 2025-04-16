

import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/search/meta/MetaDataPagingResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SearchListPagingResult.freezed.dart';
part 'SearchListPagingResult.g.dart';

@freezed
class SearchListPagingResult with _$SearchListPagingResult
{
  factory SearchListPagingResult({

    @Default([])
    List<ContentsBaseResult> list,

    MetaDataPagingResult? meta

  }) = _SearchListPagingResult;

  SearchListPagingResult._();

  int getCurrentPageIndex()
  {
    return meta?.currentPage ?? 0;
  }

  int getLastPageIndex()
  {
    return meta?.lastPage ?? 0;
  }

  bool isLastPage()
  {
    return meta?.currentPage == meta?.lastPage ?? false;
  }

  int getTotalCount()
  {
    return meta?.totalPage ?? 0;
  }

  factory SearchListPagingResult.fromJson(Map<String, dynamic> data) => _$SearchListPagingResultFromJson(data);
}