
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../enum/IntroScreenType.dart';

class ScreenTypeState extends Equatable
{
  final IntroScreenType type;
  const ScreenTypeState ({
    required this.type
  });
  @override
  List<Object> get props => [type];
}