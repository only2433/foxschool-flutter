
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/quiz/QuizFactoryController.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizConstituteWidgetCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizEnableTaskboxCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizCorrectCountCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizRemainTimeCubit.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizEnableTaskboxState.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizCorrectCountState.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizRemainTimeState.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizIntroSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizPicturePlaySubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizResultSubScreen.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../bloc/quiz/factory/state/QuizConstituteWidgetState.dart';
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
import '../widget/QuizTopTitleView.dart';
import '../widget/RobotoBoldText.dart';
import '../widget/TopTitleView.dart';

class QuizScreen extends StatefulWidget {
  final String contentID;
  final String title;
  final String subTitle;
  const QuizScreen({
    super.key,
    required this.contentID,
    required this.title,
    required this.subTitle});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late QuizFactoryController _factoryController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    _pageController = PageController(initialPage: 0);
    _factoryController = QuizFactoryController(
        context: context,
        contentID: widget.contentID,
        pageController: _pageController);
    _factoryController.init();

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) async {

          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          await Future.delayed(Duration(milliseconds: Common.DURATION_SHORTER),() {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
            ));
          },);

        },
        child: Scaffold(
          backgroundColor: AppColors.color_ffffff,
          body: Column(
            children: [
              QuizTopTitleView(
                onPressed: () {
                  _factoryController.onBackPressed();
                },
              ),
              Expanded(
                child: Stack(
                  children: [
                    BlocBuilder<QuizConstituteWidgetCubit, QuizConstituteWidgetState>(
                      builder: (context, state) {
                        return PageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            // 기존에 있던 화면인 QuizIntroScreen을 추가
                            QuizIntroSubScreen(
                                quizController: _factoryController,
                                title: widget.title,
                                subtitle: widget.subTitle),
                            // 추가된 화면들을 추가
                            ...state.list
                          ],
                        );
                      },),
                    BlocBuilder<QuizEnableTaskboxCubit, QuizEnableTaskboxState>(builder: (context, state) {
                      if(state.isEnable)
                      {
                        return _buildTaskboxLayout();
                      }
                      else
                      {
                        return Container();
                      }
                    },),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _buildTaskboxLayout()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(110),
      color: AppColors.color_ffffff,
      child: Stack(
        children: [
          Positioned(
              left: CommonUtils.getInstance(context).getWidth(1226),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(47),
                    height: CommonUtils.getInstance(context).getHeight(110),
                    alignment: Alignment.center,
                    child: Image.asset('assets/image/icon_time.png',
                      width: CommonUtils.getInstance(context).getWidth(47),
                      height: CommonUtils.getInstance(context).getHeight(48),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(10),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(100),
                    height: CommonUtils.getInstance(context).getHeight(110),
                    alignment: Alignment.center,
                    child: RobotoNormalText(
                        text: 'Time',
                        fontSize: CommonUtils.getInstance(context).getWidth(40),
                        color: AppColors.color_444444,
                        align: TextAlign.center,),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(10),
                  ),
                  BlocBuilder<QuizRemainTimeCubit, QuizRemainTimeState>(builder: (context, state) {
                    return Container(
                      width: CommonUtils.getInstance(context).getWidth(136),
                      height: CommonUtils.getInstance(context).getHeight(110),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(5)),
                        child: RobotoBoldText(
                          text: state.time,
                          color: AppColors.color_2a4899,
                          fontSize: CommonUtils.getInstance(context).getHeight(46),
                          align: TextAlign.center,
                        ),
                      ),
                    );
                  }),

                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(20),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(47),
                    height: CommonUtils.getInstance(context).getHeight(110),
                    alignment: Alignment.center,
                    child: Image.asset('assets/image/icon_question.png',
                      width: CommonUtils.getInstance(context).getWidth(47),
                      height: CommonUtils.getInstance(context).getHeight(48),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(10),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(120),
                    height: CommonUtils.getInstance(context).getHeight(110),
                    alignment: Alignment.center,
                    child: RobotoNormalText(
                      text: 'Score',
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      color: AppColors.color_444444,
                      align: TextAlign.center,),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(10),
                  ),
                  BlocBuilder<QuizCorrectCountCubit, QuizCorrectCountState>(builder: (context, state) {
                    return Container(
                      width: CommonUtils.getInstance(context).getWidth(136),
                      height: CommonUtils.getInstance(context).getHeight(110),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(5)),
                        child: RobotoBoldText(
                          text: "${state.correctCount}/${state.totalCount}",
                          color: AppColors.color_2a4899,
                          fontSize: CommonUtils.getInstance(context).getHeight(46),
                          align: TextAlign.center,
                        ),
                      ),
                    );
                  })
                ],
              )
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }
}
