

import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'LoginUIState.freezed.dart';

@freezed
class LoginUIState with _$LoginUIState
{
  factory LoginUIState({
    required String schoolName,
    required List<SchoolData> schoolList,
    required bool isAutoLogin
  }) = _LoginUIState;
}