
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../enum/IntroScreenType.dart';

class ScreenTypeState extends BlocState
{
  final IntroScreenType type;
  const ScreenTypeState ({
    required this.type
  });
  @override
  List<Object> get props => [type];
}