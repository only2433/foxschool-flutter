

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/UserInteractionCubit.dart';
import 'package:foxschool/bloc/quiz/factory/state/UserInteractionState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../../../bloc/quiz/QuizFactoryController.dart';
import '../../../../common/Common.dart';
import '../../../../common/CommonUtils.dart';
import '../../../../data/quiz/quiz_data/picture/QuizPictureData.dart';
import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';
import 'package:image/image.dart' as img;

class QuizPicturePlayScreen extends StatefulWidget {
  final QuizFactoryController quizController;
  final QuizPictureData data;
  const QuizPicturePlayScreen({
    super.key,
    required this.quizController,
    required this.data});

  @override
  State<QuizPicturePlayScreen> createState() => _QuizPicturePlayScreenState();
}

class _QuizPicturePlayScreenState extends State<QuizPicturePlayScreen> with TickerProviderStateMixin{

  late UserInteractionCubit _userInteractionCubit; // Cubit 인스턴스 선언
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  
  @override
  void initState() {
    super.initState();
    _userInteractionCubit = UserInteractionCubit();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initRotationAnimation();
  }
  
  void _initRotationAnimation()
  {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Common.DURATION_NORMAL)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _userInteractionCubit,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_ffffff,
        child: Column(
          children: [
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(110),
            ),
            Stack(
              children: [
                Column(
                  children: [
                    _buildTitleView(context),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: CommonUtils.getInstance(context).getHeight(2),
                      color: AppColors.color_ceddec,
                    ),
                    SizedBox(
                      height: CommonUtils.getInstance(context).getHeight(50),
                    ),
                    _buildQuestionView(context),
                    _buildNextButtonView(context)
                  ],
                ),
                Positioned(
                    left:0,
                    top: CommonUtils.getInstance(context).getHeight(209),
                    child: _buildQuestionBackgroundView(context)
                ),
                _buildCheckAnimationView(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(157),
      color: AppColors.color_eff4f6,
      child: Row(
        children: [
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(80),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(100),
            height: CommonUtils.getInstance(context).getHeight(100),
            alignment: Alignment.centerRight,
            child: RobotoBoldText(
              text: '${widget.data.currentQuizIndex + 1}.',
              fontSize: CommonUtils.getInstance(context).getWidth(45),
              color: AppColors.color_444444,
            ),
          ),
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(20),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(1380),
            height: CommonUtils.getInstance(context).getHeight(100),
            alignment: Alignment.centerLeft,
            child: RobotoNormalText(
              text: widget.data.title,
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: AppColors.color_444444,
            ),
          ),
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
          ),
          GestureDetector(
            onTap: () {
              widget.quizController.onClickPlayAudioButton();
            },
            child: Image.asset('assets/image/icon_speaker.png',
                width: CommonUtils.getInstance(context).getWidth(70),
                height: CommonUtils.getInstance(context).getWidth(70),
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: CommonUtils.getInstance(context).getWidth(545),
            height: CommonUtils.getInstance(context).getHeight(410),
            padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(10)),
            child: Image.memory(
              Uint8List.fromList(
                  img.encodePng(widget.data.exampleList[0].image)),
              width: CommonUtils.getInstance(context).getWidth(545),
              height: CommonUtils.getInstance(context).getHeight(410),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(100),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(545),
            height: CommonUtils.getInstance(context).getHeight(410),
            padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(10)),
            child: Image.memory(
              Uint8List.fromList(
                  img.encodePng(widget.data.exampleList[1].image)),
              width: CommonUtils.getInstance(context).getWidth(545),
              height: CommonUtils.getInstance(context).getHeight(410),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionBackgroundView(BuildContext context)
  {
    return BlocBuilder<UserInteractionCubit, UserInteractionState>(builder: (context, state) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if(state.isSelectedComplete)
                {
                  return;
                }

                Logger.d("isSelected 0");
                if(widget.data.exampleList[0].isAnswer)
                {
                  context.read<UserInteractionCubit>().selectPictureQuiz(0, true);
                }
                else
                {
                  context.read<UserInteractionCubit>().selectPictureQuiz(0, false);
                }
                widget.quizController.onPlayCorrectSound(widget.data.exampleList[0].isAnswer);
                widget.quizController.onSelectPictureQuizData(0, widget.data);
              },
              child: Container(
                width: CommonUtils.getInstance(context).getWidth(545),
                height: CommonUtils.getInstance(context).getHeight(410),
                padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(10)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.isSelectedComplete && state.pictureQuizSelectIndex == 0 ? AppColors.color_ffa531 : Colors.transparent,
                    width: CommonUtils.getInstance(context).getWidth(10)
                  )
                ),
              ),
            ),
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(100),
            ),
            GestureDetector(
              onTap: () {

                if(state.isSelectedComplete)
                {
                  return;
                }

                Logger.d("isSelected 1");
                if(widget.data.exampleList[1].isAnswer)
                {
                  context.read<UserInteractionCubit>().selectPictureQuiz(1, true);
                }
                else
                {
                  context.read<UserInteractionCubit>().selectPictureQuiz(1, false);
                }
                widget.quizController.onPlayCorrectSound(widget.data.exampleList[1].isAnswer);
                widget.quizController.onSelectPictureQuizData(1, widget.data);
              },
              child: Container(
                width: CommonUtils.getInstance(context).getWidth(545),
                height: CommonUtils.getInstance(context).getHeight(410),
                padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(10)),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: state.isSelectedComplete && state.pictureQuizSelectIndex == 1 ? AppColors.color_ffa531 : Colors.transparent,
                        width: CommonUtils.getInstance(context).getWidth(10)
                    )
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNextButtonView(BuildContext context)
  {
    return BlocBuilder<UserInteractionCubit, UserInteractionState>(builder: (context, state) {
      return Center(
        child: Opacity(
          opacity: state.isSelectedComplete ? 1.0 : 0.3,
          child: GestureDetector(
            onTap: () {
              if(state.isSelectedComplete)
                {
                  widget.quizController.onClickNextButton();
                }
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(323),
              height: CommonUtils.getInstance(context).getHeight(92),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/btn_quiz_n.png'),
                    fit: BoxFit.contain,
                ),
              ),
              alignment: Alignment.center,
              child: RobotoBoldText(
                text: getIt<FoxschoolLocalization>().data['text_next'],
                fontSize: CommonUtils.getInstance(context).getWidth(47),
                color: AppColors.color_000000,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCheckAnimationView(BuildContext context)
  {
    return BlocConsumer<UserInteractionCubit, UserInteractionState>(
      listener: (context, state) {
        if(state.isSelectedComplete)
          {
            _animationController.reset();
            _animationController.forward();
          }
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(110),
            ),
            Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(_animationController.value * 2 * 3.14159),
                      child: Opacity(
                        opacity: state.isSelectedComplete ? 1.0 : 0.0,
                        child: Image.asset(state.isCorrect ? 'assets/image/img_correct.png' : 'assets/image/img_incorrect.png' ,
                            width: CommonUtils.getInstance(context).getWidth(436),
                            height: CommonUtils.getInstance(context).getHeight(419),
                            fit: BoxFit.contain
                        ),
                      ),
                    );
                  },
                )
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
