
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/IntroScreenType.dart';
import 'package:foxschool/presentation/controller/intro/river_pod/IntroAPINotifier.dart';
import 'package:foxschool/presentation/controller/intro/river_pod/IntroUINotifier.dart';
import 'package:foxschool/presentation/view/screen/LoginScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/presentation/view/screen/webview/FoxschoolIntroduceScreen.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;



class IntroFactoryController extends BlocController
{
  final List<double> _PROGRESS_PERCENT = [0, 30, 60, 100];
  double? _percent;
  final bool _isLogin = false;
  bool _isOpenPermissionSetting = false;
  late IntroAPINotifierProvider _repositoryProvider;

  final BuildContext context;
  final WidgetRef widgetRef;
  IntroFactoryController({
    required this.context,
    required this.widgetRef
  });

  @override
  void init() {
    Logcats.message("init");
    _repositoryProvider = introAPINotifierProvider(getIt<FoxSchoolRepository>());
    _settingAPINotifier();
    _checkPermission();
  }
  
  void _settingAPINotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (common){
            common.maybeWhen(
                loadingState: (){
                  Logcats.message("Loading State");
                },
                errorState: (message) async {
                  //Fluttertoast.showToast(msg: message);
                  await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                  await Future.delayed(
                    const Duration(milliseconds: Common.DURATION_LONG), () {
                    widgetRef.read(introUINotifierProvider.notifier).changeScreenType(IntroScreenType.TYPE_SELECT_MENU);
                  },);
                },
                orElse: (){}
            );
          },
          versionLoadedState: (data) async{
            await Preference.setObject(Common.PARAMS_VERSION_INFORMATION, data);
            Logcats.message("VersionLoadedState : ${data.toString()}");
            widgetRef.read(introUINotifierProvider.notifier).updateProgress(_PROGRESS_PERCENT[1]);

            await Future.delayed(const Duration(
                milliseconds: Common.DURATION_LONGEST
            ));
            widgetRef.read(_repositoryProvider.notifier).requestAuthMe();
          },
          authMeLoadedState: (data) async{
            await Preference.setObject(Common.PARAMS_USER_API_INFORMATION, data);
            Logcats.message("AuthMeLoadedState : ${data.toString()}");
            widgetRef.read(introUINotifierProvider.notifier).updateProgress(_PROGRESS_PERCENT[2]);

            await Future.delayed(
                const Duration(milliseconds: Common.DURATION_LONGEST
                ));
            widgetRef.read(_repositoryProvider.notifier).requestMain();
          },
          mainLoadedState: (data) async{
            await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, data);
            Logcats.message("MainInformationLoadedState : ${data.toString()}");
            widgetRef.read(introUINotifierProvider.notifier).updateProgress(_PROGRESS_PERCENT[3]);
            await Future.delayed(const Duration(
                milliseconds: Common.DURATION_LONGEST
            ));
            Navigator.pushReplacement(
                context,
                Page.getMainTransition()
            );
          }
      );
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

      Logcats.message("status.isGranted : ${status.isGranted}, status.isDenied : ${status.isDenied}, status.isPermanentlyDenied : ${status.isPermanentlyDenied}");
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
              Logcats.message("BUTTON_1_CLICK");
              await Future.delayed(const Duration(milliseconds:  Common.DURATION_SHORT), () {
/*                Fluttertoast.showToast(
                    msg: getIt<FoxschoolLocalization>().data['message_warning_storage_permission']
                );*/
                SystemNavigator.pop();
              },);
            }
            else
            {
              Logcats.message("BUTTON_2_CLICK");
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
      widgetRef.read(introUINotifierProvider.notifier).changeScreenType(IntroScreenType.TYPE_SELECT_MENU);
    }
  }

  Future<void> _executeMain() async
  {
    widgetRef.read(introUINotifierProvider.notifier).updateProgress(_PROGRESS_PERCENT[0]);
    widgetRef.read(introUINotifierProvider.notifier).changeScreenType(IntroScreenType.TYPE_LOGIN_PROGRESS);
    await Future.delayed(const Duration(
        milliseconds: Common.DURATION_LONG
    ));
    String androidID = await Preference.getString(Common.PARAMS_SECURE_ANDROID_ID);
    String token = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
    widgetRef.read(_repositoryProvider.notifier).requestVersion(androidID, token, "Y");
  }

  @override
  void onPause() {
    Logcats.message("onPause");
  }

  @override
  void onResume() {
    Logcats.message("onResume");
    if(_isOpenPermissionSetting)
    {
      _isOpenPermissionSetting = false;
      _checkPermission();
    }
  }

  @override
  void dispose() {
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

    Logcats.message("result : $result");

    if(result as bool)
      {
        widgetRef.read(introUINotifierProvider.notifier).updateProgress(_PROGRESS_PERCENT[0]);
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