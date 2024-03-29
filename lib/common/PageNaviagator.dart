

import 'package:flutter/cupertino.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:page_transition/page_transition.dart';

import '../data/main/series/base/SeriesBaseResult.dart';
import '../view/screen/IntroScreen.dart';
import '../view/screen/MainScreen.dart';
import '../view/screen/SeriesContentListScreen.dart';
import 'Common.dart';

PageTransition getDefaultTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_NORMAL),
      reverseDuration: Duration(milliseconds: Common.DURATION_NORMAL),
      type: PageTransitionType.rightToLeftJoined,
      child: toWidget,
      childCurrent: context.widget
  );
}

PageTransition getMainTransition()
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_NORMAL),
      reverseDuration: Duration(milliseconds: Common.DURATION_NORMAL),
      type: PageTransitionType.rightToLeft,
      child: MainScreen());
}

PageTransition getSeriesDetailListTransition(BuildContext context, Widget toWidget)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_NORMAL),
      reverseDuration: Duration(milliseconds: Common.DURATION_NORMAL),
      type: PageTransitionType.fade,
      child: toWidget,
      childCurrent: context.widget);
}

PageTransition getLogoutTransition(BuildContext context)
{
  return PageTransition(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: Common.DURATION_NORMAL),
      reverseDuration: Duration(milliseconds: Common.DURATION_NORMAL),
      type: PageTransitionType.leftToRightJoined,
      child: const IntroScreen(),
      childCurrent: context.widget
  );
}