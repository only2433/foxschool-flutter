import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/flashcard/factory/FlashcardFactoryController.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardBookmarkOptionSelectCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardStudyListUpdateCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardBookmarkOptionSelectState.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardStudyListUpdateState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/FlashcardBookmarkItemWidget.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../../../bloc/flashcard/factory/cubit/FlashcardOptionSelectCubit.dart';
import '../../../../bloc/flashcard/factory/state/FlashcardOptionSelectState.dart';
import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';
import '../../../widget/HtmlTextWidget.dart';

class FlashcardBookmarkSubScreen extends StatelessWidget {
  final FlashcardFactoryController factoryController;
  const FlashcardBookmarkSubScreen({
    super.key,
    required this.factoryController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [

          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(414),
              child: Image.asset('assets/image/flashcard_bottom_bg_img02.png',
                width: CommonUtils.getInstance(context).getWidth(1920),
                height: CommonUtils.getInstance(context).getHeight(414),
                fit: BoxFit.fill,),
            ),
          ),
          Column(
            children: [
              _buildTitleView(context),
              Center(
                child: Container(
                  width: CommonUtils.getInstance(context).getWidth(1702),
                  height: CommonUtils.getInstance(context).getHeight(510),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/flashcard_bookmark_list_bg.png'),
                      fit: BoxFit.fill
                    )
                  ),
                  child: BlocBuilder<FlashcardStudyListUpdateCubit, FlashcardStudyListUpdateState>(builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(20)),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: CommonUtils.getInstance(context).getWidth(10),
                            crossAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                            mainAxisExtent: CommonUtils.getInstance(context).getHeight(178)
                        ),
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return FlashcardBookmarkItemWidget(
                            wordText: state.list[index].vocabularyDataResult.wordText,
                            isBookmarked: state.list[index].isBookmark,
                            onCheckBookmark: () {
                              bool isBookmark = !state.list[index].isBookmark;
                              Logger.d("index :$index, isBookmark : $isBookmark");
                              factoryController.onCheckBookmarkItem(index, isBookmark);
                          },);
                        },),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: CommonUtils.getInstance(context).getHeight(20),
              ),
              _buildSelectButtonView(context),

            ],
          ),
          Positioned(
              left: 0,
              bottom: 0,
              child: _buildOptionMenuLayout(context))
        ]),
    );
  }

  Widget _buildTitleView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(230),

      child: Stack(
        children: [
          Positioned(
            left: CommonUtils.getInstance(context).getWidth(636),
            bottom: CommonUtils.getInstance(context).getHeight(20),
            child: Image.asset('assets/image/flashcard_bookmark_title.png',
                width: CommonUtils.getInstance(context).getWidth(648),
                height: CommonUtils.getInstance(context).getHeight(62),
                fit: BoxFit.contain),
          ),
          Positioned(
            top: CommonUtils.getInstance(context).getHeight(137),
            right: CommonUtils.getInstance(context).getWidth(80),
            child: Row(
              children: [
                Container(
                  width: CommonUtils.getInstance(context).getWidth(148),
                  height: CommonUtils.getInstance(context).getHeight(74),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/flashcard_bookmark_count_bg.png'),
                      fit: BoxFit.contain
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/flashcard_bookmark_on.png',
                        width: CommonUtils.getInstance(context).getWidth(30),
                        height: CommonUtils.getInstance(context).getHeight(30),
                        fit: BoxFit.contain),
                      SizedBox(
                        width: CommonUtils.getInstance(context).getWidth(30),
                      ),
                      RobotoNormalText(
                          text: '0',
                          fontSize: CommonUtils.getInstance(context).getWidth(30),
                          color: AppColors.color_444444)
                    ],
                  ),
                ),
                Container(
                  width: CommonUtils.getInstance(context).getWidth(350),
                  height: CommonUtils.getInstance(context).getHeight(76),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/flashcard_btn_bg_03.png'),
                          fit: BoxFit.contain
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/flashcard_icon_voca.png',
                          width: CommonUtils.getInstance(context).getWidth(45),
                          height: CommonUtils.getInstance(context).getHeight(30),
                          fit: BoxFit.contain),
                      SizedBox(
                        width: CommonUtils.getInstance(context).getWidth(5),
                      ),
                      RobotoNormalText(
                          text: getIt<FoxschoolLocalization>().data['text_save_my_books'],
                          fontSize: CommonUtils.getInstance(context).getWidth(24),
                          color: AppColors.color_ffffff)
                    ],
                  ),
                ),
              ],
            ),
          )
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
              factoryController.onClickBookmarkStudyWords();
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(456),
              height: CommonUtils.getInstance(context).getHeight(158),
              decoration: BoxDecoration(
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
              factoryController.onClickBookmarkStudyMeans();
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(456),
              height: CommonUtils.getInstance(context).getHeight(158),
              decoration: BoxDecoration(
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

  Widget _buildOptionMenuLayout(BuildContext context)
  {
    return BlocBuilder<FlashcardBookmarkOptionSelectCubit, FlashcardBookmarkOptionSelectState>(builder: (context, state)
    {
      return Container(
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
                factoryController.onCheckBookmarkAutoPlay();
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
                factoryController.onCheckBookmarkRandomPlay();
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
