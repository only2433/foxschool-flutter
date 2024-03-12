
import 'package:foxschool/bloc/base/BlocEvent.dart';

class LoginEvent extends BlocEvent
{
  final String loginID;
  final String password;
  final String schoolCode;

  LoginEvent({
    required this.loginID,
    required this.password,
    required this.schoolCode
  });

  @override
  List<Object> get props => [this.loginID, this.password, this.schoolCode];
}