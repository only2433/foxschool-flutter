

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/vocabulary/api/VocabularyBloc.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyDataListEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyDataListLoadedState.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyBottomControllerCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyItemListCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyPlayingCubit.dart';

import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyStudyTypeCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyListBaseState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/VocabularySelectType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../di/Dependencies.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/vocabulary/VocabularyDataResult.dart';
import '../../data/vocabulary/information/VocabularyInformationData.dart';

class VocabularyFactoryController extends BlocController
{
  final List<int> INTERVAL_SECONDS = [0, 1, 2, 3, 5, 7, 10, 15, 20, 30];
  late StreamSubscription _subscription;
  late List<VocabularyDataResult> _vocabularyDataList;
  late List<VocabularyDataResult> _currentPlayDataList;
  late AudioPlayer _audioPlayer;

  bool _isEnableAll = true;
  bool _isEnableWord = true;
  bool _isEnableMean  = true;
  bool _isEnableExample = true;

  bool _isSequencePlay = false;
  bool _isSelectAll = false;
  int _currentIntervalIndex = 0;
  int _currentSelectedItemCount = 0;
  int _playIndex = 0;

  Timer? _vocabularyPlayTimer;

  ScrollPosition? _scrollPosition;
  final BuildContext context;
  final VocabularyInformationData vocabularyInformationData;
  final AutoScrollController autoScrollController;
  VocabularyFactoryController({
    required this.context,
    required this.vocabularyInformationData,
    required this.autoScrollController,
  });

  @override
  void init() async {
    context.read<VocabularyItemListCubit>().showLoading();
    _currentIntervalIndex = await Preference.getInt(Common.PARAMS_VOCABULARY_INTERVAL);
    context.read<VocabularyBottomControllerCubit>().setInterval(_currentIntervalIndex);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        BlocProvider.of<VocabularyBloc>(context).add(
          VocabularyDataListEvent(contentID: vocabularyInformationData.id)
        );
      },);
    });
    _initAudioPlayer();
    _settingSubscriptions();
  }

  void _initAudioPlayer()
  {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((event) async{
      if(_isSequencePlay)
      {

        if(_playIndex >= _currentPlayDataList.length - 1)
        {
          _playIndex = 0;
        }
        else
        {
          _playIndex++;
        }
        Logger.d("play index : $_playIndex,  length: ${_currentPlayDataList.length}");
        await Future.delayed(Duration(seconds: INTERVAL_SECONDS[_currentIntervalIndex]), () async{
          await autoScrollController.scrollToIndex(_playIndex, preferPosition: AutoScrollPosition.begin);
          _playAudio(_currentPlayDataList[_playIndex].soundUrl);
          _setCurrentPlayItem(_playIndex);
        },);
      }
    });
  }

  void _settingSubscriptions()
  {
    var blocState;
    _subscription = BlocProvider.of<VocabularyBloc>(context).stream.listen((state) async{
      switch(state.runtimeType)
      {
        case VocabularyDataListLoadedState:
          blocState = state as VocabularyDataListLoadedState;
          _vocabularyDataList = blocState.data;

          for(int i = 0 ; i < _vocabularyDataList.length; i++)
            {
              final meanLineCount = _calculateLineCount(
                  _vocabularyDataList[i].meanText,
                  CommonUtils.getInstance(context).getWidth(800),
                  CommonUtils.getInstance(context).getWidth(38));

              final exampleLineCount = _calculateLineCount(
                  _getRemoveHtmlTag(_vocabularyDataList[i].exampleText),
                  CommonUtils.getInstance(context).getWidth(800),
                  CommonUtils.getInstance(context).getWidth(38));

              Logger.d("mean text  :${_vocabularyDataList[i].meanText}");
              Logger.d("example text  :${_vocabularyDataList[i].exampleText}");
              _vocabularyDataList[i] = _vocabularyDataList[i].setLineCount(meanLineCount + exampleLineCount);

              Logger.i("index : $i , title : ${_vocabularyDataList[i].wordText}, meanLineCount: $meanLineCount, exampleLineCount: $exampleLineCount");

            }

          context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
        break;
      }
    });
  }

  int _calculateLineCount(String text, double maxWidth, double fontSize)
  {
    const textDirection = TextDirection.ltr;
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      textDirection: textDirection,
    );

    textPainter.layout(maxWidth: maxWidth);
    final lineCount = textPainter.computeLineMetrics().length;
    return lineCount;
  }

  String _getRemoveHtmlTag(String html)
  {
    try {
      html = html.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
    } catch (e) {
      return '';
    }
    return html;
  }

  void _playAudio(String url) async
  {
    await _audioPlayer.play(UrlSource(url));
  }

  void _stopAudio() async
  {
    if(_audioPlayer.state == PlayerState.playing)
    {
      await _audioPlayer.stop();
      await _audioPlayer.release();
    }
  }


  void _playVocabularyList() async
  {
    _playIndex = 0;
    autoScrollController.jumpTo(0.0);
    _playAudio(_currentPlayDataList[_playIndex].soundUrl);
    _setCurrentPlayItem(_playIndex);
  }




  int _getSelectedItemCount()
  {
    return _vocabularyDataList.where((item) => item.isSelected).length;
  }

  List<VocabularyDataResult> _getSelectedList()
  {
    return _vocabularyDataList.where((item) => item.isSelected).toList();
  }

  void _checkAllSelectedItem(bool isSelected)
  {
    for (int  i = 0 ; i < _vocabularyDataList.length; i++) {
      _vocabularyDataList[i] = _vocabularyDataList[i].setSelected(isSelected);
    }
  }

  void _setCurrentPlayItem(int index)
  {
    for (int  i = 0 ; i < _currentPlayDataList.length; i++) {
      if(i == index)
        {
          _currentPlayDataList[i] = _currentPlayDataList[i].setCurrentPlaying(true);
        }
      else
        {
          _currentPlayDataList[i] = _currentPlayDataList[i].setCurrentPlaying(false);
        }
    }

    context.read<VocabularyItemListCubit>().setVocabularyItemList(_currentPlayDataList);
  }




  @override
  void onBackPressed() {
    Navigator.of(context).pop();
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
    // TODO: implement dispose
  }

  void onClickSelectType(VocabularySelectType type)
  {
    if(type == VocabularySelectType.ALL)
      {
        _isEnableAll = !_isEnableAll;
        if(_isEnableAll)
        {
          context.read<VocabularyStudyTypeCubit>().setSelectType(true, true, true, true);
        }
        else
        {
          context.read<VocabularyStudyTypeCubit>().setSelectType(false, false, false, false);
        }
      }
    else
      {
        switch(type)
        {
          case VocabularySelectType.WORD:
            _isEnableWord = !_isEnableWord;
            break;
          case VocabularySelectType.MEAN:
            _isEnableMean = !_isEnableMean;
            break;
          case VocabularySelectType.EXAMPLE:
            _isEnableExample = !_isEnableExample;
            break;
          default:
            break;
        }
        _isEnableAll = _isEnableWord && _isEnableMean && _isEnableExample;
        context.read<VocabularyStudyTypeCubit>().setSelectType(_isEnableAll, _isEnableWord, _isEnableMean, _isEnableExample);
      }
  }



  void onSelectItem(int index)
  {
    if(_vocabularyDataList[index].isSelected)
    {
      _vocabularyDataList[index] = _vocabularyDataList[index].setSelected(false);
    }
    else
    {
      _vocabularyDataList[index] = _vocabularyDataList[index].setSelected(true);
    }

    Logger.d("index : $index, isSelected : ${_vocabularyDataList[index].isSelected}");
    context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);


    _currentSelectedItemCount = _getSelectedItemCount();
    if(_currentSelectedItemCount  > 0)
      {
        context.read<VocabularyBottomControllerCubit>().setHaveSelectedItem(true);
      }
    else
      {
        context.read<VocabularyBottomControllerCubit>().setHaveSelectedItem(false);
      }
    context.read<VocabularyBottomControllerCubit>().setSelectItemCount(_currentSelectedItemCount);
  }

  void onPlayItem(int index)
  {
    _playAudio(_vocabularyDataList[index].soundUrl);
  }

  void onClickInterval() async
  {
    Logger.d("");
    int currentIndex = await Preference.getInt(Common.PARAMS_VOCABULARY_INTERVAL);
    FoxSchoolDialog.showBottomIntervalSelectDialog(
        context: context,
        currentIntervalIndex: currentIndex, onItemPressed: (index) async{
          await Preference.setInt(Common.PARAMS_VOCABULARY_INTERVAL, index);

          context.read<VocabularyBottomControllerCubit>().setInterval(index);

        },);
  }

  void onClickSelectAll()
  {
    _isSelectAll = !_isSelectAll;

    Logger.d("_isSelectAll : $_isSelectAll");

    if(_isSelectAll)
      {
        _checkAllSelectedItem(true);
        _currentSelectedItemCount = _vocabularyDataList.length;
      }
    else
      {
        _checkAllSelectedItem(false);
        _currentSelectedItemCount = 0;
      }
    context.read<VocabularyBottomControllerCubit>().setSelectItemCount(_currentSelectedItemCount);
    context.read<VocabularyBottomControllerCubit>().setHaveSelectedItem(_isSelectAll);
    context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
  }

  void onClickSelectPlay() async
  {
    if(_isSequencePlay)
      {
        _isSequencePlay = false;
        context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
        context.read<VocabularyBottomControllerCubit>().setSelectItemCount(_currentSelectedItemCount);
        context.read<VocabularyPlayingCubit>().enablePlay(false);
        _currentPlayDataList.clear();
        await autoScrollController.scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
        _stopAudio();
      }
    else
      {
        _currentPlayDataList = _getSelectedList();
        if(_currentPlayDataList.isNotEmpty)
        {
          _isSequencePlay = true;
          _isSelectAll = true;
          context.read<VocabularyItemListCubit>().setVocabularyItemList(_currentPlayDataList);
          context.read<VocabularyBottomControllerCubit>().setSelectItemCount(0);
          context.read<VocabularyPlayingCubit>().enablePlay(true);

          _playVocabularyList();

        }
        else
        {
          Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_not_have_play_vocabulary']);
        }
      }
  }



}