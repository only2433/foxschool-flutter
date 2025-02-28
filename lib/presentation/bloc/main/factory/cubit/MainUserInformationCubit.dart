
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/main/factory/state/MainUserInformationState.dart';

class MainUserInformationCubit extends Cubit<MainUserInformationState>
{
  MainUserInformationCubit() : super(const MainUserInformationState(userName: "", userClass: "", userSchoolName: ""));

  void setUserInformation(String userName, String userClass, String schoolName)
  {
    emit(MainUserInformationState(userName: userName, userClass: userClass, userSchoolName: schoolName));
  }

}