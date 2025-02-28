

import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:foxschool/presentation/controller/login/river_pod/data/LoginUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'LoginUINotifier.g.dart';
@riverpod
class LoginUINotifier extends _$LoginUINotifier
{
  @override
  LoginUIState build() {
    return LoginUIState(
        schoolName: "",
        schoolList: [],
        isAutoLogin: false);
  }

  void setSchoolName(String name)
  {
    state = state.copyWith(
      schoolName: name
    );
  }

  void setSchoolList(List<SchoolData> list)
  {
    state = state.copyWith(
      schoolList: list
    );
  }

  void enableAutoLogin(bool isEnable)
  {
    state = state.copyWith(
      isAutoLogin: isEnable
    );
  }
}