
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/IntroProgressPercentState.dart';

class IntroProgressPercentCubit extends Cubit<IntroProgressPercentState>
{
  IntroProgressPercentCubit() : super(IntroProgressPercentState(percent: 0));

  void setProgressPercent(double percent)
  {
    emit(IntroProgressPercentState(percent: percent));
  }

}