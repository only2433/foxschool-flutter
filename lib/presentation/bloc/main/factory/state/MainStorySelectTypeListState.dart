

import 'package:equatable/equatable.dart';
import 'package:foxschool/enum/StorySeriesType.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListState extends Equatable
{
  final StorySeriesType type;
  final List<SeriesInformationResult> list;

  const MainStorySelectTypeListState({
    required this.type,
    required this.list
  });

  @override
  List<Object> get props => [type, list];
}