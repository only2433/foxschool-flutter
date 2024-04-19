import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayCompleteCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MovieSeekProgressCubit.dart';
import 'package:foxschool/bloc/movie/factory/state/base/MoviePlayerBaseState.dart';
import 'package:foxschool/bloc/movie/MovieFactoryController.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayListCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayTitleCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayerSettingCubit.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayListState.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayTitleState.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayerReadyState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/ContentsListItemView.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/movie/factory/state/MoviePlayCompleteState.dart';
import '../../bloc/movie/factory/state/MovieSeekProgressState.dart';
import '../../common/Common.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';


class MoviePlayerScreen extends StatefulWidget {

  final List<ContentsBaseResult> playList;
  const MoviePlayerScreen({super.key,
    required this.playList}
      );

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> with SingleTickerProviderStateMixin {
  late MovieFactoryController _factoryController;
  late AnimationController _aniPlayCompleteController;
  late Animation<double> _playCompleteAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initPlayCompleteAnimation(); // 애니메이션 초기화 메서드 호출
  }

  @override
  void initState() 
  {
    super.initState();
    _factoryController = MovieFactoryController(context: context, playList: widget.playList);
    _factoryController.init();
  }

  void _initPlayCompleteAnimation()
  {
    _aniPlayCompleteController = AnimationController(
      duration: Duration(milliseconds: 500), // 애니메이션 지속 시간
      vsync: this,
    );

    _playCompleteAnimation = Tween<double>(
      begin: -CommonUtils.getInstance(context).getHeight(552), // 시작값 (화면 위쪽으로 이동)
      end: 0, // 끝값 (화면 아래쪽으로 이동)
    ).animate(_aniPlayCompleteController);
  }

  double test = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_000000,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(757),
              child: Stack(
                children: [
                  BlocBuilder<MoviePlayerSettingCubit, MoviePlayerBaseState>(builder: (context, state) {
                    if(state is MovieLoadingState)
                    {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: CommonUtils.getInstance(context).getHeight(552),
                          color: AppColors.color_000000,
                          child: const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.color_47e1ad)
                          )
                      );
                    }
                    else if(state is MoviePlayerReadyState)
                    {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: CommonUtils.getInstance(context).getHeight(552),
                          child: VideoPlayer(state.controller)
                      );
                    }
                    else
                    {
                      return Container();
                    }
                  }),
                  BlocBuilder<MoviePlayCompleteCubit, MoviePlayCompleteState>(builder: (context, state) {
                    Logger.d("state.isComplete : ${state.isComplete}");
                    return _getPlayerEndLayout(state.isComplete);
                  }),
                  Positioned(
                      left: 0,
                      top: CommonUtils.getInstance(context).getHeight(552),
                      child: _getPlayerTitleLayout()
                  ),

                Positioned(
                  left: 0,
                  top: CommonUtils.getInstance(context).getHeight(532),
                  width: MediaQuery.of(context).size.width,
                  child: _getSeekProgressView(),
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
                      _getPlayListView()
                    ],
                  ),
                )
            )
          ],
        ),
      )
    );
  }

  Widget _getPlayerTitleLayout()
  {
    return BlocBuilder<MoviePlayTitleCubit, MoviePlayTitleState>(builder: (context, state) {
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
                    text: state.title,
                    fontSize: CommonUtils.getInstance(context).getWidth(46),
                    color: AppColors.color_000000,
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                )
            ),
            Positioned(
                top: CommonUtils.getInstance(context).getHeight(40),
                right: CommonUtils.getInstance(context).getWidth(30),
                child: Image.asset(
                  'asset/image/icon_learning.png',
                  width: CommonUtils.getInstance(context).getWidth(92),
                  height: CommonUtils.getInstance(context).getHeight(125),
                )
            )
          ],
        ),
      );
    });
  }

  Widget _getPlayerEndLayout(bool isComplete)
  {
    if(isComplete)
      {
        _aniPlayCompleteController.forward();
      }
    double endLayoutYOffset = -CommonUtils.getInstance(context).getHeight(552);
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
                        child: Image.asset('asset/image/player_btn_close.png',
                          width: CommonUtils.getInstance(context).getWidth(58),
                          height: CommonUtils.getInstance(context).getHeight(58),),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(130),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Image.asset('asset/image/icon_ebook_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Image.asset('asset/image/icon_quiz_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Image.asset('asset/image/icon_voca_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Image.asset('asset/image/icon_flashcard_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Image.asset('asset/image/icon_starwords_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                            SizedBox(
                              width: CommonUtils.getInstance(context).getWidth(20),
                            ),
                            Image.asset('asset/image/icon_org_player.png',
                                width: CommonUtils.getInstance(context).getWidth(114),
                                height: CommonUtils.getInstance(context).getHeight(114)),
                          ],
                        ),
                      )
                  ),
                  Positioned(
                      top: CommonUtils.getInstance(context).getHeight(300),
                      child: Container(
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
                                    Image.asset('asset/image/btn_icon_again.png',
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
                                  Image.asset('asset/image/btn_icon_next_end.png',
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

  Widget _getPlayListView()
  {
    return BlocBuilder<MoviePlayListCubit, MoviePlayListState>(builder: (context, state) {

      if(state.list.isNotEmpty)
        {
          return Expanded(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                Logger.d("index : ${index}, isSelected : ${state.list[index].isSelected}");
                return Padding(
                  padding: EdgeInsets.only(
                      left: CommonUtils.getInstance(context).getWidth(25),
                      right: CommonUtils.getInstance(context).getWidth(25),
                      bottom: CommonUtils.getInstance(context).getHeight(20)
                  ),
                child: ContentsListItemView(
                  thumbnailUrl: state.list[index].thumbnailUrl,
                  title: state.list[index].getContentsName(),
                  isSelected: state.list[index].isSelected,
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
    },);
  }

  Widget _getSeekProgressView()
  {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: CommonUtils.getInstance(context).getHeight(10), // 트랙의 높이 설정
        trackShape: RoundedRectSliderTrackShape(), // 트랙의 모양 설정
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0), // 썸 모양 설정
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
      ),
      child: BlocBuilder<MovieSeekProgressCubit, MovieSeekProgressState>(builder: (context, state) {
        Logger.d("state isvisible : ${state.isVisible} , percent : ${state.percent}");
        return Visibility(
          visible: state.isVisible,
          child: Slider(
            min: 0.0,
            max: 100.0,
            activeColor: AppColors.color_ffe84d,
            inactiveColor: AppColors.color_cdcdcd,
            thumbColor: AppColors.color_ffe84d,
            value: state.percent,
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
      },
    ));
  }

  @override
  void dispose() {
    Logger.d("dispose");
    _factoryController.dispose();
    super.dispose();
  }
}

