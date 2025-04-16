import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';

import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/model/movie/intent_data/PlayerIntentParamsObject.dart';
import 'package:foxschool/presentation/controller/movie/MovieFactoryController.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/MovieTaskNotifier.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/MovieUINotifier.dart';
import 'package:foxschool/presentation/view/widget/ContentsListItemView.dart';
import 'package:foxschool/presentation/view/widget/HtmlTextWidget.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:video_player/video_player.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';


class MoviePlayerScreen extends ConsumerStatefulWidget {

  final PlayerIntentParamsObject playerIntentParamsObject;
  const MoviePlayerScreen({super.key,
    required this.playerIntentParamsObject}
      );

  @override
  MoviePlayerScreenState createState() => MoviePlayerScreenState();
}

class MoviePlayerScreenState extends ConsumerState<MoviePlayerScreen> with TickerProviderStateMixin  {
  late MovieFactoryController _factoryController;
  late AnimationController _aniPlayCompleteController;
  late Animation<double> _playCompleteAnimation;

  late AnimationController _aniMenuController;
  late Animation<double> _menuAnimation;

  late AnimationController _aniCaptionController;
  late Animation<double> _captionAnimation;
  late Animation<double> _captionBottomAnimation;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initPlayCompleteAnimation(); // 애니메이션 초기화 메서드 호출
    _initMenuAnimation();
    _initCaptionAnimation();
  }

  @override
  void initState() {
    super.initState();
    _factoryController = MovieFactoryController(
        context: context,
        playerIntentParamsObject: widget.playerIntentParamsObject,
        widgetRef: ref);
    _factoryController.init();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

  }

  void _initPlayCompleteAnimation() {
    _aniPlayCompleteController = AnimationController(
      duration: const Duration(milliseconds: Common.DURATION_NORMAL), // 애니메이션 지속 시간
      vsync: this,
    );

    _playCompleteAnimation = Tween<double>(
      begin: -CommonUtils.getInstance(context).getHeight(552), // 시작값 (화면 위쪽으로 이동)
      end: 0, // 끝값 (화면 아래쪽으로 이동)
    ).animate(_aniPlayCompleteController);
  }

  void _initMenuAnimation() {
    _aniMenuController = AnimationController(
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        vsync: this);
    final curvedAnimation = CurvedAnimation(
      parent: _aniMenuController,
      curve: Curves.fastOutSlowIn,
    );
    _menuAnimation = Tween<double>(
      begin: -CommonUtils.getInstance(context).getHeight(100),
      end: CommonUtils.getInstance(context).getHeight(30)
    ).animate(curvedAnimation);
  }

  void _initCaptionAnimation()
  {
    _aniCaptionController = AnimationController(
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        vsync: this);

    _captionAnimation = Tween<double>(
        begin: -CommonUtils.getInstance(context).getHeight(112),
        end: 0
    ).animate(_aniCaptionController);

    _captionBottomAnimation = Tween<double>(
        begin: -CommonUtils.getInstance(context).getHeight(180),
        end: 0
    ).animate(_aniCaptionController);
  }

  @override
  Widget build(BuildContext context) {
    Logcats.message("-- build ---");
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.color_000000,
        body: OrientationBuilder(
          builder: (context, orientation) {
            //Logcats.message("orientation : $orientation");
            if(orientation == Orientation.portrait)
              {
                return _buildPortraitLayout();
              }
            else
              {
                return _buildLandscapeLayout();
              }
          },
        )
      ),
    );
  }

  // Portrait
  Widget _buildPortraitLayout()
  {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(757),
            child: Stack(
              children: [
                Consumer(builder: (context, ref, child) {
                  final isMovieLoading = ref.watch(movieUINotifierProvider.select((it) => it.isMovieLoading));
                  final videoController = ref.watch(movieUINotifierProvider.select((it) => it.movieController));
                  if(isMovieLoading)
                    {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: CommonUtils.getInstance(context).getHeight(552),
                        color: AppColors.color_000000,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.color_47e1ad,
                          ),
                        ),
                      );
                    }
                  else
                    {
                      if(videoController != null)
                        {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: CommonUtils.getInstance(context).getHeight(552),
                            child: VideoPlayer(videoController),
                          );
                        }
                      else
                        {
                          return Container();
                        }
                    }
                }),
                _buildMenuLayout(),

                Consumer(builder: (context, ref, child) {
                  final isPlayComplete = ref.watch(movieUINotifierProvider.select((it) => it.isMoviePlayComplete));
                  return _buildPlayerEndLayout(isPlayComplete);
                }),
                Positioned(
                    left: 0,
                    top: CommonUtils.getInstance(context).getHeight(552),
                    child: _buildPlayerTitleLayout()
                ),

                Positioned(
                  left: 0,
                  top: CommonUtils.getInstance(context).getHeight(532),
                  width: MediaQuery.of(context).size.width,
                  child: _buildSeekProgressView(),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                color: AppColors.color_edeef2,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: CommonUtils.getInstance(context).getHeight(120),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(40)
                      ),
                      child: RobotoNormalText(
                        text: getIt<FoxschoolLocalization>().data['title_play_list_title'],
                        color: AppColors.color_000000,
                        fontSize: CommonUtils.getInstance(context).getWidth(40),
                      ),
                    ),
                    _buildPlayListView()
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _buildPlayListView()
  {
    final movieDataList = ref.watch(movieUINotifierProvider.select((value) => value.movieDataList));
    if(movieDataList.isNotEmpty)
    {
      return Expanded(
        child: ListView.builder(
          itemCount: movieDataList.length,
          itemBuilder: (context, index) {
            Logcats.message("index : $index, isSelected : ${movieDataList[index].isSelected}");
            return Padding(
              padding: EdgeInsets.only(
                  left: CommonUtils.getInstance(context).getWidth(25),
                  right: CommonUtils.getInstance(context).getWidth(25),
                  bottom: CommonUtils.getInstance(context).getHeight(20)
              ),
              child: ContentsListItemView(
                thumbnailUrl: movieDataList[index].thumbnailUrl,
                title: movieDataList[index].getContentsName(),
                isSelected: movieDataList[index].isSelected,
                onThumbnailPressed: () {

                },
                onItemPressed: () {
                  _factoryController.onClickPlayItem(index);
                },
              ),
            );
          },),
      );
    }
    else
    {
      return Container();
    }
  }


  Widget _buildMenuLayout()
  {
    return Stack(
      children: [
        _buildCaptionTextView(),
        _buildMainMenuControl(),
        _buildTopMenuControl(),
        _buildBottomMenuControl(),
      ],
    );
  }

  Widget _buildCaptionTextView()
  {
    return Consumer(builder: (context, ref, child) {
      final captionText = ref.watch(movieTaskNotifierProvider.select((it) => it.captionText));
      return AnimatedBuilder(
        animation: _aniCaptionController,
        builder: (context, child) {
          return Positioned(
            left: 0,
            bottom: _captionAnimation.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(112),
              color: AppColors.color_alpha_black,
              child: Center(
                child: HtmlTextWidget(
                  text: captionText,
                  fontSize: CommonUtils.getInstance(context).getWidth(28),
                  color: AppColors.color_ffffff,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildMainMenuControl()
  {
    final isMenuVisibility = ref.watch(movieUINotifierProvider.select((it) => it.isVisibleMenu));
    if(isMenuVisibility)
      {
        _aniMenuController.forward();
      }
    else
      {
        _aniMenuController.reverse();
      }


    return AnimatedOpacity(
      opacity: isMenuVisibility ? 1.0 : 0.0,
      duration: const Duration(milliseconds: Common.DURATION_NORMAL),
      child: GestureDetector(
        onTap: () {
          _factoryController.onClickMenu();
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(552),
              color: AppColors.color_alpha_07_black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(552),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(builder: (context, ref, child) {
                    final isEnablePrevButton = ref.watch(movieUINotifierProvider.select((value) => value.isEnablePrevButton));
                    return isEnablePrevButton ?
                    GestureDetector(
                      onTap: () {
                        _factoryController.onClickPrevButton();
                      },
                      child: Image.asset('assets/image/player__previous.png',
                          width: CommonUtils.getInstance(context).getWidth(49),
                          height: CommonUtils.getInstance(context).getHeight(58),
                          fit: BoxFit.cover),
                    ) :
                    SizedBox(
                        width: CommonUtils.getInstance(context).getWidth(49),
                        height: CommonUtils.getInstance(context).getHeight(58)
                    );
                  }),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      _factoryController.onClickPlayButton();
                    },
                    child: Consumer(builder: (context, ref, child) {
                      final isMoviePlaying = ref.watch(movieUINotifierProvider.select((value) => value.isMoviePlaying));
                      return Image.asset(isMoviePlaying ? 'assets/image/player__pause.png' : 'assets/image/player__play.png',
                          width: CommonUtils.getInstance(context).getWidth(98),
                          height: CommonUtils.getInstance(context).getHeight(109),
                          fit: BoxFit.cover);
                    }),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(20),
                  ),
                  Consumer(builder: (context, ref, child) {
                   final isEnableNextButton = ref.watch(movieUINotifierProvider.select((it) => it.isEnableNextButton));
                   return isEnableNextButton ?
                   GestureDetector(
                     onTap: () {
                       _factoryController.onClickNextButton();
                     },
                     child: Image.asset('assets/image/player__next.png',
                         width: CommonUtils.getInstance(context).getWidth(49),
                         height: CommonUtils.getInstance(context).getHeight(58),
                         fit: BoxFit.cover),
                   ) :
                   SizedBox(
                       width: CommonUtils.getInstance(context).getWidth(49),
                       height: CommonUtils.getInstance(context).getHeight(58)
                   );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopMenuControl()
  {
    return AnimatedBuilder(
      animation: _aniMenuController,
      builder: (context, child) {
        return Positioned(
            left: CommonUtils.getInstance(context).getWidth(812),
            top: _menuAnimation.value,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _factoryController.onClickCaptionButton();
                  },
                  child: SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(90),
                    height: CommonUtils.getInstance(context).getHeight(90),
                    child: Center(
                      child: Consumer(builder: (context, ref, child) {
                        final isEnableCaptionButton = ref.watch(movieUINotifierProvider.select((value) => value.isEnableCaptionButton));

                        if(isEnableCaptionButton)
                          {
                            _aniCaptionController.forward();
                          }
                        else
                          {
                            _aniCaptionController.reverse();
                          }
                        return Image.asset(isEnableCaptionButton ? 'assets/image/player__caption_on.png' : 'assets/image/player__caption_off.png',
                          width: CommonUtils.getInstance(context).getWidth(73),
                          height: CommonUtils.getInstance(context).getHeight(57),
                          fit: BoxFit.contain,
                        );
                      })
                    ),
                  ),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(80),
                ),
                GestureDetector(
                  onTap: () {
                    _factoryController.onBackPressed();
                  },
                  child: Image.asset('assets/image/player_btn_close.png',
                    width: CommonUtils.getInstance(context).getWidth(58),
                    height: CommonUtils.getInstance(context).getHeight(58),),
                ),
              ],
            )
        );
      },
    );
  }

  Widget _buildBottomMenuControl()
  {
    return AnimatedBuilder(
      animation: _aniMenuController,
      builder: (context, child) {
        return Positioned(
            left: 0,
            bottom: _menuAnimation.value,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/image/player__replay_off.png',
                      width: CommonUtils.getInstance(context).getWidth(58),
                      height: CommonUtils.getInstance(context).getHeight(62),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _factoryController.onClickZoomButton();
                      },
                      child: Image.asset('assets/image/btn_zoomout.png',
                        width: CommonUtils.getInstance(context).getWidth(62),
                        height: CommonUtils.getInstance(context).getHeight(51),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }



  Widget _buildPlayerEndLayout(bool isComplete)
  {
    final playerViewData = ref.watch(movieUINotifierProvider.select((it) => it.playerEndViewData));
    if(isComplete)
    {
      _aniPlayCompleteController.reset();
      _aniPlayCompleteController.forward();
    }
    return Visibility(
      visible: isComplete,
      child: AnimatedBuilder(
        animation: _aniPlayCompleteController,
        builder: (context, child) {
          return Positioned(
            left: 0,
            right: 0,
            top: _playCompleteAnimation.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(552),
              color: AppColors.color_alpha_07_black,
              child: Stack(
                children: [
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(40),
                      right: CommonUtils.getInstance(context).getWidth(40),
                      child: GestureDetector(
                        onTap: () {
                          _factoryController.onBackPressed();
                        },
                        child: Image.asset('assets/image/player_btn_close.png',
                          width: CommonUtils.getInstance(context).getWidth(58),
                          height: CommonUtils.getInstance(context).getHeight(58),),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(130),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                                visible: playerViewData.isEbookAvailable,
                                maintainSize: false,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_ebook_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isQuizAvailable,
                                maintainSize: false,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_quiz_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isVocabularyAvailable,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_voca_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isFlashcardAvailable,
                                maintainSize: false,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_flashcard_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isStarwordsAvailable,
                                maintainSize: false,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_starwords_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isCrosswordAvailable,
                                maintainSize: false,
                                child: SizedBox(
                                  width: CommonUtils.getInstance(context).getWidth(134),
                                  height: CommonUtils.getInstance(context).getHeight(114),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image/icon_crossword_player.png',
                                          width: CommonUtils.getInstance(context).getWidth(114),
                                          height: CommonUtils.getInstance(context).getHeight(114)),
                                      SizedBox(
                                        width: CommonUtils.getInstance(context).getWidth(20),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Visibility(
                                visible: playerViewData.isTranslateAvailable,
                                maintainSize: false,
                                child: Image.asset('assets/image/icon_org_player.png',
                                    width: CommonUtils.getInstance(context).getWidth(114),
                                    height: CommonUtils.getInstance(context).getHeight(114)
                                )
                            )
                          ],
                        ),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(300),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                _factoryController.onClickReplay();
                              },
                              child: Container(
                                width: CommonUtils.getInstance(context).getWidth(447),
                                height: CommonUtils.getInstance(context).getHeight(120),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(60)),
                                    border: Border.all(
                                        color: AppColors.color_ffffff,
                                        width: CommonUtils.getInstance(context).getWidth(2)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/image/btn_icon_again.png',
                                        width: CommonUtils.getInstance(context).getWidth(51),
                                        height: CommonUtils.getInstance(context).getHeight(58)),
                                    SizedBox(
                                      width: CommonUtils.getInstance(context).getWidth(30),
                                    ),
                                    RobotoNormalText(
                                      text: getIt<FoxschoolLocalization>().data['text_replay'],
                                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                                visible: playerViewData.isNextButtonVisible,
                                maintainSize: false,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: CommonUtils.getInstance(context).getWidth(20),
                                    ),
                                    Container(
                                      width: CommonUtils.getInstance(context).getWidth(447),
                                      height: CommonUtils.getInstance(context).getHeight(120),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(60)),
                                          border: Border.all(
                                              color: AppColors.color_ffffff,
                                              width: CommonUtils.getInstance(context).getWidth(2)
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/image/btn_icon_next_end.png',
                                              width: CommonUtils.getInstance(context).getWidth(51),
                                              height: CommonUtils.getInstance(context).getHeight(58)),
                                          SizedBox(
                                            width: CommonUtils.getInstance(context).getWidth(30),
                                          ),
                                          RobotoNormalText(
                                            text: getIt<FoxschoolLocalization>().data['text_next_video'],
                                            fontSize: CommonUtils.getInstance(context).getWidth(40),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSeekProgressView()
  {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: CommonUtils.getInstance(context).getHeight(10), // 트랙의 높이 설정
          trackShape: const RoundedRectSliderTrackShape(), // 트랙의 모양 설정
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0), // 썸 모양 설정
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        ),
        child: Consumer(builder: (context, ref, child) {
          final isVisibleSeekbar = ref.watch(movieUINotifierProvider.select((it) => it.isVisibleSeekProgressBar));
          final seekbarProgress = ref.watch(movieTaskNotifierProvider.select((it) => it.seekbarProgress));
          return Visibility(
            visible: isVisibleSeekbar,
            child: Slider(
              min: 0.0,
              max: 100.0,
              activeColor: AppColors.color_ffe84d,
              inactiveColor: AppColors.color_cdcdcd,
              thumbColor: AppColors.color_ffe84d,
              value: seekbarProgress,
              onChangeStart: (value) {
                _factoryController.onStartSeekProgress();
              },
              onChanged: (value) {
                _factoryController.onChangeSeekProgress(value);
              },
              onChangeEnd: (value) {
                _factoryController.onEndSeekProgress(value);
              },
            ),
          );
        })
    );
  }

  Widget _buildLandscapeLayout() {
    return SafeArea(
      child: Stack(
        children: [
          Consumer(builder: (context, ref, child) {
            final isMovieLoading = ref.watch(movieUINotifierProvider.select((it) => it.isMovieLoading));
            final videoController = ref.watch(movieUINotifierProvider.select((it) => it.movieController));
            if(isMovieLoading)
              {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.color_000000,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.color_47e1ad,
                    ),
                  ),
                );
              }
            else
              {
                if(videoController != null)
                  {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: VideoPlayer(videoController),
                    );
                  }
                else
                  {
                    return Container();
                  }
              }
          }),
          _buildLandscapeMenuLayout(),
          Consumer(builder: (context, ref, child) {
            final isPlayComplete = ref.watch(movieUINotifierProvider.select((it) => it.isMoviePlayComplete));
            return _buildLandscapePlayerEndLayout(isPlayComplete);
          }),
        ],
      ),
    );
  }


  Widget _buildLandscapeMenuLayout()
  {
    return Stack(
      children: [
        _buildLandscapeCaptionTextView(),
        _buildLandscapeMainMenuControl(),
        _buildLandscapeTopMenuControl(),
        _buildLandscapeBottomMenuControl(),
      ],
    );
  }

  Widget _buildLandscapeCaptionTextView()
  {
    final captionText = ref.watch(movieTaskNotifierProvider.select((it) => it.captionText));
    return AnimatedBuilder(
      animation: _aniCaptionController,
      builder: (context, child) {
        return Positioned(
          left: 0,
          bottom: _captionBottomAnimation.value,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(180),
            color: AppColors.color_alpha_black,
            alignment: Alignment.center,
            child: HtmlTextWidget(
              text: captionText,
              fontSize: CommonUtils.getInstance(context).getWidth(43),
              color: AppColors.color_ffffff,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLandscapeMainMenuControl()
  {
    final isMenuVisibility = ref.watch(movieUINotifierProvider.select((it) => it.isVisibleMenu));
    if(isMenuVisibility)
    {
      _aniMenuController.forward();
    }
    else
    {
      _aniMenuController.reverse();
    }

    return AnimatedOpacity(
      opacity: isMenuVisibility ? 1.0 : 0.0,
      duration: const Duration(milliseconds: Common.DURATION_NORMAL),
      child: GestureDetector(
        onTap: () {
          _factoryController.onClickMenu();
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.color_alpha_07_black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer(builder: (context, ref, child) {
                    final isEnablePrevButton = ref.watch(movieUINotifierProvider.select((it) => it.isEnablePrevButton));
                    return isEnablePrevButton ?
                    GestureDetector(
                      onTap: () {
                        _factoryController.onClickPrevButton();
                      },
                      child: Image.asset('assets/image/player__previous.png',
                          width: CommonUtils.getInstance(context).getWidth(68),
                          height: CommonUtils.getInstance(context).getHeight(81),
                          fit: BoxFit.contain),
                    ) :
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(68),
                      height: CommonUtils.getInstance(context).getHeight(81),
                    );
                  }),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      _factoryController.onClickPlayButton();
                    },
                    child: Consumer(builder: (context, ref, child) {
                      final isMoviePlaying = ref.watch(movieUINotifierProvider.select((it) => it.isMoviePlaying));
                      return Image.asset(isMoviePlaying ? 'assets/image/player__pause.png' : 'assets/image/player__play.png',
                          width: CommonUtils.getInstance(context).getWidth(146),
                          height: CommonUtils.getInstance(context).getHeight(165),
                          fit: BoxFit.contain);
                    }),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(20),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final isEnableNextButton = ref.watch(movieUINotifierProvider.select((it) => it.isEnableNextButton));
                    return isEnableNextButton ?
                    GestureDetector(
                      onTap: () {
                        _factoryController.onClickNextButton();
                      },
                      child: Image.asset('assets/image/player__next.png',
                          width: CommonUtils.getInstance(context).getWidth(68),
                          height: CommonUtils.getInstance(context).getHeight(81),
                          fit: BoxFit.contain),
                    ) :
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(68),
                      height: CommonUtils.getInstance(context).getHeight(81),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );


  }

  Widget _buildLandscapeTopMenuControl()
  {
    return AnimatedBuilder(
      animation: _aniMenuController,
      builder: (context, child) {
        return Positioned(
            left: 0,
            top: _menuAnimation.value,
            child: Row(
              children: [
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(50),
                ),
                Consumer(builder: (context, ref, child) {
                  final movieTitle = ref.watch(movieUINotifierProvider.select((it) => it.movieTitle));
                  return SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(1230),
                    height: CommonUtils.getInstance(context).getHeight(120),
                    child: RobotoNormalText(
                      text: movieTitle,
                      color: AppColors.color_ffffff,
                      fontSize: CommonUtils.getInstance(context).getWidth(45),
                    ),
                  );
                }),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(340),
                ),
                GestureDetector(
                  onTap: () {
                    _factoryController.onClickCaptionButton();
                  },
                  child: SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(90),
                    height: CommonUtils.getInstance(context).getHeight(90),
                    child: Center(
                      child: Consumer(builder: (context, ref, child) {
                        final isEnableCaptionButton = ref.watch(movieUINotifierProvider.select((it) => it.isEnableCaptionButton));
                        if(isEnableCaptionButton)
                          {
                            _aniCaptionController.forward();
                          }
                        else
                          {
                            _aniCaptionController.reverse();
                          }
                        return Image.asset(isEnableCaptionButton ? 'assets/image/player__caption_on.png' : 'assets/image/player__caption_off.png',
                          width: CommonUtils.getInstance(context).getWidth(70),
                          height: CommonUtils.getInstance(context).getHeight(55),
                          fit: BoxFit.contain,
                        );
                      })
                    ),
                  ),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(80),
                ),
                GestureDetector(
                  onTap: () {
                    _factoryController.onBackPressed();
                  },
                  child: Image.asset('assets/image/player_btn_close.png',
                    width: CommonUtils.getInstance(context).getWidth(58),
                    height: CommonUtils.getInstance(context).getHeight(58),),
                ),
              ],
            )
        );
      },
    );
  }

  Widget _buildLandscapeBottomMenuControl()
  {
    final currentPlayTime = ref.watch(movieTaskNotifierProvider.select((value) => value.currentDuration));
    final totalPlayTime = ref.watch(movieTaskNotifierProvider.select((value) => value.maxDuration));
    return AnimatedBuilder(
      animation: _aniMenuController,
      builder: (context, child) {
        return Positioned(
            left: 0,
            bottom: _menuAnimation.value,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/player__replay_off.png',
                      width: CommonUtils.getInstance(context).getWidth(71),
                      height: CommonUtils.getInstance(context).getHeight(62),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(53),
                    ),

                    //-- CurrentPlayTime
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(110),
                      height: CommonUtils.getInstance(context).getHeight(62),
                      child: RobotoNormalText(
                        text: currentPlayTime,
                        color: AppColors.color_ffffff,
                        fontSize: CommonUtils.getInstance(context).getWidth(34),
                        align: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(1130),
                      height: CommonUtils.getInstance(context).getHeight(62),
                      child: _buildSeekProgressView(),
                    ),
                    //-- TotalTime
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(110),
                      height: CommonUtils.getInstance(context).getHeight(62),
                      child: RobotoNormalText(
                        text: totalPlayTime,
                        color: AppColors.color_ffffff,
                        fontSize: CommonUtils.getInstance(context).getWidth(34),
                        align: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: CommonUtils.getInstance(context).getWidth(220),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _factoryController.onClickZoomButton();
                      },
                      child: Image.asset('assets/image/btn_zoomout.png',
                        width: CommonUtils.getInstance(context).getWidth(62),
                        height: CommonUtils.getInstance(context).getHeight(51),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
  


  Widget _buildLandscapePlayerEndLayout(bool isComplete)
  {
    if(isComplete)
    {
      _aniPlayCompleteController.reset();
      _aniPlayCompleteController.forward();
    }

    return Visibility(
      visible: isComplete,
      child: AnimatedBuilder(
        animation: _aniPlayCompleteController,
        builder: (context, child) {
          return Positioned(
            left: 0,
            right: 0,
            top: _playCompleteAnimation.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.color_alpha_07_black,
              child: Stack(
                children: [
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(40),
                      right: CommonUtils.getInstance(context).getWidth(40),
                      child: GestureDetector(
                        onTap: () {
                          _factoryController.onBackPressed();
                        },
                        child: Image.asset('assets/image/player_btn_close.png',
                          width: CommonUtils.getInstance(context).getWidth(58),
                          height: CommonUtils.getInstance(context).getHeight(58)),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(300),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Image.asset('assets/image/icon_ebook_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(30),
                            ),
                            Image.asset('assets/image/icon_quiz_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(30),
                            ),
                            Image.asset('assets/image/icon_voca_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(30),
                            ),
                            Image.asset('assets/image/icon_flashcard_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(30),
                            ),
                            Image.asset('assets/image/icon_starwords_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(30),
                            ),
                            Image.asset('assets/image/icon_org_player.png',
                                width: CommonUtils.getInstance(context).getWidth(150),
                                height: CommonUtils.getInstance(context).getHeight(150)),
                          ],
                        ),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(550),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                _factoryController.onClickReplay();
                              },
                              child: Container(
                                width: CommonUtils.getInstance(context).getWidth(497),
                                height: CommonUtils.getInstance(context).getHeight(148),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(80)),
                                    border: Border.all(
                                        color: AppColors.color_ffffff,
                                        width: CommonUtils.getInstance(context).getWidth(2)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/image/btn_icon_again.png',
                                        width: CommonUtils.getInstance(context).getWidth(69),
                                        height: CommonUtils.getInstance(context).getHeight(69)),
                                    SizedBox(
                                      width: CommonUtils.getInstance(context).getWidth(30),
                                    ),
                                    RobotoNormalText(
                                      text: getIt<FoxschoolLocalization>().data['text_replay'],
                                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Container(
                              width: CommonUtils.getInstance(context).getWidth(497),
                              height: CommonUtils.getInstance(context).getHeight(148),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(80)),
                                  border: Border.all(
                                      color: AppColors.color_ffffff,
                                      width: CommonUtils.getInstance(context).getWidth(2)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/image/btn_icon_next_end.png',
                                      width: CommonUtils.getInstance(context).getWidth(69),
                                      height: CommonUtils.getInstance(context).getHeight(69)),
                                  SizedBox(
                                    width: CommonUtils.getInstance(context).getWidth(30),
                                  ),
                                  RobotoNormalText(
                                    text: getIt<FoxschoolLocalization>().data['text_next_video'],
                                    fontSize: CommonUtils.getInstance(context).getWidth(40),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildPlayerTitleLayout()
  {
    final movieTitle = ref.watch(movieUINotifierProvider.select((it) => it.movieTitle));
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(205),
      color: AppColors.color_ffffff,
      child: Stack(
        children: [
          Positioned(
              left: CommonUtils.getInstance(context).getWidth(45),
              top: CommonUtils.getInstance(context).getHeight(5),
              width: CommonUtils.getInstance(context).getWidth(950),
              height: CommonUtils.getInstance(context).getHeight(200),
              child: Center(
                child: RobotoNormalText(
                  text: movieTitle,
                  fontSize: CommonUtils.getInstance(context).getWidth(46),
                  color: AppColors.color_000000,
                  align: TextAlign.center,
                  maxLines: 2,
                ),
              )
          ),
        ],
      ),
    );
  }




  @override
  void dispose() {
    Logcats.message("dispose");
    _factoryController.dispose();
    _aniPlayCompleteController.dispose();
    _aniMenuController.dispose();
    _aniCaptionController.dispose();
    super.dispose();
  }



}

