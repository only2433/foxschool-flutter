import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/intro/factory/state/IntroScreenTypeState.dart';

import '../../../../enum/IntroScreenType.dart';

class IntroScreenTypeCubit extends Cubit<IntroScreenTypeState>
{
  IntroScreenTypeCubit() : super(IntroScreenTypeState(type: IntroScreenType.TYPE_SELECT_MENU));

  void setIntroScreenType(IntroScreenType type)
  {
    emit(IntroScreenTypeState(type: type));
  }

}