
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/LoginSchoolNameState.dart';

class LoginSchoolNameCubit extends Cubit<LoginSchoolNameState>
{
  LoginSchoolNameCubit() : super(LoginSchoolNameState(name: ""));

  void setSchoolName(String value)
  {
    emit(LoginSchoolNameState(name: value));
  }

}