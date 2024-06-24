

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/contents/DetailItemInformationResult.dart';

class SeriesContentsDataLoadedState extends BlocState
{
  final DetailItemInformationResult data;
  const SeriesContentsDataLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [];
}