
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/FlashcardFactoryController.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/cubit/FlashcardStudyCurrentIndexCubit.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/cubit/FlashcardStudyListUpdateCubit.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardStudyCurrentIndexState.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardStudyListUpdateState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/presentation/view/widget/FlashcardFlipWidget.dart';

class FlashcardStudySubScreen extends StatefulWidget {
  final FlashcardFactoryController factoryController;

  const FlashcardStudySubScreen({
    super.key,

    required this.factoryController});

  @override
  State<FlashcardStudySubScreen> createState() => _FlashcardStudySubScreenState();
}

class _FlashcardStudySubScreenState extends State<FlashcardStudySubScreen> {

  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    widget.factoryController.setStudyPageController(_pageController);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/image/flashcard_bottom_bg_img02.png',
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(414),
                  fit: BoxFit.cover)),
          BlocBuilder<FlashcardStudyListUpdateCubit, FlashcardStudyListUpdateState>(builder: (context, state) {
            return PageView.builder(
              itemCount: state.list.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FlashcardFlipWidget(
                    currentCount: state.list[index].cardNumber,
                    maxCount: state.list.length,
                    word: state.list[index].vocabularyDataResult.wordText,
                    example: state.list[index].vocabularyDataResult.exampleText,
                    mean: state.list[index].vocabularyDataResult.meanText,
                    isBookmark: state.list[index].isBookmark,
                    onCheckBookmark: (isBookmarked) {
                      widget.factoryController.onCheckBookmarkItem(index, isBookmarked);
                    });
              },);
          }),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(150),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(80)),
                child: BlocBuilder<FlashcardStudyCurrentIndexCubit, FlashcardStudyCurrentIndexState>(builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: state.currentIndex == 0 ? 0.2 : 1.0,
                        child: GestureDetector(
                          onTap: () {
                            if(state.currentIndex != 0)
                              {
                                widget.factoryController.onClickPrevButton();
                              }
                          },
                          child: Image.asset('assets/image/flashcard_prev_arrow.png',
                              width: CommonUtils.getInstance(context).getWidth(54),
                              height: CommonUtils.getInstance(context).getHeight(106),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Opacity(
                        opacity: 1.0,
                        child: GestureDetector(
                          onTap:(){
                            widget.factoryController.onClickNextButton();
                          },
                          child: Image.asset('assets/image/flashcard_next_arrow.png',
                              width: CommonUtils.getInstance(context).getWidth(54),
                              height: CommonUtils.getInstance(context).getHeight(106),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }


}
