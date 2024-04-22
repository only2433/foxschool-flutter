
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';

import 'package:foxschool/bloc/movie/api/MovieContentsBloc.dart';
import 'package:foxschool/bloc/movie/api/event/MovieContentsEvent.dart';
import 'package:foxschool/bloc/movie/api/state/MovieContentsLoadedState.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayCompleteCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayListCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayTitleCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayerMenuCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayerSettingCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MovieSeekProgressCubit.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/movie/MovieItemResult.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:video_player/video_player.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../common/Common.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../base/BlocState.dart';

class MovieFactoryController extends BlocController {
  VideoPlayerController? _controller;
  StreamSubscription? _subscription;
  int _currentPlayIndex = 0;
  MovieItemResult? _currentItemResult;
  Timer? _progressTimer;
  bool _isMenuVisible = false;
  bool _isCaptionEnable = false;


  final BuildContext context;
  final List<ContentsBaseResult> playList;

  MovieFactoryController({
    required this.context,
    required this.playList
  });

  @override
  void init() async
  {
    Logger.d("");
    _settingSubscription();
    _readyToPlay();
  }


  void _initVideoController() async
  {
    await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
      _controller = VideoPlayerController.networkUrl(Uri.parse(
          '${_currentItemResult!.movieMP4Url}'));
    },);


    _controller!.initialize().then((value) async {
      _controller!.addListener(_initVideoListener);
      context.read<MoviePlayerSettingCubit>().setController(_controller!);
      _changePlayerButton(true);
      await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {

        _controller!.play();
        _enableTimer(isEnable: true);
      },);
    });
  }

  void _initVideoListener() {

    if (_controller?.value.isPlaying == false && _controller?.value.position == _controller?.value.duration)
    {
      _enableTimer(isEnable: false);
      if (_currentPlayIndex == playList.length - 1)
      {
        Logger.d("플레이가 종료 되었습니다.");
        context.read<MovieSeekProgressCubit>().setInvisible();
        context.read<MoviePlayCompleteCubit>().showPlayCompleteView(true);
      }
      else {
        _currentPlayIndex++;
        _readyToPlay();
      }
    }
  }

  void _settingSubscription() {
    var blocState;
    _subscription = BlocProvider
        .of<MovieContentsBloc>(context)
        .stream
        .listen((state) async {
      Logger.d("state.runtimeType : ${state.runtimeType}");
      switch (state.runtimeType) {
        case MovieContentsLoadedState:
          blocState = state as MovieContentsLoadedState;
          _currentItemResult = blocState.data;
          _initVideoController();
          break;
        case LoadingState:
          break;
        case ErrorState:
          Logger.d("context : ${context}");
          blocState = state as ErrorState;
          Fluttertoast.showToast(msg: blocState.message);
          await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
          Navigator.pushAndRemoveUntil(
            context,
            Page.getLogoutTransition(context),
                (route) => false,
          );
          break;
      }
    });
  }

  void _readyToPlay() async
  {
    Logger.d("_currentPlayIndex : $_currentPlayIndex");
    _controller?.removeListener(_initVideoListener);
    context.read<MoviePlayerMenuCubit>().enableMenu(isEnable: false);
    context.read<MovieSeekProgressCubit>().setPercent(0);
    context.read<MoviePlayCompleteCubit>().showPlayCompleteView(false);
    context.read<MoviePlayerSettingCubit>().showLoading();
    _setCurrentPlayItem(_currentPlayIndex);
    await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
      BlocProvider.of<MovieContentsBloc>(context).add(
          MovieContentsEvent(data: playList[_currentPlayIndex].id)
      );
    },);
  }

  void _setCurrentPlayItem(int index) {
    for (int i = 0; i < playList.length; i++) {
      if (i == index) {
        playList[i] = playList[i].setSelected(true);
        context.read<MoviePlayTitleCubit>().setTitle(playList[i].getContentsName());
      }
      else {
        playList[i] = playList[i].setSelected(false);
      }
    }
    context.read<MoviePlayListCubit>().setMoviePlayList(playList);
  }

  void _enableTimer({required bool isEnable})
  {
    if(isEnable)
    {
      _progressTimer = Timer.periodic(Duration(milliseconds: Common.DURATION_SHORTEST), (timer) {
        _updateUI();
      });
    }
    else
    {
      _progressTimer?.cancel();
      _progressTimer = null;
    }
  }

  void _updateUI()
  {
    double percent = (_controller!.value.position.inSeconds/_controller!.value.duration.inSeconds) * 100;
    context.read<MovieSeekProgressCubit>().setPercent(percent);
  }

  void _changePlayerButton(bool isMoviePlaying)
  {
    context.read<MoviePlayerMenuCubit>().changePlayButton(isMoviePlaying: isMoviePlaying);
  }



  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }

  @override
  void dispose() {
    _enableTimer(isEnable: false);
    _subscription?.cancel();
    _subscription = null;
    _controller?.removeListener(_initVideoListener);
    _controller?.dispose();
    Logger.d("_subscription cancel");
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void onClickPlayItem(int index) {
    Logger.d("index : $index");
    _currentPlayIndex = index;
    _controller?.pause();
    _enableTimer(isEnable: false);
    _readyToPlay();
  }

  void onClickReplay() {
    Logger.d("");
    _readyToPlay();
  }

  void onStartSeekProgress()
  {
    Logger.d("");
    _enableTimer(isEnable: false);
  }

  void onChangeSeekProgress(double value)
  {
    Logger.d("value : $value");
    context.read<MovieSeekProgressCubit>().setPercent(value);
  }

  void onEndSeekProgress(double value)
  {
    Logger.d("value : $value");
    double totalTime = _controller!.value.duration.inMilliseconds.toDouble();
    double seekTime = totalTime * (value / 100);
    _enableTimer(isEnable: true);
    _controller?.seekTo(Duration(milliseconds: seekTime.toInt()));
  }

  void onClickMenu()
  {
    _isMenuVisible = !_isMenuVisible;
    context.read<MoviePlayerMenuCubit>().enableMenu(isEnable: _isMenuVisible);
  }

  void onClickCaptionButton()
  {
    _isCaptionEnable = !_isCaptionEnable;
    context.read<MoviePlayerMenuCubit>().enableCaptionButton(isEnable: _isCaptionEnable);
  }

  void onClickPlayButton()
  {
    if(_controller!.value.isPlaying)
      {
        _controller!.pause();
        _changePlayerButton(false);
      }
    else
      {
        _controller!.play();
        _changePlayerButton(true);
      }
  }


}