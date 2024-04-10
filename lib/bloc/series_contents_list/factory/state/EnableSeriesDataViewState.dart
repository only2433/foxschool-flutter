

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class EnableSeriesDataViewState extends Equatable
{
  final String seriesType;
  final int level;
  final int count;
  final bool isSingleSeries;
  final String arLevelData;

  EnableSeriesDataViewState({
    required this.seriesType,
    required this.level,
    required this.count,
    required this.isSingleSeries,
    required this.arLevelData
  });

  @override
  List<Object> get props => [seriesType, level, count, isSingleSeries, arLevelData];
}