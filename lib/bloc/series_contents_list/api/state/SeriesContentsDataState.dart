

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/contents/DetailItemInformationResult.dart';

class SeriesContentsDataState extends BlocState
{
  final DetailItemInformationResult data;
  const SeriesContentsDataState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}