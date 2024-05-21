
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesEnableInformationViewState.dart';

import '../state/SeriesDataViewState.dart';

class SeriesDataViewCubit extends Cubit<SeriesDataViewState>
{
  SeriesDataViewCubit() : super(
      SeriesDataViewState(
        seriesType: "",
        level: -1,
        count: 0,
        isSingleSeries: false,
        arLevelData: "")
  );

  void showSeriesDataView(String seriesType, int level, int count, bool isSingleSeries, String arLevelData)
  {
    emit(SeriesDataViewState(
        seriesType: seriesType,
        level: level,
        count: count,
        isSingleSeries: isSingleSeries,
        arLevelData: arLevelData)
    );
  }

}