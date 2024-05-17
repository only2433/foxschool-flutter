
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/main/factory/state/MainStorySelectTypeListState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainStorySelectTypeListCubit extends Cubit<MainStorySelectTypeListState>
{
  MainStorySelectTypeListCubit() : super(MainStorySelectTypeListState(list: []));

  void setSelectTypeList(List<SeriesInformationResult> itemList)
  {
    emit(MainStorySelectTypeListState(list: itemList));
  }
}