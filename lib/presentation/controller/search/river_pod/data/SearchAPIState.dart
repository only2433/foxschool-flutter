


import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/search/SearchListPagingResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'SearchAPIState.freezed.dart';

@freezed
abstract class SearchAPIState with _$SearchAPIState
{
  const factory SearchAPIState.common(CommonAPIState state) = _Common;
  const factory SearchAPIState.contentsLoadingState() = _ContentsLoadingState;
  const factory SearchAPIState.contentsLoadedState(SearchListPagingResult data) = _ContentsLoadedState;
  const factory SearchAPIState.bookshelfContentsAddState(MyBookshelfResult data) = _BookshelfContentsAddState;
}