

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListState extends Equatable
{
  final List<SeriesInformationResult> list;

  MainStorySelectTypeListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}