
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/intro/event/GetSchoolDataEvent.dart';
import 'package:foxschool/bloc/intro/event/GetVersionEvent.dart';
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
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

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
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();
  double _percent = 0;
  bool _isFrameAnimation = false;
  bool _isLogin = false;
  @override
  void initState()
  {
    super.initState();
    _percent = 0;
    _isFrameAnimation = false;
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
                  top: CommonUtils.getInstance(context).getHeight(200),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: CommonUtils.getInstance(context).getHeight(300),
                    child: Column(
                      children: [
                        Image.asset('asset/image/intro_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(80),
                          height: CommonUtils.getInstance(context).getHeight(40),
                        ),
                        SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(10),
                        ),
                        Image.asset('asset/image/foxschool_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(230),
                          height: CommonUtils.getInstance(context).getHeight(50),
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
      height: CommonUtils.getInstance(context).getHeight(130),
      child: Column(
        children: [

          GestureDetector(
            onTap: () {
              setState(() {
                _isFrameAnimation = !_isFrameAnimation;
                Logger.d("isFrameAnimation : ${_isFrameAnimation}");
              });
            },
            child: FrameAnimationView(
                width: CommonUtils.getInstance(context).getWidth(80),
                height: CommonUtils.getInstance(context).getWidth(80),
                duration: Duration(
                  milliseconds: 70
                ),
                isStart: _isFrameAnimation
            ),
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
                width: CommonUtils.getInstance(context).getWidth(300),
                height: CommonUtils.getInstance(context).getWidth(25),
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
      height: CommonUtils.getInstance(context).getHeight(200),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(5),
          ),
          Text(getIt<FoxschoolLocalization>().data['message_intro_foxschool'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: CommonUtils.getInstance(context).getWidth(15),
              fontFamily: 'Roboto',
              color: Colors.white
            ),
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(15),
          ),
          BlueOutlinedTextButton(
              width: CommonUtils.getInstance(context).getWidth(300),
              height: CommonUtils.getInstance(context).getHeight(50),
              text: getIt<FoxschoolLocalization>().data['text_login'],
              onPressed: (){
                Navigator.of(context).pushNamed(RouteHelper.getLogin());
              }),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(20),
          ),
          BlueTextButton(
              width: CommonUtils.getInstance(context).getWidth(300),
              height: CommonUtils.getInstance(context).getHeight(50),
              text: getIt<FoxschoolLocalization>().data['text_foxschool_introduce'],
              onPressed: () async{
                Navigator.of(context).pushNamed(RouteHelper.getFoxschoolIntroduce());
               /* context.read<IntroBloc>().add(
                    GetVersionEvent(
                        deviceType: deviceID,
                        pushAddress: "",
                        pushOn: 'Y')
                );
                context.read<IntroBloc>().add(
                  GetSchoolDataEvent()
                );*/
              }),
          BlocListener<IntroBloc, BlocState>(listener: (context, state) {
              if(state is VersionLoadedState)
                {
                  Logger.d("VersionLoadedState Loaded : ${state.data.toString()}");
                }
              else if(state is SchoolDataLoadedState)
                {
                  Logger.d("SchoolDataLoadedState Loaded : ${state.data.toString()}");
                }
              else if(state is LoadingState)
                {
                  Logger.d("Loading....");
                }
              else if(state is ErrorState)
                {
                  Logger.d("Error : ${state.message}");
                }
            },
            child: Container(),
          )
        ],
      ),
    );
  }
}