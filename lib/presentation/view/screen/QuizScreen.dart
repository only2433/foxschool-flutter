
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/controller/quiz/QuizFactoryController.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizTaskNotifier.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizUINotifier.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/quiz/QuizIntroSubScreen.dart';
import 'package:foxschool/presentation/view/widget/QuizTopTitleView.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/values/AppColors.dart';

class QuizScreen extends ConsumerStatefulWidget {

  final String contentID;
  final String title;
  final String subTitle;
  const QuizScreen({
    super.key,
    required this.contentID,
    required this.title,
    required this.subTitle});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState<QuizScreen> {

  late QuizFactoryController _factoryController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    Future.delayed(Duration.zero, () {
      ref.invalidate(quizUINotifierProvider);
    });

    _pageController = PageController(initialPage: 0);
    _factoryController = QuizFactoryController(
        context: context,
        contentsID: widget.contentID,
        pageController: _pageController,
        widgetRef: ref);
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
          await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER),() {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
                    Consumer(builder: (context, ref, child) {
                      final widgetList = ref.watch(quizUINotifierProvider.select((it) => it.widgetList));
                      return PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widgetList.length + 1,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          Logcats.message("state.widgetList.length : ${widgetList.length}");
                          if(index == 0)
                          {
                            return QuizIntroSubScreen(
                                quizController: _factoryController,
                                title: widget.title,
                                subtitle: widget.subTitle);
                          }
                          else
                          {
                            return widgetList[index - 1];
                          }
                        },
                      );
                    }),
                    Consumer(builder: (context, ref, child) {
                      final enableTaskBox = ref.watch(quizUINotifierProvider.select((it) => it.enableTaskbox));
                      if(enableTaskBox)
                        {
                          return _buildTaskboxLayout(context);
                        }
                      else
                        {
                          return Container();
                        }
                    })

                  ],
                ),
              )
            ],
          ),
        )
    );
  }


  Widget _buildTaskboxLayout(BuildContext context)
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
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(136),
                    height: CommonUtils.getInstance(context).getHeight(110),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(5)),
                      child: Consumer(builder: (context, ref, child) {
                        final remainText = ref.watch(quizTaskNotifierProvider.select((it) => it.remainTimeText));
                        return RobotoBoldText(
                          text: remainText,
                          color: AppColors.color_2a4899,
                          fontSize: CommonUtils.getInstance(context).getHeight(46),
                          align: TextAlign.center,
                        );
                      }),
                    ),
                  ),

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
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(136),
                    height: CommonUtils.getInstance(context) .getHeight(110),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(5)),
                      child: Consumer(builder: (context, ref, child) {
                        final correctCount = ref.watch(quizUINotifierProvider.select((it) => it.correctCount));
                        final totalCount = ref.watch(quizUINotifierProvider.select((it) => it.totalCount));

                        Logcats.message("correctCount ---> ${correctCount}, totalCount ---> ${totalCount}");
                        return RobotoBoldText(
                          text: "$correctCount/$totalCount",
                          color: AppColors.color_2a4899,
                          fontSize: CommonUtils.getInstance(context).getHeight(46),
                          align: TextAlign.center,
                        );
                      }),
                    ),
                  )
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
    _pageController.dispose();
    super.dispose();
  }
}


