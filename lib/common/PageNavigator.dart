
import 'package:flutter/cupertino.dart';
import 'package:foxschool/presentation/view/screen/MainTestScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:foxschool/presentation/view/screen/IntroScreen.dart';
import 'package:foxschool/presentation/view/screen/MainScreen.dart';
import 'Common.dart';

PageTransition getDefaultJoinedTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeftJoined,
      child: toWidget,
      childCurrent: context.widget
  );
}

PageTransition getDefaultTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeft,
      child: toWidget,
  );
}

PageTransition getScaleTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
    curve: Curves.decelerate,
    duration: const Duration(milliseconds: Common.DURATION_SHORT),
    reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    child: toWidget,
  );
}

PageTransition getMainTransition()
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeft,
      child: const MainScreen());
}

PageTransition getSeriesDetailListTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.fade,
      child: toWidget,
      childCurrent: context.widget);
}

PageTransition getIntroTransition(BuildContext context)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: const Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.leftToRightWithFade,
      child: const IntroScreen()
  );
}
