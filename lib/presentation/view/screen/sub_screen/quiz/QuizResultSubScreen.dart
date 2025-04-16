import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/Grade.dart';
import 'package:foxschool/presentation/controller/quiz/QuizFactoryController.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizTaskNotifier.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizUINotifier.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';

class QuizResultSubScreen extends ConsumerWidget {
  final QuizFactoryController quizFactoryController;

  const QuizResultSubScreen({
    super.key, required this.quizFactoryController}
      );

  String getResultTitleImagePath(BuildContext context, int quizCorrectCount, int quizTotalCount)
  {
    final grade = CommonUtils.getInstance(context).getMyGrade(quizCorrectCount, quizTotalCount);

    switch(grade)
    {
      case Grade.EXCELLENT:
        return 'assets/image/img_excellent.png';
      case Grade.VERY_GOOD:
        return 'assets/image/img_very_good.png';
      case Grade.GOOD:
        return 'assets/image/img_good.png';
      case Grade.POOL:
        return 'assets/image/img_try_again.png';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final correctCount = ref.watch(quizUINotifierProvider.select((it) => it.correctCount));
    final totalCount = ref.watch(quizUINotifierProvider.select((it) => it.totalCount));
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_ffffff,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(730),
            child: Stack(
              children: [
                Image.asset('assets/image/img_quiz_result_bg.png',
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(276),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(573),
                  top: CommonUtils.getInstance(context).getHeight(21),
                  child: Image.asset(getResultTitleImagePath(context, correctCount, totalCount),
                    width: CommonUtils.getInstance(context).getWidth(774),
                    height: CommonUtils.getInstance(context).getHeight(322),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: CommonUtils.getInstance(context).getWidth(492),
                    top: CommonUtils.getInstance(context).getHeight(417),
                    child: Container(
                      width: CommonUtils.getInstance(context).getWidth(937),
                      height: CommonUtils.getInstance(context).getHeight(127),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/img_quiz_result_box.png'),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(40),
                          ),
                          Image.asset('assets/image/ic_result_correct.png',
                          width: CommonUtils.getInstance(context).getWidth(64),
                          height: CommonUtils.getInstance(context).getHeight(68),
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(20),
                          ),
                          RobotoBoldText(
                              text: getIt<FoxschoolLocalization>().data['text_correct'],
                              fontSize: CommonUtils.getInstance(context).getWidth(48),
                              color: AppColors.color_3b3b3b),
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(570),
                          ),
                          RobotoBoldText(
                              text: '$correctCount',
                              fontSize: CommonUtils.getInstance(context).getWidth(60),
                              color: AppColors.color_4568d8,
                              align: TextAlign.right)
                        ],
                      ),
                    )
                ),
                Positioned(
                    left: CommonUtils.getInstance(context).getWidth(492),
                    top: CommonUtils.getInstance(context).getHeight(564),
                    child: Container(
                      width: CommonUtils.getInstance(context).getWidth(937),
                      height: CommonUtils.getInstance(context).getHeight(127),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_quiz_result_box.png'),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(40),
                          ),
                          Image.asset('assets/image/ic_result_incorrect.png',
                            width: CommonUtils.getInstance(context).getWidth(64),
                            height: CommonUtils.getInstance(context).getHeight(68),
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(20),
                          ),
                          RobotoBoldText(
                              text: getIt<FoxschoolLocalization>().data['text_incorrect'],
                              fontSize: CommonUtils.getInstance(context).getWidth(48),
                              color: AppColors.color_3b3b3b),
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(534),
                          ),
                          RobotoBoldText(
                              text: '${totalCount - correctCount}',
                              fontSize: CommonUtils.getInstance(context).getWidth(60),
                              color: AppColors.color_757575,
                              align: TextAlign.right)
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          _buildButtonView(context, ref)
        ],
      ),
    );
  }

  Widget _buildButtonView(BuildContext context, WidgetRef ref)
  {
    final enableSaveButton = ref.watch(quizUINotifierProvider.select((it) => it.enableAnswerReportButton));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if(enableSaveButton)
              {
                quizFactoryController.onClickSaveScoreButton();
              }
          },
          child: Opacity(
            opacity: enableSaveButton ? 1.0 : 0.2,
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(323),
              height: CommonUtils.getInstance(context).getHeight(92),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/btn_quiz_n.png'),
                      fit: BoxFit.contain
                  )
              ),
              alignment: Alignment.center,
              child: RobotoBoldText(
                text: getIt<FoxschoolLocalization>().data['text_savescore'],
                fontSize: CommonUtils.getInstance(context).getWidth(40),
                color: AppColors.color_000000,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            quizFactoryController.onClickReplayButton();
          },
          child: Container(
            width: CommonUtils.getInstance(context).getWidth(323),
            height: CommonUtils.getInstance(context).getHeight(92),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/btn_quiz_n.png'),
                    fit: BoxFit.contain
                )
            ),
            alignment: Alignment.center,
            child: RobotoBoldText(
              text: getIt<FoxschoolLocalization>().data['text_tryagain'],
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: AppColors.color_000000,
            ),
          ),
        )
      ],
    );
  }


}

