
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/EnableInformationIconViewState.dart';

import '../state/EnableSeriesDataViewState.dart';

class EnableSeriesDataViewCubit extends Cubit<EnableSeriesDataViewState>
{
  EnableSeriesDataViewCubit() : super(
      EnableSeriesDataViewState(
        seriesType: "",
        level: -1,
        count: 0,
        isSingleSeries: false,
        arLevelData: "")
  );

  void showSeriesDataView(String seriesType, int level, int count, bool isSingleSeries, String arLevelData)
  {
    emit(EnableSeriesDataViewState(
        seriesType: seriesType,
        level: level,
        count: count,
        isSingleSeries: isSingleSeries,
        arLevelData: arLevelData)
    );
  }

}