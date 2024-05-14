

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/QuizFactoryController.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizReadyDataCubit.dart';
import 'package:foxschool/bloc/quiz/factory/state/base/QuizBaseState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../../../common/CommonUtils.dart';
import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';

class QuizIntroSubScreen extends StatelessWidget {
  final QuizFactoryController quizController;
  final String title;
  final String subtitle;
  const QuizIntroSubScreen({
    super.key,
    required this.quizController,
    required this.title,
    required this.subtitle});

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<QuizReadyDataCubit, QuizBaseState>(
            buildWhen: (previous, current) => current is LoadedCompleteState,
            builder: (context, state) {
              if(state is LoadedCompleteState)
              {
                return Center(
                  child: GestureDetector(
                    onTap:() {
                      quizController.onClickNextButton();
                    },
                    child: Container(
                      width: CommonUtils.getInstance(context).getWidth(412),
                      height: CommonUtils.getInstance(context).getHeight(120),
                      decoration: BoxDecoration(
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
              else
              {
                return Center(
                  child: SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(70),
                      height: CommonUtils.getInstance(context).getWidth(70),
                      child: CircularProgressIndicator(color: AppColors.color_47e1ad)),
                );
              }

            },)
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
