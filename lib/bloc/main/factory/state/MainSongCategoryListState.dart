

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainSongCategoryListState extends Equatable
{
  final List<SeriesInformationResult> list;

  MainSongCategoryListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}