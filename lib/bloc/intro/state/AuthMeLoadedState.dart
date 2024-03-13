
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/login/LoginInformationResult.dart';

class AuthMeLoadedState extends BlocState
{
  final LoginInformationResult data;
  const AuthMeLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}