
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/main/factory/state/StorySelectTypeListState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListCubit extends Cubit<StorySelectTypeListState>
{
  MainStorySelectTypeListCubit() : super(StorySelectTypeListState(list: []));

  void setSelectTypeList(List<SeriesInformationResult> itemList)
  {
    emit(StorySelectTypeListState(list: itemList));
  }
}