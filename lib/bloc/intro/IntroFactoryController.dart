
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/intro/factory/cubit/IntroProgressPercentCubit.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/IntroScreenType.dart';
import 'package:foxschool/view/screen/LoginScreen.dart';
import 'package:foxschool/view/screen/MainScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../di/Dependencies.dart';
import '../../view/screen/webview/FoxschoolIntroduceScreen.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import '../base/BlocController.dart';
import '../base/BlocState.dart';
import 'api/IntroBloc.dart';
import 'api/event/AuthMeEvent.dart';
import 'api/event/GetVersionEvent.dart';
import 'api/event/MainInformationEvent.dart';
import 'api/state/AuthMeLoadedState.dart';
import 'api/state/MainInformationLoadedState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'api/state/VersionLoadedState.dart';
import 'factory/cubit/IntroScreenTypeCubit.dart';
class IntroFactoryController extends BlocController
{
  final List<double> _PROGRESS_PERCENT = [0, 30, 60, 100];

  final BuildContext context;
  StreamSubscription? _subscription;
  double? _percent;
  bool _isLogin = false;
  bool _isOpenPermissionSetting = false;


  IntroFactoryController({
    required this.context
  });

  @override
  void init() {
    Logger.d("init");

    _settingSubscriptions();
    _checkPermission();
  }

  void _settingSubscriptions()
  {
    var blocState;
    _subscription = BlocProvider.of<IntroBloc>(context).stream.listen((state) async {
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
          BlocProvider.of<IntroBloc>(context).add(
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
          BlocProvider.of<IntroBloc>(context).add(
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
          Navigator.pushReplacement(
            context,
            Page.getMainTransition()
          );
          break;
        case ErrorState:
          blocState = state as ErrorState;
          Fluttertoast.showToast(msg: blocState.message);
          await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
          await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
            context.read<IntroScreenTypeCubit>().setIntroScreenType(IntroScreenType.TYPE_SELECT_MENU);
          },);

          break;
      }

    });
  }

  void _checkPermission() async
  {
    bool isPermissionDenied = false;
    Map<Permission, PermissionStatus> statusList = await [
      Permission.microphone
    ].request();

    for(var entry in statusList.entries)
    {
      var permission = entry.key;
      var status = entry.value;

      Logger.d("status.isGranted : ${status.isGranted}, status.isDenied : ${status.isDenied}, status.isPermanentlyDenied : ${status.isPermanentlyDenied}");
      if(status.isGranted == false)
        {
          isPermissionDenied = true;
          break;
        }
    }

    if(isPermissionDenied)
    {
      await FoxSchoolDialog.showSelectDetailDialog(
          context: context,
          message: getIt<FoxschoolLocalization>().data['message_warning_storage_permission'],
          button1Text: getIt<FoxschoolLocalization>().data['text_cancel'],
          button2Text: getIt<FoxschoolLocalization>().data['text_change_permission'],
          onSelected: (index) async{
            if(index == FoxSchoolDialog.BUTTON_1_CLICK)
            {
              Logger.d("BUTTON_1_CLICK");
              await Future.delayed(Duration(milliseconds:  Common.DURATION_SHORT), () {
                Fluttertoast.showToast(
                    msg: getIt<FoxschoolLocalization>().data['message_warning_storage_permission']
                );
                SystemNavigator.pop();
              },);
            }
            else
            {
              Logger.d("BUTTON_2_CLICK");
              _isOpenPermissionSetting = true;
              openAppSettings();
            }
          },);
    }
    else
    {
      _checkAutoLogin();
    }
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
    context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[0]);
    context.read<IntroScreenTypeCubit>().setIntroScreenType(IntroScreenType.TYPE_LOGIN_PROGRESS);
    await Future.delayed(Duration(
        milliseconds: Common.DURATION_LONG
    ));
    String androidID = await Preference.getString(Common.PARAMS_SECURE_ANDROID_ID);
    String token = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
    BlocProvider.of<IntroBloc>(context).add(
        GetVersionEvent(
            deviceType: androidID,
            pushAddress: token,
            pushOn: "Y")
    );
  }

  @override
  void onPause() {
    Logger.d("onPause");
  }

  @override
  void onResume() {
    Logger.d("onResume");
    if(_isOpenPermissionSetting)
    {
      _isOpenPermissionSetting = false;
      _checkPermission();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  Future<void> onClickLogin() async
  {
    var result = await Navigator.push(
      context,
      Page.getDefaultTransition(context, const LoginScreen())
    );

    Logger.i("result : $result");

    if(result as bool)
      {
        context.read<IntroProgressPercentCubit>().setProgressPercent(_PROGRESS_PERCENT[0]);
        _executeMain();
      }
  }

  void onClickFoxSchoolIntroduce()
  {
    Navigator.push(
      context,
      Page.getDefaultTransition(context, const FoxschoolIntroduceScreen())
    );
  }


}