

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class StorySelectTypeListState extends BlocState
{
  final List<SeriesInformationResult> list;

  StorySelectTypeListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}