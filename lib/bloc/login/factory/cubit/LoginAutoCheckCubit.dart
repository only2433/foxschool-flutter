

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/login/factory/state/AutoLoginCheckState.dart';

class LoginAutoCheckCubit extends Cubit<AutoLoginCheckState>
{
  LoginAutoCheckCubit() : super(AutoLoginCheckState(isAutoLogin: false));

  void setAutoLogin(bool enable)
  {
    emit(AutoLoginCheckState(isAutoLogin: enable));
  }
}