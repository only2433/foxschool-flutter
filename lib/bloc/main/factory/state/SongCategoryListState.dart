

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class SongCategoryListState extends BlocState
{
  final List<SeriesInformationResult> list;

  SongCategoryListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}