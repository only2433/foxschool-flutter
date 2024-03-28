

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/contents/DetailItemInformationResult.dart';

class SeriesStoryDataState extends BlocState
{
  final DetailItemInformationResult data;
  const SeriesStoryDataState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}