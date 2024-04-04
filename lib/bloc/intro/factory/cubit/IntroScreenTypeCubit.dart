import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/intro/factory/state/ScreenTypeState.dart';

import '../../../../enum/IntroScreenType.dart';

class IntroScreenTypeCubit extends Cubit<ScreenTypeState>
{
  IntroScreenTypeCubit() : super(ScreenTypeState(type: IntroScreenType.TYPE_SELECT_MENU));

  void setIntroScreenType(IntroScreenType type)
  {
    emit(ScreenTypeState(type: type));
  }

}