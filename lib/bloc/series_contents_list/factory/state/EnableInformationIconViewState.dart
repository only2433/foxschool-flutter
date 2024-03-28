

import 'package:foxschool/bloc/base/BlocState.dart';

class EnableInformationIconViewState extends BlocState
{
  final bool isEnable;
  EnableInformationIconViewState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}