
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesLastWatchItemState.dart';

class SeriesLastWatchItemCubit extends Cubit<SeriesLastWatchItemState>
{
  SeriesLastWatchItemCubit() : super(SeriesLastWatchItemState(
      seriesName: "",
      nickName: "",
      position: -1,
      isLastMovie: false)
  );

  void showLastWatchSeriesItem(String seriesName, String nickName, int position, bool isLastMovie)
  {
    emit(SeriesLastWatchItemState(
        seriesName: seriesName,
        nickName: nickName,
        position: position,
        isLastMovie: isLastMovie));
  }

}