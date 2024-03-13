
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/event/GetSchoolDataEvent.dart';
import 'package:foxschool/bloc/intro/event/GetVersionEvent.dart';
import 'package:foxschool/bloc/intro/state/AuthMeLoadedState.dart';
import 'package:foxschool/bloc/intro/state/MainInformationLoadedState.dart';
import 'package:foxschool/bloc/intro/state/SchoolDataLoadedState.dart';
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
import '../dialog/LoadingDialog.dart' as LoadingDialog;

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
  late StreamSubscription _subscription;
  double _percent = 0;
  bool _isLogin = false;
  @override
  void initState()
  {
    super.initState();
    _percent = 0;

  }

  void settingSubscriptions()
  {
    var blocState;
    _subscription = context.read<IntroBloc>().stream.listen((state) {
      switch(state.runtimeType)
      {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case VersionLoadedState:
          blocState = state as VersionLoadedState;
          Logger.d("LoadedState : ${blocState.data.toString()}");
          break;
        case AuthMeLoadedState:
          blocState = state as AuthMeLoadedState;
          Logger.d("LoadedState : ${blocState.data.toString()}");
          break;
        case MainInformationLoadedState:
          blocState = state as MainInformationLoadedState;
          Logger.d("LoadedState : ${blocState.data.toString()}");
          break;
        case ErrorState:
          blocState = state as ErrorState;
          LoadingDialog.dismiss(context);
          CommonUtils.getInstance(context).showErrorMessage(blocState.message);
          break;
      }

    });
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
          GestureDetector(
            onTap: () {
              setState(() {
                _percent = 50;
                Logger.d("_percent : ${_percent}");
              });
            },
            child: PercentLineProgressBar(
                percent: _percent,
                width: CommonUtils.getInstance(context).getWidth(888),
                height: CommonUtils.getInstance(context).getWidth(50),
                progressColor: AppColors.color_alpha_white),
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

                if(result as bool)
                  {
                    Logger.d("result : true");
                    setState(() {
                      _isLogin = true;
                    });
                    //context.read<IntroBloc>().add(
                        //GetVersionEvent(
                       //     deviceType: deviceType,
                       //     pushAddress: pushAddress,
                       //     pushOn: pushOn)
                    //);
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