
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/main/factory/state/SongCategoryListState.dart';

import '../../../../data/main/series/SeriesInformationResult.dart';

class MainSongCategoryListCubit extends Cubit<SongCategoryListState>
{
  MainSongCategoryListCubit() : super(SongCategoryListState(list: []));

  void setSongCategoryList(List<SeriesInformationResult> itemList)
  {
    emit(SongCategoryListState(list: itemList));
  }

}