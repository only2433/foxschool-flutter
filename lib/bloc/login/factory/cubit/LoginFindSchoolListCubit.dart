
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/school_data/SchoolData.dart';
import '../state/LoginFindSchoolListState.dart';

class LoginFindSchoolListCubit extends Cubit<LoginFindSchoolListState>
{
  LoginFindSchoolListCubit() : super(LoginFindSchoolListState(schoolList: []));

  void setSchoolList(List<SchoolData> list)
  {
    emit(LoginFindSchoolListState(schoolList: list));
  }
}