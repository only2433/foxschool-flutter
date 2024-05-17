

import 'package:equatable/equatable.dart';

import '../../../base/BlocState.dart';

class LoginAutoCheckState extends Equatable
{
  final bool isAutoLogin;

  LoginAutoCheckState({
    required this.isAutoLogin
  });

  @override
  List<Object> get props => [isAutoLogin];
}