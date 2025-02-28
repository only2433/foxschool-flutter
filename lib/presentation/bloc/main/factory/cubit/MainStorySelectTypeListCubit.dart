
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/main/factory/state/MainStorySelectTypeListState.dart';
import 'package:foxschool/enum/StorySeriesType.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListCubit extends Cubit<MainStorySelectTypeListState>
{
  MainStorySelectTypeListCubit() : super(const MainStorySelectTypeListState(type: StorySeriesType.LEVEL,list: []));

  void setSelectTypeList(StorySeriesType type, List<SeriesInformationResult> itemList)
  {
    emit(MainStorySelectTypeListState(
        type: type,
        list: itemList));
  }
}