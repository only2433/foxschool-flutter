
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/presentation/controller/quiz/QuizFactoryController.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizUINotifier.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';

class QuizIntroSubScreen extends ConsumerWidget {
  final QuizFactoryController quizController;
  final String title;
  final String subtitle;
  const QuizIntroSubScreen({
    super.key,
    required this.quizController,
    required this.title,
    required this.subtitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizUINotifierProvider);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_ffffff,
      child: Column(
        children: [
          subtitle == "" ? _buildTitleView(context) : _buildFullTitleView(context),
          Image.asset('assets/image/img_quiz_main.png',
              width: CommonUtils.getInstance(context).getWidth(1920),
              height: CommonUtils.getInstance(context).getHeight(398)
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(30),
          ),
          Consumer(builder: (context, ref, child) {
            if(state.isContentsLoading)
            {
              return Center(
                child: SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(70),
                    height: CommonUtils.getInstance(context).getWidth(70),
                    child: const CircularProgressIndicator(color: AppColors.color_47e1ad)),
              );
            }
            else
            {
              return Center(
                child: GestureDetector(
                  onTap:() {
                    quizController.onClickNextButton();
                  },
                  child: Container(
                    width: CommonUtils.getInstance(context).getWidth(412),
                    height: CommonUtils.getInstance(context).getHeight(120),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/btn_quiz_start_o.png'),
                          fit: BoxFit.contain
                      ),
                    ),
                    alignment: Alignment.center,
                    child: RobotoBoldText(
                      text: getIt<FoxschoolLocalization>().data['text_start'],
                      fontSize: CommonUtils.getInstance(context).getWidth(56),
                      align: TextAlign.center,
                      color: AppColors.color_ffffff,
                    ),
                  ),
                ),
              );
            }
          })
        ],
      ),
    );
  }

  Widget _buildTitleView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(330),
      alignment: Alignment.center,
      child: RobotoBoldText(
        text: title,
        fontSize: CommonUtils.getInstance(context).getWidth(74),
        color: AppColors.color_3b3b3b,
        align: TextAlign.center,
      ),
    );
  }

  Widget _buildFullTitleView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(330),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RobotoBoldText(
            text: title,
            fontSize: CommonUtils.getInstance(context).getWidth(74),
            color: AppColors.color_3b3b3b,
            align: TextAlign.center,
          ),
          RobotoNormalText(
            text: title,
            fontSize: CommonUtils.getInstance(context).getWidth(48),
            color: AppColors.color_444444,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
