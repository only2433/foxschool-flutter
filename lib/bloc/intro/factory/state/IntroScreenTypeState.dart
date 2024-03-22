
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../enum/IntroScreenType.dart';

class IntroScreenTypeState extends BlocState
{
  final IntroScreenType type;
  const IntroScreenTypeState ({
    required this.type
  });
  @override
  List<Object> get props => [type];
}