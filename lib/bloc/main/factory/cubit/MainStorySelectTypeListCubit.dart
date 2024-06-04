
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/main/factory/state/MainStorySelectTypeListState.dart';
import 'package:foxschool/enum/StorySeriesType.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListCubit extends Cubit<MainStorySelectTypeListState>
{
  MainStorySelectTypeListCubit() : super(MainStorySelectTypeListState(type: StorySeriesType.LEVEL,list: []));

  void setSelectTypeList(StorySeriesType type, List<SeriesInformationResult> itemList)
  {
    emit(MainStorySelectTypeListState(
        type: type,
        list: itemList));
  }
}