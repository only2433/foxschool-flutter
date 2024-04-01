
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../../base/ContentsListBaseState.dart';

class SeriesItemListState extends ContentsListBaseState
{
  final String seriesColor;
  final bool isFullName;
  final List<ContentsBaseResult> itemList;
  SeriesItemListState({
    required this.seriesColor,
    required this.isFullName,
    required this.itemList
  });

  @override
  List<Object> get props => [seriesColor, isFullName, itemList];
}