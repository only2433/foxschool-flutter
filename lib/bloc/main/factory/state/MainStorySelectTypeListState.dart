

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/enum/StorySeriesType.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListState extends Equatable
{
  final StorySeriesType type;
  final List<SeriesInformationResult> list;

  MainStorySelectTypeListState({
    required this.type,
    required this.list
  });

  @override
  List<Object> get props => [type, list];
}