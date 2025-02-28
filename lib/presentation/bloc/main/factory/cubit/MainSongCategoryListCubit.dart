
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/main/factory/state/MainSongCategoryListState.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';

class MainSongCategoryListCubit extends Cubit<MainSongCategoryListState>
{
  MainSongCategoryListCubit() : super(const MainSongCategoryListState(list: []));

  void setSongCategoryList(List<SeriesInformationResult> itemList)
  {
    emit(MainSongCategoryListState(list: itemList));
  }

}