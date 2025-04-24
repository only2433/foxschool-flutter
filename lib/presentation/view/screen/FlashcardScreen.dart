
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataObject.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/controller/flashcard/FlashcardFactoryController.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardUINotifier.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/flashcard/FlashcardIntroSubScreen.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataResult.dart';
import 'package:foxschool/values/AppColors.dart';

class FlashcardScreen extends ConsumerStatefulWidget {
  final FlashcardDataObject flashcardDataObject;
  const FlashcardScreen({
    super.key,
    required this.flashcardDataObject});

  @override
  FlashcardScreenState createState() => FlashcardScreenState();
}

class FlashcardScreenState extends ConsumerState<FlashcardScreen> {

  late FlashcardFactoryController _factoryController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    _pageController = PageController(initialPage: 0);

    _factoryController = FlashcardFactoryController(
        context: context,
        subScreenPageController: _pageController,
        flashcardDataObject: widget.flashcardDataObject,
        widgetRef: ref);
    _factoryController.init();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) async{
          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER),() {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
            ));
          },);
        },
        child: Scaffold(
          backgroundColor: AppColors.color_c1f8ff,
          body: Stack(
            children: [
              Consumer(builder: (context, ref, child) {
                final widgetList = ref.watch(flashcardUINotifierProvider.select((value) => value.pageList));
                return PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if(index == 0)
                      {
                        return FlashcardIntroSubScreen(
                          factoryController: _factoryController,
                          title: widget.flashcardDataObject.title,
                          subTitle: widget.flashcardDataObject.subTitle,
                        );
                      }
                    else
                      {
                        return widgetList[index - 1];
                      }
                  },
                );
              }),
              Consumer(builder: (context, ref, child) {
                final isShowHelpPage = ref.watch(flashcardUINotifierProvider.select((value) => value.isShowHelpPage));
                return Positioned(
                  right: CommonUtils.getInstance(context).getWidth(30),
                  top: CommonUtils.getInstance(context).getHeight(30),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                    opacity: isShowHelpPage ? 0.0 : 1.0,
                    child: GestureDetector(
                      onTap: () {
                        _factoryController.onBackPressed();
                      },
                      child: Image.asset('assets/image/btn_flashcard_close.png',
                          width: CommonUtils.getInstance(context).getWidth(84),
                          height: CommonUtils.getInstance(context).getHeight(90),
                          fit: BoxFit.contain),
                    ),
                  ),
                );
              })
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }
}
