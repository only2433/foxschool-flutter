
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/flashcard/factory/FlashcardFactoryController.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardConstituteWidgetCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardHelpPageCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardConstituteWidgetState.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardHelpPageState.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/view/screen/sub_screen/flashcard/FlashcardIntroSubScreen.dart';

import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/flashcard/FlashcardDataResult.dart';
import '../../values/AppColors.dart';

class FlashcardScreen extends StatefulWidget {
  final String contentID;
  final VocabularyType type;
  final String title;
  final String subtitle;
  final List<FlashcardDataResult> list;
  const FlashcardScreen({
    super.key,
    this.contentID = "",
    required this.type,
    required this.title,
    this.subtitle = "",
    required this.list});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {

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
        contentID: widget.contentID,
        vocabularyType: widget.type,
        flashcardList: widget.list);
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
          await Future.delayed(Duration(milliseconds: Common.DURATION_SHORTER),() {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
            ));
          },);
        },
        child: Scaffold(
          backgroundColor: AppColors.color_c1f8ff,
          body: Stack(
            children: [

              BlocBuilder<FlashcardConstituteWidgetCubit, FlashcardConstituteWidgetState>(builder: (context, state) {
                return PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    FlashcardIntroSubScreen(
                      factoryController: _factoryController,
                      title: widget.title,
                      subTitle: widget.subtitle,
                    ),
                    ...state.list
                  ],
                );
              }),

              BlocBuilder<FlashcardHelpPageCubit, FlashcardHelpPageState>(builder: (context, state) {
                return Positioned(
                  right: CommonUtils.getInstance(context).getWidth(30),
                  top: CommonUtils.getInstance(context).getHeight(30),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: Common.DURATION_NORMAL),
                    opacity: state.isShowHelpPage ? 0.0 : 1.0,
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
              }),
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
