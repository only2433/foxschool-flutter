import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/quiz/quiz_data/text/QuizPhonicsTextData.dart';
import 'package:foxschool/presentation/controller/quiz/QuizFactoryController.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizUINotifier.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/data/QuizUIState.dart';
import 'package:foxschool/presentation/view/widget/QuizExampleTextWidget.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';

class QuizPhonicsPlaySubScreen extends ConsumerStatefulWidget {
  final QuizFactoryController quizController;
  final QuizPhonicsTextData data;
  final String currentQuizType;
  const QuizPhonicsPlaySubScreen({
    super.key,
    required this.quizController,
    required this.data,
    required this.currentQuizType});

  @override
  QuizPhonicsPlaySubScreenState createState() => QuizPhonicsPlaySubScreenState();
}

class QuizPhonicsPlaySubScreenState extends ConsumerState<QuizPhonicsPlaySubScreen> with TickerProviderStateMixin{


  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
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
        duration: const Duration(milliseconds: Common.DURATION_NORMAL)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
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
            child: Image.asset('assets/image/icon_speaker.png',
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(500),
      child: Column(
        children: _getTextExampleItemView(context)
      )
    );
  }

  List<Widget> _getTextExampleItemView(BuildContext context)
  {
    List<Widget> result = [];
    final List<String> indexResource = [
      'assets/image/icon_index_1.png',
      'assets/image/icon_index_2.png',
      'assets/image/icon_index_3.png',
      'assets/image/icon_index_4.png'
    ];
    final state = ref.watch(quizUINotifierProvider);
    double itemTopMargin = 0;
    Logcats.message("widget.data.exampleList size : ${widget.data.exampleList.length}");

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
          indexImage: indexResource[index],
          checkImage: _checkImage(index, widget.data.exampleList[i].isAnswer, state),
          text: widget.data.exampleList[index].text,
          onItemPressed: () {
            Logcats.message("select : $index, isCorrect : ${widget.data.exampleList[index].isAnswer}");
            widget.quizController.onPlayCorrectSound(widget.data.exampleList[index].isAnswer);
            widget.quizController.onSelectPhonicsQuizData(index, widget.data, widget.data.exampleList[index].isAnswer);
          },
          bottomMargin: itemTopMargin)
      );
    }

    return result;
  }

  String _checkImage(int itemIndex, bool isAnswer, QuizUIState state)
  {
    final interactionState = state.userInteractionState;
    if(interactionState.isSelectedComplete)
    {
      if(interactionState.isCorrect)
      {
        if(itemIndex == interactionState.textQuizSelectIndex)
        {
          return 'assets/image/icon_check_on.png';
        }
        else
        {
          return 'assets/image/icon_check_off.png';
        }
      }
      else
      {
        if(itemIndex == interactionState.textQuizSelectIndex)
        {
          return 'assets/image/icon_check_on.png';
        }
        else
        {
          if(isAnswer)
          {
            return 'assets/image/icon_check_answer.png';
          }
          else
          {
            return 'assets/image/icon_check_off.png';
          }
        }
      }
    }
    else
    {
      return 'assets/image/icon_check_off.png';
    }
  }

  Widget _buildNextButtonView(BuildContext context)
  {
    final state = ref.watch(quizUINotifierProvider);
    final userInteractData = state.userInteractionState;
    return Center(
      child: Opacity(
        opacity: userInteractData.isSelectedComplete ? 1.0 : 0.3,
        child: GestureDetector(
          onTap: () {
            if(userInteractData.isSelectedComplete)
            {
              widget.quizController.onClickNextButton();
            }
          },
          child: Container(
            width: CommonUtils.getInstance(context).getWidth(323),
            height: CommonUtils.getInstance(context).getHeight(92),
            decoration: const BoxDecoration(
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
  }

  Widget _buildCheckAnimationView(BuildContext context)
  {
    final state = ref.watch(quizUINotifierProvider);
    final userInteractData = state.userInteractionState;

    if(userInteractData.isSelectedComplete)
    {
      _animationController.reset();
      _animationController.forward();
    }

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
                    opacity: userInteractData.isSelectedComplete ? 1.0 : 0.0,
                    child: Image.asset(userInteractData.isCorrect ? 'assets/image/img_correct.png' : 'assets/image/img_incorrect.png' ,
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
