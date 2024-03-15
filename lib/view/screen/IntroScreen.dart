
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/event/AuthMeEvent.dart';
import 'package:foxschool/bloc/login/event/GetSchoolDataEvent.dart';
import 'package:foxschool/bloc/intro/event/GetVersionEvent.dart';
import 'package:foxschool/bloc/intro/event/MainInformationEvent.dart';
import 'package:foxschool/bloc/intro/state/AuthMeLoadedState.dart';
import 'package:foxschool/bloc/intro/state/MainInformationLoadedState.dart';
import 'package:foxschool/bloc/intro/state/VersionLoadedState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/route/RouteHelper.dart';
import 'package:foxschool/view/screen/webview/FoxschoolIntroduceScreen.dart';
import 'package:foxschool/view/widget/BlueOutlinedTextButton.dart';
import 'package:foxschool/view/widget/BlueTextButton.dart';
import 'package:foxschool/view/widget/FrameAnimationView.dart';
import 'package:foxschool/view/widget/PercentLineProgressBar.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import '../../common/Common.dart';
import '../dialog/LoadingDialog.dart' as LoadingDialog;
import '../../common/Preference.dart' as Preference;
import '../../bloc/base/BlocState.dart';
import '../../bloc/intro/IntroBloc.dart';
import '../../values/AppColors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
{
  final List<double> _PROGRESS_PERCENT = [0, 30, 60, 100];
  late StreamSubscription _subscription;
  double? _percent;
  bool _isLogin = false;


  @override
  void initState()
  {
    super.initState();
    _percent = 0;
    settingSubscriptions();
    checkAutoLogin();
  }

  void settingSubscriptions()
  {
    var blocState;
    _subscription = context.read<IntroBloc>().stream.listen((state) async {
      switch(state.runtimeType)
      {
        case VersionLoadedState:
          blocState = state as VersionLoadedState;
          await Preference.setObject(Common.PARAMS_VERSION_INFORMATION, blocState.data);
          Logger.d("VersionLoadedState : ${blocState.data.toString()}");
          setState(() {
            _percent = _PROGRESS_PERCENT[1];
          });
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
          setState(() {
            _percent = _PROGRESS_PERCENT[2];
          });
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
          setState(() {
            _percent = _PROGRESS_PERCENT[3];
          });
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

  void checkAutoLogin() async
  {
    bool isAutoLogin = await Preference.getBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA);
    if(isAutoLogin)
      {
        executeMain();
      }
  }

  Future<void> executeMain() async
  {
    setState(() {
      _isLogin = true;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.color_47e1ad,
                    AppColors.color_29c8e6
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: CommonUtils.getInstance(context).getHeight(552),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: CommonUtils.getInstance(context).getHeight(300),
                    child: Column(
                      children: [
                        Image.asset('asset/image/intro_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(194),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                        SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(20),
                        ),
                        Image.asset('asset/image/foxschool_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(620),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                      ],
                    ),
                  ),
                ),
                if(_isLogin)
                  Positioned(
                      bottom: 0,
                      child: _ProgressLayout(context))
                else
                  Positioned(
                      bottom: 0,
                      child: _ItemSelectLayout(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ProgressLayout(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(300),
      child: Column(
        children: [

          FrameAnimationView(
              width: CommonUtils.getInstance(context).getWidth(160),
              height: CommonUtils.getInstance(context).getWidth(160),
              duration: Duration(
                  milliseconds: 70
              ),
              isStart: true
          ),
          PercentLineProgressBar(
                percent: _percent ?? 0,
                width: CommonUtils.getInstance(context).getWidth(888),
                height: CommonUtils.getInstance(context).getWidth(50),
                progressColor: AppColors.color_alpha_white
          ),
        ],
      ),
    );
  }

  Widget _ItemSelectLayout(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(524),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(5),
          ),
          RobotoNormalText(
              text: getIt<FoxschoolLocalization>().data['message_intro_foxschool'],
              fontSize: CommonUtils.getInstance(context).getWidth(34),
              align: TextAlign.center
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(30),
          ),
          BlueOutlinedTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_login'],
              onPressed: () async{
                var result = await Navigator.of(context).pushNamed(RouteHelper.getLogin());
                _percent = _PROGRESS_PERCENT[0];
                if(result as bool)
                  {
                    Logger.d("result : true");

                    executeMain();
                  }
              }),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(60),
          ),
          BlueTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_foxschool_introduce'],
              onPressed: () {
                Navigator.of(context).pushNamed(RouteHelper.getFoxschoolIntroduce());
              }),
        ],
      ),
    );
  }
}