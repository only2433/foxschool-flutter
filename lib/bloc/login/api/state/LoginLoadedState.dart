
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/login/LoginInformationResult.dart';

class LoginLoadedState extends BlocState
{
  final LoginInformationResult data;
  const LoginLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}