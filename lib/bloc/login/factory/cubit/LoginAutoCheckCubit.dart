

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/login/factory/state/LoginAutoCheckState.dart';

class LoginAutoCheckCubit extends Cubit<LoginAutoCheckState>
{
  LoginAutoCheckCubit() : super(LoginAutoCheckState(isAutoLogin: false));

  void setAutoLogin(bool enable)
  {
    emit(LoginAutoCheckState(isAutoLogin: enable));
  }
}