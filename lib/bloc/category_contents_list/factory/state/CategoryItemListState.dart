


import 'package:foxschool/bloc/base/ContentsListBaseState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class CategoryItemListState extends ContentsListBaseState
{
  final List<SeriesInformationResult> itemList;
  CategoryItemListState({
   required this.itemList
  });

  @override
  List<Object> get props => [itemList];
}