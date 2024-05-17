
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/main/factory/state/MainSongCategoryListState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainSongCategoryListCubit extends Cubit<MainSongCategoryListState>
{
  MainSongCategoryListCubit() : super(MainSongCategoryListState(list: []));

  void setSongCategoryList(List<SeriesInformationResult> itemList)
  {
    emit(MainSongCategoryListState(list: itemList));
  }

}