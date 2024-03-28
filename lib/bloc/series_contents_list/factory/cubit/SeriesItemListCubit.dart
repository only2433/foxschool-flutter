
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesItemListState.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';

class SeriesItemListCubit extends Cubit<SeriesDataBaseState>
{
  SeriesItemListCubit() : super(LoadingState());

  void showLoading()
  {
    emit(LoadingState());
  }

  void showSeriesItemList(String seriesColor, bool isFullName, List<ContentsBaseResult> list)
  {
    emit(SeriesItemListState(
        seriesColor: seriesColor,
        isFullName: isFullName,
        itemList: list)
    );
  }

}