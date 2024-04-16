
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';

import 'package:foxschool/bloc/movie/api/MovieContentsBloc.dart';
import 'package:foxschool/bloc/movie/api/event/MovieContentsEvent.dart';
import 'package:foxschool/bloc/movie/api/state/MovieContentsLoadedState.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayListCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayTitleCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayerChangeCubit.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/movie/MovieItemResult.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:video_player/video_player.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../common/Common.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../base/BlocState.dart';

class MovieFactoryController extends BlocController
{
  late VideoPlayerController _controller;
  StreamSubscription? _subscription;
  int _currentPlayIndex = 0;
  MovieItemResult? _currentItemResult;

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
    _setCurrentPlayItem(_currentPlayIndex);
    await Future.delayed(Duration(milliseconds: Common.DURATION_LONGEST), () {
      BlocProvider.of<MovieContentsBloc>(context).add(
          MovieContentsEvent(data: playList[_currentPlayIndex].id)
      );
    },);

  }


  void _initVideoController() async
  {
    await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
      _controller = VideoPlayerController.networkUrl(Uri.parse(
          '${_currentItemResult!.movieMP4Url}'));
    },);


    _controller.initialize().then((value) async{
      context.read<MoviePlayerChangeCubit>().setController(_controller);
      await Future.delayed(Duration(milliseconds: Common.DURATION_LONG), () {
        _controller.play();
      },);

    });
  }


  void _settingSubscription()
  {
    var blocState;
    _subscription = BlocProvider.of<MovieContentsBloc>(context).stream.listen((state) async {
      Logger.d("state.runtimeType : ${state.runtimeType}");
      switch(state.runtimeType)
      {
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

  void _setCurrentPlayItem(int index)
  {
    for(int i = 0; i < playList.length; i++)
    {
      if(i == index)
        {
          playList[i] = playList[i].setSelected(true);
          context.read<MoviePlayTitleCubit>().setTitle(playList[i].getContentsName());
        }
      else
        {
          playList[i] = playList[i].setSelected(false);
        }
    }
    context.read<MoviePlayListCubit>().setMoviePlayList(playList);
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
    _subscription?.cancel();
    _subscription = null;
    Logger.d("_subscription cancel");
  }
  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }


}