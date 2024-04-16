

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class SongCategoryListState extends Equatable
{
  final List<SeriesInformationResult> list;

  SongCategoryListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}