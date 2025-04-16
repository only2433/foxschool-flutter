
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/presentation/controller/intro/river_pod/IntroUINotifier.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/IntroScreenType.dart';
import 'package:foxschool/presentation/view/widget/OutlinedTextButton.dart';
import 'package:foxschool/presentation/view/widget/BlueTextButton.dart';
import 'package:foxschool/presentation/view/widget/FrameAnimationView.dart';
import 'package:foxschool/presentation/view/widget/PercentLineProgressBar.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/presentation/controller/intro/IntroFactoryController.dart';
import 'package:foxschool/values/AppColors.dart';



class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}



class IntroScreenState extends ConsumerState<IntroScreen> with WidgetsBindingObserver {
  late IntroFactoryController _factoryController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _factoryController = IntroFactoryController(
        context: context,
        widgetRef: ref);
    _factoryController.init();

  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed)
    {
      // 앱이 활성화될 때 실행할 작업
      _factoryController.onResume();
    } else if (state == AppLifecycleState.paused)
    {
      // 앱이 비활성화될 때 실행할 작업
      _factoryController.onPause();
    }
  }


  @override
  Widget build(BuildContext context) {

    final state = ref.watch(introUINotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.color_47e1ad, AppColors.color_29c8e6],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: CommonUtils.getInstance(context).getHeight(552),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: CommonUtils.getInstance(context).getHeight(300),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/image/intro_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(194),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                        SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(20),
                        ),
                        Image.asset(
                          'assets/image/foxschool_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(620),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                    bottom: 0,
                    child: state.type == IntroScreenType.TYPE_LOGIN_PROGRESS
                        ? _buildProgressLayout(context) : _buildItemSelectLayout(context)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildProgressLayout(BuildContext context) {

    final state = ref.watch(introUINotifierProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(300),
      child: Column(
        children: [
          FrameAnimationView(
              width: CommonUtils.getInstance(context).getWidth(160),
              height: CommonUtils.getInstance(context).getWidth(160),
              duration: const Duration(milliseconds: 70), isStart: true),
          PercentLineProgressBar(
              percent: state.percent,
              width: CommonUtils.getInstance(context).getWidth(888),
              height: CommonUtils.getInstance(context).getWidth(50),
              progressColor: AppColors.color_alpha_white)
        ],
      ),
    );
  }

  Widget _buildItemSelectLayout(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(524),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(5),
          ),
          RobotoNormalText(text: getIt<FoxschoolLocalization>().data['message_intro_foxschool'], fontSize: CommonUtils.getInstance(context).getWidth(34), align: TextAlign.center),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(30),
          ),
          OutlinedTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_login'],
              onPressed: () async {
                await _factoryController.onClickLogin();
              }),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(60),
          ),
          BlueTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_foxschool_introduce'],
              onPressed: () {
                _factoryController.onClickFoxSchoolIntroduce();
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

/*

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>  with WidgetsBindingObserver{
  late IntroFactoryController _factoryController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _factoryController = IntroFactoryController(context: context);
    _factoryController.init();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed)
    {
      // 앱이 활성화될 때 실행할 작업
      _factoryController.onResume();
    } else if (state == AppLifecycleState.paused)
    {
      // 앱이 비활성화될 때 실행할 작업
      _factoryController.onPause();
    }
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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.color_47e1ad, AppColors.color_29c8e6],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
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
                        Image.asset(
                          'assets/image/intro_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(194),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                        SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(20),
                        ),
                        Image.asset(
                          'assets/image/foxschool_logo.png',
                          width: CommonUtils.getInstance(context).getWidth(620),
                          height: CommonUtils.getInstance(context).getHeight(100),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<IntroScreenTypeCubit, ScreenTypeState>(
                    builder: (context, state) {
                      if (state.type == IntroScreenType.TYPE_LOGIN_PROGRESS)
                      {
                        return Positioned(bottom: 0, child: _buildProgressLayout(context));
                      }
                      else
                      {
                        return Positioned(bottom: 0, child: _buildItemSelectLayout(context));
                      }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(300),
      child: Column(
        children: [
          FrameAnimationView(
              width: CommonUtils.getInstance(context).getWidth(160),
              height: CommonUtils.getInstance(context).getWidth(160),
              duration: const Duration(milliseconds: 70), isStart: true),
          BlocBuilder<IntroProgressPercentCubit, IntroProgressPercentState>(
            builder: (context, state) {
              return PercentLineProgressBar(
                  percent: state.percent,
                  width: CommonUtils.getInstance(context).getWidth(888),
                  height: CommonUtils.getInstance(context).getWidth(50),
                  progressColor: AppColors.color_alpha_white);
            },
          )
        ],
      ),
    );
  }

  Widget _buildItemSelectLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(524),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(5),
          ),
          RobotoNormalText(text: getIt<FoxschoolLocalization>().data['message_intro_foxschool'], fontSize: CommonUtils.getInstance(context).getWidth(34), align: TextAlign.center),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(30),
          ),
          OutlinedTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_login'],
              onPressed: () async {
                await _factoryController.onClickLogin();
              }),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(60),
          ),
          BlueTextButton(
              width: CommonUtils.getInstance(context).getWidth(788),
              height: CommonUtils.getInstance(context).getHeight(120),
              text: getIt<FoxschoolLocalization>().data['text_foxschool_introduce'],
              onPressed: () {
                _factoryController.onClickFoxSchoolIntroduce();
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
*/
