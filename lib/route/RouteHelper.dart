import 'package:flutter/cupertino.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/LoginScreen.dart';
import 'package:foxschool/view/screen/webview/FoxschoolIntroduceScreen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class RouteHelper
{
  static const String _INTRO ="/app/screen/intro";
  static const String _LOGIN = "/app/screen/login";
  static const String _WEBVIEW_FOXSCHOOL_INTRODUCE = "/app/screen/webview/foxschool_introduce";


  static String getIntro() => '$_INTRO';
  static String getLogin() => '$_LOGIN';
  static String getFoxschoolIntroduce() =>'$_WEBVIEW_FOXSCHOOL_INTRODUCE';


  static Route<dynamic>? getGenerateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case _INTRO:
        return PageAnimationTransition(
            page: const IntroScreen(),
            pageAnimationType: RightToLeftTransition());
      case _LOGIN:
        return PageAnimationTransition(
            page: const LoginScreen(),
            pageAnimationType: RightToLeftTransition());
      case _WEBVIEW_FOXSCHOOL_INTRODUCE:
        return PageAnimationTransition(
            page: const FoxschoolIntroduceScreen(),
            pageAnimationType: RightToLeftTransition());
      default:
       return null;
    }
  }

}