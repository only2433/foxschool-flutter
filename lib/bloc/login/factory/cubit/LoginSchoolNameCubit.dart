
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/SchoolNameState.dart';

class LoginSchoolNameCubit extends Cubit<SchoolNameState>
{
  LoginSchoolNameCubit() : super(SchoolNameState(name: ""));

  void setSchoolName(String value)
  {
    emit(SchoolNameState(name: value));
  }

}