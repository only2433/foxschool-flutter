

import 'package:flutter/cupertino.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:page_transition/page_transition.dart';

import '../data/main/series/base/SeriesBaseResult.dart';
import '../view/screen/IntroScreen.dart';
import '../view/screen/MainScreen.dart';
import '../view/screen/SeriesContentListScreen.dart';
import 'Common.dart';

PageTransition getDefaultJoinedTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeftJoined,
      child: toWidget,
      childCurrent: context.widget
  );
}

PageTransition getDefaultTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeft,
      child: toWidget,
  );
}

PageTransition getMainTransition()
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeft,
      child: MainScreen());
}

PageTransition getSeriesDetailListTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.fade,
      child: toWidget,
      childCurrent: context.widget);
}

PageTransition getLogoutTransition(BuildContext context)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
      reverseDuration: Duration(milliseconds: Common.DURATION_SHORT),
      type: PageTransitionType.rightToLeftWithFade,
      child: const IntroScreen()
  );
}