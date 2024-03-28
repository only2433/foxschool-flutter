import 'package:flutter/cupertino.dart';
import 'package:foxschool/data/main/series/base/SeriesBaseResult.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/LoginScreen.dart';
import 'package:foxschool/view/screen/MainScreen.dart';
import 'package:foxschool/view/screen/SeriesContentListScreen.dart';
import 'package:foxschool/view/screen/webview/FoxschoolIntroduceScreen.dart';
import 'package:page_transition/page_transition.dart';

class RouteHelper
{
  static const String _INTRO  = "/app/screen/intro";
  static const String _LOGIN  = "/app/screen/login";
  static const String _LOGOUT = "/app/screen/logout";
  static const String _MAIN   = "/app/screen/main";
  static const String _SERIES_CONTENTS_LIST = "/app/screen/series_contents_list";
  static const String _WEBVIEW_FOXSCHOOL_INTRODUCE = "/app/screen/webview/foxschool_introduce";


  static String getIntro() => '$_INTRO';
  static String getLogin() => '$_LOGIN';
  static String getLogout() => '$_LOGOUT';
  static String getMain() => '$_MAIN';
  static String getSeriesContentsList() => '$_SERIES_CONTENTS_LIST';
  static String getFoxschoolIntroduce() =>'$_WEBVIEW_FOXSCHOOL_INTRODUCE';


  static Route<dynamic>? getGenerateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case _INTRO:
        return PageTransition(
            child: const IntroScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);
      case _LOGIN:
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.rightToLeft);
      case _LOGOUT:
        return PageTransition(
            child: const IntroScreen(),
            type: PageTransitionType.leftToRight);
      case _MAIN:
        return PageTransition(
            child: const MainScreen(),
            type: PageTransitionType.rightToLeft);
      case _SERIES_CONTENTS_LIST:
        SeriesBaseResult data = settings.arguments as SeriesBaseResult;
        return PageTransition(
            child: SeriesContentListScreen(seriesBaseResult: data),
            type: PageTransitionType.fade);
      case _WEBVIEW_FOXSCHOOL_INTRODUCE:
        return PageTransition(
            childCurrent: const IntroScreen(),
            child: const FoxschoolIntroduceScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);
      default:
       return null;
    }
  }

}