

import '../../../base/BlocState.dart';

class AutoLoginCheckState extends BlocState
{
  final bool isAutoLogin;

  AutoLoginCheckState({
    required this.isAutoLogin
  });

  @override
  List<Object> get props => [isAutoLogin];
}