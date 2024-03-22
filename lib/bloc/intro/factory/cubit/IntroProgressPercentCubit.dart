
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/ProgressPercentState.dart';

class IntroProgressPercentCubit extends Cubit<ProgressPercentState>
{
  IntroProgressPercentCubit() : super(ProgressPercentState(percent: 0));

  void setProgressPercent(double percent)
  {
    emit(ProgressPercentState(percent: percent));
  }

}