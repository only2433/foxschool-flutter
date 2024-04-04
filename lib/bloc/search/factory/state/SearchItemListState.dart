

import 'package:foxschool/bloc/base/SeachListBaseState.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';

class SearchItemListState extends SearchListBaseState
{
  final bool isLoading;
  final List<ContentsBaseResult> list;
  SearchItemListState({
    required this.isLoading,
    required this.list
  });

  @override
  List<Object> get props => [isLoading, list];
}