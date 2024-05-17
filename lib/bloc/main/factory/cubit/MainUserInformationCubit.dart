
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/MainUserInformationState.dart';

class MainUserInformationCubit extends Cubit<MainUserInformationState>
{
  MainUserInformationCubit() : super(MainUserInformationState(userName: "", userClass: "", userSchoolName: ""));

  void setUserInformation(String userName, String userClass, String schoolName)
  {
    emit(MainUserInformationState(userName: userName, userClass: userClass, userSchoolName: schoolName));
  }

}