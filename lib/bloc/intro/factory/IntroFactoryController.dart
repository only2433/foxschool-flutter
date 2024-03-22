
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/factory/cubit/IntroProgressPercentCubit.dart';
import 'package:foxschool/enum/IntroScreenType.dart';

import '../../../common/Common.dart';
import '../../../common/CommonUtils.dart';
import '../../../route/RouteHelper.dart';
import '../../base/BlocController.dart';
import '../../base/BlocState.dart';
import '../api/IntroBloc.dart';
import '../api/event/AuthMeEvent.dart';
import '../api/event/GetVersionEvent.dart';
import '../api/event/MainInformationEvent.dart';
import '../api/state/AuthMeLoadedState.dart';
import '../api/state/MainInformationLoadedState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

import '../api/state/VersionLoadedState.dart';
import 'cubit/IntroScreenTypeCubit.dart';
class IntroFactoryController extends BlocController
{
  final List<double> _PROGRESS_PERCENT = [0, 30, 60, 100];

  final BuildContext context;
  late StreamSubscription _subscription;
  double? _percent;
  bool _isLogin = false;

  IntroFactoryController({
    required this.context
  });

  @override
  void init() {
    _settingSubscriptions();
    _checkAutoLogin();
  }

  void _settingSubscriptions()
  {
    var blocState;
    _subscription = context.read<IntroBloc>().stream.listen((state) async {
      switch(state.runtimeType)
      {
        case VersionLoadedState:
          blocState = state as VersionLoadedState;
          await Preference.setObject(Common.PARAMS_VERSION_INFORMATION, blocState.data);
          Logger.d("VersionLoadedState : ${blocState.data.toString()}");

          context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[1]);

          await Future.delayed(const Duration(
              milliseconds: Common.DURATION_LONGEST
          ));
          context.read<IntroBloc>().add(
              AuthMeEvent()
          );
          break;
        case AuthMeLoadedState:
          blocState = state as AuthMeLoadedState;
          await Preference.setObject(Common.PARAMS_USER_API_INFORMATION, blocState.data);
          Logger.d("AuthMeLoadedState : ${blocState.data.toString()}");

          context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[2]);
          await Future.delayed(const Duration(
              milliseconds: Common.DURATION_LONGEST
          ));
          context.read<IntroBloc>().add(
              MainInformationEvent()
          );
          break;
        case MainInformationLoadedState:
          blocState = state as MainInformationLoadedState;
          await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, blocState.data);
          Logger.d("MainInformationLoadedState : ${blocState.data.toString()}");

          context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[3]);
          await Future.delayed(const Duration(
              milliseconds: Common.DURATION_LONGEST
          ));
          Navigator.of(context).pushReplacementNamed(RouteHelper.getMain());
          break;
        case ErrorState:
          blocState = state as ErrorState;
          CommonUtils.getInstance(context).showErrorMessage(blocState.message);
          break;
      }

    });
  }

  void _checkAutoLogin() async
  {
    bool isAutoLogin = await Preference.getBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA);
    if(isAutoLogin)
    {
      _executeMain();
    }
    else
    {
      context.read<IntroScreenTypeCubit>().setIntroScreenType(IntroScreenType.TYPE_SELECT_MENU);
    }
  }

  Future<void> _executeMain() async
  {
    context.read<IntroScreenTypeCubit>().setIntroScreenType(IntroScreenType.TYPE_LOGIN_PROGRESS);
    await Future.delayed(Duration(
        milliseconds: Common.DURATION_LONG
    ));
    String androidID = await Preference.getString(Common.PARAMS_SECURE_ANDROID_ID);
    String token = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
    context.read<IntroBloc>().add(
        GetVersionEvent(
            deviceType: androidID,
            pushAddress: token,
            pushOn: "Y")
    );
  }

  Future<void> onClickLogin() async
  {
    var result = await Navigator.of(context).pushNamed(RouteHelper.getLogin());

    Logger.i("result : $result");

    if(result as bool)
      {
        context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[0]);
        _executeMain();
      }
  }

  void onClickFoxSchoolIntroduce()
  {
    Navigator.of(context).pushNamed(RouteHelper.getFoxschoolIntroduce());
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }



}