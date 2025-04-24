
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/presentation/controller/flashcard/FlashcardFactoryController.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardTaskNotifier.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardUINotifier.dart';
import 'package:foxschool/presentation/view/widget/FlashcardFlipWidget.dart';

class FlashcardStudySubScreen extends ConsumerStatefulWidget {
  final FlashcardFactoryController factoryController;

  const FlashcardStudySubScreen({
    super.key,

    required this.factoryController});

  @override
  FlashcardStudySubScreenState createState() => FlashcardStudySubScreenState();
}

class FlashcardStudySubScreenState extends ConsumerState<FlashcardStudySubScreen> {

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
          Consumer(builder: (context, ref, child) {
            final list = ref.watch(flashcardUINotifierProvider.select((value) => value.flashcardItemList));
            return PageView.builder(
                itemCount: list.length,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FlashcardFlipWidget(
                      currentCount: list[index].cardNumber,
                      maxCount: list.length,
                      word: list[index].vocabularyDataResult.wordText,
                      example: list[index].vocabularyDataResult.exampleText,
                      mean: list[index].vocabularyDataResult.meanText,
                      isBookmark: list[index].isBookmark,
                      onCheckBookmark: (isBookmarked) {
                        widget.factoryController.onCheckBookmarkItem(index, isBookmarked);
                      });
                });
          }),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(150),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(80)),
                child: Consumer(builder: (context, ref, child) {
                  final state = ref.watch(flashcardTaskNotifierProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: state.currentStudyPage == 0 ? 0.2 : 1.0,
                        child: GestureDetector(
                          onTap: () {
                            if(state.currentStudyPage != 0)
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
                        opacity: state.currentStudyPage >= state.maxStudyPage - 1 ? 0.2 : 1.0,
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
