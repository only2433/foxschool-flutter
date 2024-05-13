import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/QuizFactoryController.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizCorrectCountCubit.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizCorrectCountState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';

import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';

class QuizResultSubScreen extends StatelessWidget {
  final QuizFactoryController quizFactoryController;
  const QuizResultSubScreen({
    super.key, required this.quizFactoryController}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_ffffff,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(730),
            child: Stack(
              children: [
                Image.asset('asset/image/img_quiz_result_bg.png',
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(276),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: CommonUtils.getInstance(context).getWidth(573),
                  top: CommonUtils.getInstance(context).getHeight(21),
                  child: Image.asset('asset/image/img_excellent.png',
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/image/img_quiz_result_box.png'),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(40),
                          ),
                          Image.asset('asset/image/ic_result_correct.png', 
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
                          BlocBuilder<QuizCorrectCountCubit, QuizCorrectCountState>(builder: (context, state) {
                            return RobotoBoldText(
                                text: '${state.correctCount}',
                                fontSize: CommonUtils.getInstance(context).getWidth(60),
                                color: AppColors.color_4568d8,
                                align: TextAlign.right);
                          })
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/image/img_quiz_result_box.png'),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: CommonUtils.getInstance(context).getWidth(40),
                          ),
                          Image.asset('asset/image/ic_result_incorrect.png',
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
                          BlocBuilder<QuizCorrectCountCubit, QuizCorrectCountState>(builder: (context, state) {
                            return RobotoBoldText(
                                text: '${state.totalCount - state.correctCount}',
                                fontSize: CommonUtils.getInstance(context).getWidth(60),
                                color: AppColors.color_757575,
                                align: TextAlign.right);
                          })
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          _buildButtonView(context)
        ],
      ),
    );
  }

  Widget _buildButtonView(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: CommonUtils.getInstance(context).getWidth(323),
          height: CommonUtils.getInstance(context).getHeight(92),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/btn_quiz_n.png'),
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
        Container(
          width: CommonUtils.getInstance(context).getWidth(323),
          height: CommonUtils.getInstance(context).getHeight(92),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/image/btn_quiz_n.png'),
                  fit: BoxFit.contain
              )
          ),
          alignment: Alignment.center,
          child: RobotoBoldText(
            text: getIt<FoxschoolLocalization>().data['text_tryagain'],
            fontSize: CommonUtils.getInstance(context).getWidth(40),
            color: AppColors.color_000000,
          ),
        )
      ],
    );
  }
}
