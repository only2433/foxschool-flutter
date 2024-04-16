

import 'package:equatable/equatable.dart';

import '../../../base/BlocState.dart';

class AutoLoginCheckState extends Equatable
{
  final bool isAutoLogin;

  AutoLoginCheckState({
    required this.isAutoLogin
  });

  @override
  List<Object> get props => [isAutoLogin];
}