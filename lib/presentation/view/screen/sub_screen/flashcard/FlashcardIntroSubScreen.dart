import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/FlashcardFactoryController.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/cubit/FlashcardHelpPageCubit.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/cubit/FlashcardOptionSelectCubit.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardHelpPageState.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardOptionSelectState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/presentation/view/widget/HtmlTextWidget.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';

class FlashcardIntroSubScreen extends StatefulWidget {
  final FlashcardFactoryController factoryController;
  final String title;
  final String subTitle;
  const FlashcardIntroSubScreen({
    super.key,
    required this.factoryController,
    required this.title,
    required this.subTitle});

  @override
  State<FlashcardIntroSubScreen> createState() => _FlashcardIntroSubScreenState();
}

class _FlashcardIntroSubScreenState extends State<FlashcardIntroSubScreen> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/image/flashcard_bottom_bg_img01.png',
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(370),
              fit: BoxFit.cover)),

          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder:(context, state) {
            return  AnimatedOpacity(
              duration: const Duration(milliseconds: Common.DURATION_NORMAL),
              opacity: state.isShowHelpPage ? 0.0 : 1.0,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(667),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/image/flashcard_title.png',
                          width: CommonUtils.getInstance(context).getWidth(1110),
                          height: CommonUtils.getInstance(context).getHeight(200),
                          fit: BoxFit.contain),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: CommonUtils.getInstance(context).getHeight(200),
                        child: Column(
                          children: [
                            RobotoBoldText(
                                text: widget.title,
                                fontSize: CommonUtils.getInstance(context).getWidth(52),
                                color: AppColors.color_333333),
                            RobotoNormalText(
                                text: widget.subTitle,
                                fontSize: CommonUtils.getInstance(context).getWidth(42),
                                color: AppColors.color_333333),
                          ],
                        ),
                      ),

                      _buildSelectButtonView(context)
                    ],
                  ),
                ),
              ),
            );
          }),

          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
            return Positioned(
              left: CommonUtils.getInstance(context).getWidth(30),
              top: CommonUtils.getInstance(context).getHeight(30),
              child:GestureDetector(
                onTap: () {

                },
                child: Opacity(
                  opacity: state.isShowHelpPage ? 0.0 : 1.0,
                  child: Image.asset( 'assets/image/btn_flashcard_sound_on.png',
                      width: CommonUtils.getInstance(context).getWidth(84),
                      height: CommonUtils.getInstance(context).getHeight(90),
                      fit: BoxFit.contain),
                ),
              ),
            );
          }),

          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
            return Positioned(
              left: CommonUtils.getInstance(context).getWidth(30),
              top: CommonUtils.getInstance(context).getHeight(30),
              child:GestureDetector(
                onTap: () {
                  widget.factoryController.onHideHelpPage();
                },
                child: Opacity(
                  opacity: state.isShowHelpPage ? 1.0 : 0.0,
                  child: Image.asset('assets/image/btn_flashcard_back.png',
                      width: CommonUtils.getInstance(context).getWidth(84),
                      height: CommonUtils.getInstance(context).getHeight(90),
                      fit: BoxFit.contain),
                ),
              ),
            );
          }),


          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
            return AnimatedPositioned(
                duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                left: state.isShowHelpPage ? 0 : -MediaQuery.of(context).size.width,
                top: CommonUtils.getInstance(context).getHeight(200),
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                    opacity: state.isShowHelpPage ? 1.0 : 0.0,
                    child: _buildHelpImageLayout(context)
                )
            );
          }),

         /* Positioned(
            left: CommonUtils.getInstance(context).getWidth(30),
            top: CommonUtils.getInstance(context).getHeight(132),
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(462),
              height: CommonUtils.getInstance(context).getHeight(98),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/btn_flashcard_sound_off_message_bg.png'),
                  fit: BoxFit.fill
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: CommonUtils.getInstance(context).getWidth(15),
                  top: CommonUtils.getInstance(context).getHeight(20)
                ),
                child: RobotoRegularText(
                  text: getIt<FoxschoolLocalization>().data['message_warning_sound_off'],
                  fontSize: CommonUtils.getInstance(context).getWidth(36),
                  color: AppColors.color_ffffff,
                ),
              ),
            )
          ),*/

          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
            return Positioned(
                left: 0,
                bottom: 0,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                    opacity: state.isShowHelpPage ? 0.0 : 1.0,
                    child: _buildOptionMenuLayout(context))
            );
          }),


          BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
            return Positioned(
              right: CommonUtils.getInstance(context).getWidth(30),
              bottom: CommonUtils.getInstance(context).getHeight(30),
              child: GestureDetector(
                onTap: () {
                  widget.factoryController.onShowHelpPage();
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                  opacity: state.isShowHelpPage ? 0.0 : 1.0,
                  child: Image.asset('assets/image/btn_flashcard_info.png',
                    width: CommonUtils.getInstance(context).getWidth(84),
                    height: CommonUtils.getInstance(context).getHeight(90),
                    fit: BoxFit.contain,),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSelectButtonView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(158),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              widget.factoryController.onClickDefaultStudyWords();
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(456),
              height: CommonUtils.getInstance(context).getHeight(158),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/btn_flashcard_start_bg.png'),
                  fit: BoxFit.contain
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: CommonUtils.getInstance(context).getHeight(20),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(244),
                    height: CommonUtils.getInstance(context).getHeight(55),
                    decoration: BoxDecoration(
                      color: AppColors.color_3581b8,
                      borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))
                    ),
                    alignment: Alignment.center,
                    child: HtmlTextWidget(
                      text: getIt<FoxschoolLocalization>().data['text_study_word'],
                      fontSize: CommonUtils.getInstance(context).getWidth(28),
                    ),
                  ),
                  RobotoNormalText(
                      text: getIt<FoxschoolLocalization>().data['text_start'],
                      fontSize: CommonUtils.getInstance(context).getWidth(46),
                      color: AppColors.color_ffffff)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.factoryController.onClickDefaultStudyMeans();
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(456),
              height: CommonUtils.getInstance(context).getHeight(158),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/btn_flashcard_start_bg02.png'),
                    fit: BoxFit.contain
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: CommonUtils.getInstance(context).getHeight(20),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(244),
                    height: CommonUtils.getInstance(context).getHeight(55),
                    decoration: BoxDecoration(
                        color: AppColors.color_5c42a6,
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))
                    ),
                    alignment: Alignment.center,
                    child: HtmlTextWidget(
                      text: getIt<FoxschoolLocalization>().data['text_study_meaning'],
                      fontSize: CommonUtils.getInstance(context).getWidth(28),
                    ),
                  ),
                  RobotoNormalText(
                      text: getIt<FoxschoolLocalization>().data['text_start'],
                      fontSize: CommonUtils.getInstance(context).getWidth(46),
                      color: AppColors.color_ffffff)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpImageLayout(BuildContext context)
  {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(715),
        alignment: Alignment.center,
        child: Image.asset('assets/image/flashcard_help.png',
          width: CommonUtils.getInstance(context).getWidth(1855),
          height: CommonUtils.getInstance(context).getHeight(715)),
      ),
    );
  }

  Widget _buildOptionMenuLayout(BuildContext context)
  {
    return BlocBuilder<FlashcardOptionSelectCubit, FlashcardOptionSelectState>(builder: (context, state)
    {
      return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: CommonUtils.getInstance(context).getHeight(122),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.factoryController.onCheckAutoPlay();
              },
              child: Image.asset(state.isAutoMode ? 'assets/image/flashcard_select_on.png' : 'assets/image/flashcard_select_off.png',
                  width: CommonUtils.getInstance(context).getWidth(60),
                  height: CommonUtils.getInstance(context).getHeight(60)),
            ),
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(5),
            ),
            RobotoNormalText(
              text: getIt<FoxschoolLocalization>().data['text_flashcard_auto_mode'],
              fontSize: CommonUtils.getInstance(context).getWidth(36),
              color: AppColors.color_444444,
            ),
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(100),
            ),
            GestureDetector(
              onTap: () {
                widget.factoryController.onCheckRandomPlay();
              },
              child: Image.asset(state.isShuffleMode ? 'assets/image/flashcard_select_on.png' : 'assets/image/flashcard_select_off.png',
                  width: CommonUtils.getInstance(context).getWidth(60),
                  height: CommonUtils.getInstance(context).getHeight(60)),
            ),
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(5),
            ),
            RobotoNormalText(
              text: getIt<FoxschoolLocalization>().data['text_flashcard_shuffle_mode'],
              fontSize: CommonUtils.getInstance(context).getWidth(36),
              color: AppColors.color_444444,
            ),
          ],
        ),
      );
    });
  }
}
