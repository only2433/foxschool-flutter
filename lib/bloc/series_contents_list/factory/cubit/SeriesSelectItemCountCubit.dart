import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesSelectItemCountState.dart';

class SeriesSelectItemCountCubit extends Cubit<SeriesSelectItemCountState>
{
  SeriesSelectItemCountCubit() : super(SeriesSelectItemCountState(count: 0));

  void setSelectItemCount(int count)
  {
    emit(SeriesSelectItemCountState(count: count));
  }

}