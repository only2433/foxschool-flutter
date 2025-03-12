

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/enum/SearchItemLoadType.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:foxschool/presentation/controller/search/river_pod/data/SearchUIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SearchUINotifier.g.dart';

@riverpod
class SearchUINotifier extends _$SearchUINotifier
{
  @override
  SearchUIState build() {
    return SearchUIState(
        searchType: SearchType.ALL,
        itemLoadType: SearchItemLoadType.DEFAULT,
        contentsList: []);
  }

  void updateSearchType(SearchType type)
  {
    state = state.copyWith(
      searchType: type
    );
  }

  void updateItemLoadType(SearchItemLoadType type)
  {
    state = state.copyWith(
      itemLoadType: type
    );
  }

  void notifySearchItemList(List<ContentsBaseResult> list)
  {
    state = state.copyWith(
      contentsList: list
    );
  }

  void updateLoadTypeAndItemList(SearchItemLoadType type, List<ContentsBaseResult> list)
  {
    state = state.copyWith(
        itemLoadType: type,
        contentsList: list
    );
  }

}