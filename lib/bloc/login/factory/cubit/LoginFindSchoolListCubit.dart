
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/school_data/SchoolData.dart';
import '../state/FindSchoolListState.dart';

class LoginFindSchoolListCubit extends Cubit<FindSchoolListState>
{
  LoginFindSchoolListCubit() : super(FindSchoolListState(schoolList: []));

  void setSchoolList(List<SchoolData> list)
  {
    emit(FindSchoolListState(schoolList: list));
  }
}