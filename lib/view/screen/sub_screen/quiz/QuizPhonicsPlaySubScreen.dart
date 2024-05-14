import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/quiz/QuizFactoryController.dart';
import 'package:foxschool/data/quiz/quiz_data/text/QuizPhonicsTextData.dart';
import 'package:foxschool/data/quiz/quiz_data/text/QuizTextData.dart';
import 'package:foxschool/view/widget/QuizExampleTextWidget.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bloc/quiz/factory/cubit/UserInteractionCubit.dart';
import '../../../../bloc/quiz/factory/state/UserInteractionState.dart';
import '../../../../common/Common.dart';
import '../../../../common/CommonUtils.dart';
import '../../../../common/FoxschoolLocalization.dart';
import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';
import '../../../widget/RobotoBoldText.dart';
import '../../../widget/RobotoNormalText.dart';

class QuizPhonicsPlaySubScreen extends StatefulWidget {
  final QuizFactoryController quizController;
  final QuizPhonicsTextData data;
  final String currentQuizType;
  const QuizPhonicsPlaySubScreen({
    super.key,
    required this.quizController,
    required this.data,
    required this.currentQuizType});

  @override
  State<QuizPhonicsPlaySubScreen> createState() => _QuizPhonicsPlaySubScreenState();
}

class _QuizPhonicsPlaySubScreenState extends State<QuizPhonicsPlaySubScreen> with TickerProviderStateMixin{

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
                _buildCheckAnimationView(context)
              ],
            )
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
              text: '${widget.data.quizIndex + 1}.',
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
              text: getIt<FoxschoolLocalization>().data['message_sound_text_title'],
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: AppColors.color_444444,
            ),
          ),
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
          ),
          widget.currentQuizType != Common.QUIZ_CODE_TEXT ? GestureDetector(
            onTap: () {
              widget.quizController.onClickPlayAudioButton();
            },
            child: Image.asset('asset/image/icon_speaker.png',
                width: CommonUtils.getInstance(context).getWidth(70),
                height: CommonUtils.getInstance(context).getWidth(70),
                fit: BoxFit.cover),
          ) : Container(),
        ],
      ),
    );
  }

  Widget _buildQuestionView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(500),
      child: BlocBuilder<UserInteractionCubit, UserInteractionState>(
          builder: (context, state) {
            return Column(
              children: _getTextExampleItemView(context, state),
            );
          }),
    );
  }

  List<Widget> _getTextExampleItemView(BuildContext context, UserInteractionState state)
  {
    List<Widget> result = [];
    final List<String> INDEX_RESOURCE = [
      'asset/image/icon_index_1.png',
      'asset/image/icon_index_2.png',
      'asset/image/icon_index_3.png',
      'asset/image/icon_index_4.png'
    ];

    double itemTopMargin = 0;

    Logger.d("widget.data.exampleList size : ${widget.data.exampleList.length}");
    if(widget.data.exampleList.length == 3)
    {
      itemTopMargin = CommonUtils.getInstance(context).getHeight(50);
    }
    else
    {
      itemTopMargin = CommonUtils.getInstance(context).getHeight(30);
    }

    for(int i = 0 ; i < widget.data.exampleList.length ; i++)
    {
      final index = i;
      result.add(QuizExampleTextWidget(
          indexImage: INDEX_RESOURCE[index],
          checkImage: _checkImage(index, widget.data.exampleList[i].isAnswer, state),
          text: widget.data.exampleList[index].text,
          onItemPressed: () {
            Logger.d("select : $index, isCorrect : ${widget.data.exampleList[index].isAnswer}");
            if(widget.data.exampleList[index].isAnswer)
            {
              context.read<UserInteractionCubit>().selectTextQuiz(index, true);
            }
            else
            {
              context.read<UserInteractionCubit>().selectTextQuiz(index, false);
            }
           widget.quizController.onSelectPhonicsQuizData(index, widget.data);
          },
          bottomMargin: itemTopMargin)
      );
    }

    return result;
  }

  String _checkImage(int itemIndex, bool isAnswer, UserInteractionState state)
  {
    if(state.isSelectedComplete)
    {
      if(state.isCorrect)
      {
        if(itemIndex == state.textQuizSelectIndex)
        {
          return 'asset/image/icon_check_on.png';
        }
        else
        {
          return 'asset/image/icon_check_off.png';
        }
      }
      else
      {
        if(itemIndex == state.textQuizSelectIndex)
        {
          return 'asset/image/icon_check_on.png';
        }
        else
        {
          if(isAnswer)
          {
            return 'asset/image/icon_check_answer.png';
          }
          else
          {
            return 'asset/image/icon_check_off.png';
          }
        }
      }
    }
    else
    {
      return 'asset/image/icon_check_off.png';
    }
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
                  image: AssetImage('asset/image/btn_quiz_n.png'),
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
                        child: Image.asset(state.isCorrect ? 'asset/image/img_correct.png' : 'asset/image/img_incorrect.png' ,
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
}
