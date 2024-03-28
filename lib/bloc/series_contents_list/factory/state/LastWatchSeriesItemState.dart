
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class LastWatchSeriesItemState extends BlocState
{
  final String seriesName;
  final String nickName;
  final int position;
  final bool isLastMovie;
  LastWatchSeriesItemState({
    required this.seriesName,
    required this.nickName,
    required this.position,
    required this.isLastMovie
  });

  @override
  List<Object> get props => [seriesName, nickName, position, isLastMovie];
}