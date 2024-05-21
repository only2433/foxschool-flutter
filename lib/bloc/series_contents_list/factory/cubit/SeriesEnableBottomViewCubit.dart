import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/SeriesEnableBottomViewState.dart';

class SeriesEnableBottomViewCubit extends Cubit<SeriesEnableBottomViewState>
{
  SeriesEnableBottomViewCubit() : super(const SeriesEnableBottomViewState(isEnable: false));

  void enableBottomSelectView(bool isEnable)
  {
    emit(SeriesEnableBottomViewState(isEnable: isEnable));
  }

}