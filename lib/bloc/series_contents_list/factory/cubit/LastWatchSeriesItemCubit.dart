
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/LastWatchSeriesItemState.dart';

class LastWatchSeriesItemCubit extends Cubit<LastWatchSeriesItemState>
{
  LastWatchSeriesItemCubit() : super(LastWatchSeriesItemState(
      seriesName: "",
      nickName: "",
      position: -1,
      isLastMovie: false)
  );

  void showLastWatchSeriesItem(String seriesName, String nickName, int position, bool isLastMovie)
  {
    emit(LastWatchSeriesItemState(
        seriesName: seriesName,
        nickName: nickName,
        position: position,
        isLastMovie: isLastMovie));
  }

}