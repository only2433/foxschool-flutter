
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/movie/intent_data/PlayerIntentParamsObject.dart';
import 'package:foxschool/data/model/movie/play_end_data/PlayerEndViewData.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/model/movie/MovieItemResult.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/MovieAPINotifier.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/MovieTaskNotifier.dart';
import 'package:foxschool/presentation/controller/movie/river_pod/MovieUINotifier.dart';
import 'package:video_player/video_player.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';

class MovieFactoryController extends BlocController {

  late MovieAPINotifierProvider _repositoryProvider;
  late MovieItemResult _currentItemResult;
  late List<ContentsBaseResult> _playList;

  VideoPlayerController? _controller;
  StreamSubscription? _subscription;
  int _currentPlayIndex = 0;
  int _currentCaptionIndex = 0;
  Timer? _progressTimer;
  bool _isMenuVisible = false;
  bool _isCaptionEnable = false;
  bool _isFullScreen = false;


  final BuildContext context;
  final PlayerIntentParamsObject playerIntentParamsObject;
  final WidgetRef widgetRef;

  MovieFactoryController({
    required this.context,
    required this.playerIntentParamsObject,
    required this.widgetRef
  });

  @override
  void init() async
  {
    Logcats.message("");
    _repositoryProvider = MovieAPINotifierProvider(getIt<FoxSchoolRepository>());
    _playList = playerIntentParamsObject.list.toList();

    Logcats.message("playList size : ${_playList[0].getContentsName()}");
    _settingRequestDataNotifier();
    _readyToPlay();
  }


  void _initVideoController() async
  {
    await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
      _controller = VideoPlayerController.networkUrl(Uri.parse(
          _currentItemResult.movieMP4Url));
    },);


    _controller!.initialize().then((value) async {
      _controller!.addListener(_initVideoListener);
      widgetRef.read(movieUINotifierProvider.notifier).setMovieController(_controller!);

      await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER), () {
        widgetRef.read(movieUINotifierProvider.notifier).updateMovieLoadingState(isDataLoading: false);
        _controller!.play();
        _settingPreparedView();
        _enableTimer(isEnable: true);
      },);
    });
  }

  void _initVideoListener() {
    if (_controller?.value.isPlaying == false && _controller?.value.position == _controller?.value.duration)
    {
      _enableTimer(isEnable: false);
      if (_currentPlayIndex == _playList.length - 1)
      {
        Logcats.message("플레이가 종료 되었습니다.");
        final playerEndViewData = _getCurrentMoviePlayerEndViewData();
        widgetRef.read(movieTaskNotifierProvider.notifier).updateSeekBarPercent(0.0);
        widgetRef.read(movieUINotifierProvider.notifier).completeMoviePlay(playerEndViewData);
      }
      else {
        _currentPlayIndex++;
        _readyToPlay();
      }
    }
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state) {
            state.maybeWhen(
                authenticationErrorState: (isAutoRestart, message) async{
                  if(isAutoRestart == false)
                  {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  //Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );
                },
                errorState: (message) {
                  //Fluttertoast.showToast(msg: message);
                  onBackPressed();
                },
                orElse: (){}
            );
          },
          contentsLoadedState: (result) {
            _currentItemResult = result;
            _initVideoController();
          });
    });
  }

  void _readyToPlay() async
  {
    Logcats.message("_currentPlayIndex : $_currentPlayIndex");
    _currentCaptionIndex = 0;
    _controller?.removeListener(_initVideoListener);
    Future.delayed(Duration.zero, (){
      _setMenuVisible(false);
      widgetRef.read(movieTaskNotifierProvider.notifier).init();
      widgetRef.read(movieUINotifierProvider.notifier).readyToPlay();
      _setCurrentPlayItem(_currentPlayIndex);
    });
    await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG), () {
      widgetRef.read(_repositoryProvider.notifier).requestMovieContentsData(_playList[_currentPlayIndex].id);
    });
  }

  void _setCurrentPlayItem(int index) {
    Logcats.message("index : $index, size : ${_playList.length}");
    for (int i = 0; i < _playList.length; i++) {
      Logcats.message("i : $i, index : $index");
      if (i == index)
      {
        _playList[i] = _playList[i].setSelected(true);
        widgetRef.read(movieUINotifierProvider.notifier).setMovieTitle(_playList[i].getContentsName());
      }
      else
      {
        _playList[i] = _playList[i].setSelected(false);
      }
    }
    widgetRef.read(movieUINotifierProvider.notifier).notifyDataList(_playList);
  }

  void _enableTimer({required bool isEnable})
  {
    if(isEnable)
    {
      _progressTimer = Timer.periodic(const Duration(milliseconds: Common.DURATION_SHORTEST), (timer) {
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
    widgetRef.read(movieTaskNotifierProvider.notifier).updateSeekBarPercent(percent);

    var tempData = _controller!.value;
    Duration currentDuration = tempData.position;
    Duration remainDuration = tempData.duration;
    widgetRef.read(movieTaskNotifierProvider.notifier).updateDuration(
        CommonUtils.getInstance(context).getFormatDuration(currentDuration),
        CommonUtils.getInstance(context).getFormatDuration(remainDuration));

    if(_isTimeForCaption())
      {
        widgetRef.read(movieTaskNotifierProvider.notifier).updateCaptionText(_currentItemResult.captionList[_currentCaptionIndex].text);
        _currentCaptionIndex++;
      }
  }

  bool isMoviePlaying()
  {
    if(_controller!.value.isPlaying)
      {
        return true;
      }
    return false;
  }

  void _changePlayerButton(bool isMoviePlaying)
  {
    widgetRef.read(movieUINotifierProvider.notifier).setMoviePlaying(isMoviePlaying);
  }

  void _setMenuVisible(bool isVisible)
  {
    _isMenuVisible = isVisible;
    widgetRef.read(movieUINotifierProvider.notifier).toggleMenuVisibility(_isMenuVisible);
  }

  void _setOrientation(bool isFullScreen) async
  {
    _isFullScreen = isFullScreen;
    if(_isFullScreen)
      {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
      }
    else
      {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }

    _setMenuVisible(false);
    await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORT), () {
      _settingPreparedView();
    },);
  }

  void _settingPreparedView()
  {
    /*context.read<MoviePlayerMenuCubit>().changePlayButton(isMoviePlaying: isMoviePlaying());
    context.read<MoviePlayerMenuCubit>().enableCaptionButton(isEnable: _isCaptionEnable);
    context.read<MoviePlayTimeCubit>().setPlayTime(
        "--:--",
        "--:--"
    );*/
    widgetRef.read(movieUINotifierProvider.notifier).setMoviePlaying(isMoviePlaying());
    widgetRef.read(movieUINotifierProvider.notifier).enableCaptionButton(_isCaptionEnable);
    widgetRef.read(movieTaskNotifierProvider.notifier).initDuration();
    _checkPrevNextButton();
  }

  void _checkPrevNextButton()
  {
    if(_playList.length == 1)
    {
      widgetRef.read(movieUINotifierProvider.notifier).enableControllerButton(isEnablePrev: false, isEnableNext: false);
    }
    else
    {
      if(_currentPlayIndex == 0)
      {
        widgetRef.read(movieUINotifierProvider.notifier).enableControllerButton(isEnablePrev: false, isEnableNext: true);
      }
      else if(_currentPlayIndex == _playList.length - 1)
      {
        widgetRef.read(movieUINotifierProvider.notifier).enableControllerButton(isEnablePrev: true, isEnableNext: false);
      }
      else
      {
        widgetRef.read(movieUINotifierProvider.notifier).enableControllerButton(isEnablePrev: true, isEnableNext: true);
      }
    }
  }

  bool _isTimeForCaption()
  {
    try
    {
      if(_currentCaptionIndex >= _currentItemResult.captionList.length
          || _currentCaptionIndex == -1
          || _currentItemResult.captionList.isEmpty)
      {
        return false;
      }
      int visibleTime = _currentItemResult.captionList[_currentCaptionIndex].startTime;

      if(visibleTime <= _controller!.value.position.inMilliseconds)
      {
        return true;
      }
    }
    catch(e)
    {
      return false;
    }
    return false;
  }

  int _getCurrentCaptionIndex(int currentTime)
  {
    int startTime = 0;
    int endTime = 0;

    if(_currentItemResult.captionList.isEmpty)
      {
        return -1;
      }
    startTime = _currentItemResult.captionList[0].startTime;

    Logcats.message("startTime : $startTime, position : $currentTime");
    if(startTime > currentTime)
      {
        return 0;
      }
    for(int i = 0 ; i < _currentItemResult.captionList.length; i++)
      {
        startTime = _currentItemResult.captionList[i].startTime;
        endTime = _currentItemResult.captionList[i].endTime;
        if(startTime <= currentTime
            && endTime >= currentTime)
          {
            return i;
          }
      }
    for(int i = 0 ; i < _currentItemResult.captionList.length; i++)
      {
        startTime = _currentItemResult.captionList[i].startTime;
        if(startTime >= currentTime)
          {
            return i;
          }
      }
    return -1;
  }

  PlayerEndViewData _getCurrentMoviePlayerEndViewData()
  {
    PlayerEndViewData result = PlayerEndViewData();
    final data = _playList[_currentPlayIndex];

    if(_currentItemResult.nextContent != null && _playList.length <= 1)
      {
        result = result.copyWith(
          isNextButtonVisible: true
        );
      }
    if(playerIntentParamsObject.homeworkNumber != 0)
      {
        result  = result.copyWith(
            isEbookAvailable: false,
            isQuizAvailable: false,
            isVocabularyAvailable: false,
            isFlashcardAvailable: false,
            isStarwordsAvailable: false,
            isCrosswordAvailable: false,
            isTranslateAvailable: false,
            isNextButtonVisible: false
        );
      }
    else
      {
        if(data.serviceInfo?.ebookSupportType == Common.SERVICE_NOT_SUPPORTED)
          {
            result = result.copyWith(
                isEbookAvailable: false
            );
          }
        if(data.serviceInfo?.quizSupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isQuizAvailable: false
          );
        }
        if(data.serviceInfo?.vocabularySupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isVocabularyAvailable: false
          );
        }
        if(data.serviceInfo?.flashcardSupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isFlashcardAvailable: false
          );
        }
        if(data.serviceInfo?.starwordsSupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isStarwordsAvailable: false
          );
        }
        if(data.serviceInfo?.crosswordSupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isCrosswordAvailable: false
          );
        }
        if(data.serviceInfo?.originalTextSupportType == Common.SERVICE_NOT_SUPPORTED)
        {
          result = result.copyWith(
              isTranslateAvailable: false
          );
        }
      }

    Logcats.message("result toString : ${result.toString()}");
    return result;
  }


  @override
  void dispose() {
    _setOrientation(false);
    _enableTimer(isEnable: false);
    _subscription?.cancel();
    _subscription = null;
    _controller?.removeListener(_initVideoListener);
    _controller?.dispose();
    Logcats.message("_subscription cancel");
  }

  @override
  void onBackPressed() async {

    Logcats.message("MediaQuery.of(context).orientation :  ${MediaQuery.of(context).orientation}");
    if(MediaQuery.of(context).orientation == Orientation.landscape)
      {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL),() {
          Navigator.of(context).pop();
        },);
      }
    else
      {
        Navigator.of(context).pop();
      }
  }

  void onClickPlayItem(int index) {
    Logcats.message("index : $index");
    _currentPlayIndex = index;
    _controller?.pause();
    _enableTimer(isEnable: false);
    _readyToPlay();
  }

  void onClickReplay() {
    Logcats.message("");
    _readyToPlay();
  }

  void onStartSeekProgress()
  {
    Logcats.message("");
    _enableTimer(isEnable: false);
    widgetRef.read(movieTaskNotifierProvider.notifier).updateCaptionText("");
  }

  void onChangeSeekProgress(double value)
  {
    Logcats.message("value : $value");
    widgetRef.read(movieTaskNotifierProvider.notifier).updateSeekBarPercent(value);
  }

  void onEndSeekProgress(double value)
  {
    Logcats.message("value : $value");
    double totalTime = _controller!.value.duration.inMilliseconds.toDouble();
    double seekTime = totalTime * (value / 100);
    _enableTimer(isEnable: true);
    _controller?.seekTo(Duration(milliseconds: seekTime.toInt()));
    _currentCaptionIndex = _getCurrentCaptionIndex(seekTime.toInt());
    Logcats.message("_currentCaptionIndex : $_currentCaptionIndex");
  }

  void onClickMenu()
  {
    _setMenuVisible(!_isMenuVisible);
  }

  void onClickCaptionButton()
  {
    _isCaptionEnable = !_isCaptionEnable;
    widgetRef.read(movieUINotifierProvider.notifier).enableCaptionButton(_isCaptionEnable);
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

  void onClickPrevButton()
  {
    _currentPlayIndex = _currentPlayIndex > 0 ? _currentPlayIndex - 1 : 0;
    _controller?.pause();
    _enableTimer(isEnable: false);
    _readyToPlay();
  }

  void onClickNextButton()
  {
    _currentPlayIndex = _currentPlayIndex < _playList.length - 1 ? _currentPlayIndex + 1 : _playList.length - 1;
    _controller?.pause();
    _enableTimer(isEnable: false);
    _readyToPlay();
  }

  void onClickZoomButton()
  {
    _setOrientation(!_isFullScreen);
  }
}