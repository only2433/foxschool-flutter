

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/vocabulary/api/VocabularyBloc.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsAddEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsDeleteEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsListEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyShelfListEvent.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyContentsAddState.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyContentsDeleteState.dart';
import 'package:foxschool/bloc/vocabulary/api/state/VocabularyDataListLoadedState.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyBottomControllerCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyItemListCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyPlayingCubit.dart';

import 'package:foxschool/bloc/base/BlocState.dart';


import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyStudyTypeCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyListBaseState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';

import 'package:foxschool/enum/VocabularySelectType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../data/main/MainInformationResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/MyBooksType.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/vocabulary/VocabularyDataResult.dart';
import '../../data/vocabulary/information/VocabularyInformationData.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';

class VocabularyFactoryController extends BlocController
{
  final List<int> INTERVAL_SECONDS = [0, 1, 2, 3, 5, 7, 10, 15, 20, 30];
  late StreamSubscription _subscription;
  late List<VocabularyDataResult> _vocabularyDataList;
  late List<VocabularyDataResult> _selectDataList;
  late AudioPlayer _audioPlayer;
  late MainInformationResult _mainData;
  late MyVocabularyResult _selectMyVocabularyResult;

  bool _isEnableAll = true;
  bool _isEnableWord = true;
  bool _isEnableMean  = true;
  bool _isEnableExample = true;

  bool _isSequencePlay = false;
  bool _isHaveSelectedItem = false;
  int _currentIntervalIndex = 0;
  int _currentSelectedItemCount = 0;
  int _playIndex = 0;

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
    await _getMainData();
    _currentIntervalIndex = await Preference.getInt(Common.PARAMS_VOCABULARY_INTERVAL);
    context.read<VocabularyBottomControllerCubit>().setInterval(_currentIntervalIndex);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        if(vocabularyInformationData.type == VocabularyType.VOCABULARY_CONTENTS)
          {
            BlocProvider.of<VocabularyBloc>(context).add(
                VocabularyContentsListEvent(contentID: vocabularyInformationData.id)
            );
          }
        else
          {
            BlocProvider.of<VocabularyBloc>(context).add(
              VocabularyShelfListEvent(vocabularyID: vocabularyInformationData.id)
            );
          }
      },);
    });
    _initAudioPlayer();
    _settingSubscriptions();
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  void _initAudioPlayer()
  {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((event) async{
      if(_isSequencePlay)
      {

        if(_playIndex >= _selectDataList.length - 1)
        {
          _playIndex = 0;
        }
        else
        {
          _playIndex++;
        }
        Logger.d("play index : $_playIndex,  length: ${_selectDataList.length}");
        await Future.delayed(Duration(seconds: INTERVAL_SECONDS[_currentIntervalIndex]), () async{
          await autoScrollController.scrollToIndex(_playIndex, preferPosition: AutoScrollPosition.begin);
          _playAudio(_selectDataList[_playIndex].soundUrl);
          _setCurrentPlayItem(_playIndex);
        },);
      }
    });
  }

  void _settingSubscriptions()
  {
    var blocState;
    _subscription = BlocProvider.of<VocabularyBloc>(context).stream.listen((state) async{

      Logger.d("state.runtimeType : $state.runtimeType");
      switch(state.runtimeType)
      {
        case LoadingState:
          {
            Logger.d("LoadingState");
            LoadingDialog.show(context);
            break;
          }
        case VocabularyDataListLoadedState:
          {
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

              _vocabularyDataList[i] = _vocabularyDataList[i].setLineCount(meanLineCount + exampleLineCount);

              Logger.i("index : $i , title : ${_vocabularyDataList[i].wordText}, meanLineCount: $meanLineCount, exampleLineCount: $exampleLineCount");

            }

            context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
            break;
          }
        case VocabularyContentsAddState:
          {
            Logger.d("AddVocabularyContentsLoadedState");

            blocState = state as VocabularyContentsAddState;
            MyVocabularyResult result = blocState.data;
            await _updateVocabularyData(result);

            _isHaveSelectedItem = false;
            _setCheckAll(false);

            await _getMainData();
            context.read<MainMyBooksTypeCubit>()
                .setMyBooksTypeData(
                MyBooksType.VOCABULARY,
                _mainData.bookshelfList,
                _mainData.vocabularyList
            );
            MainObserver().update();

            LoadingDialog.dismiss(context);
            CommonUtils.getInstance(context).showSuccessMessage(
                getIt<FoxschoolLocalization>().data['message_success_save_contents_in_vocabulary']
            );
            break;
          }
        case VocabularyContentsDeleteState:

          LoadingDialog.dismiss(context);
          _refreshVocabularyListData();
          _isHaveSelectedItem = false;
          _setCheckAll(false);
          Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_delete_contents']);
          break;
        case ErrorState:
          blocState = state as ErrorState;
          Fluttertoast.showToast(msg: blocState.message);
          onBackPressed();

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
    _playAudio(_selectDataList[_playIndex].soundUrl);
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
    for (int  i = 0 ; i < _selectDataList.length; i++) {
      if(i == index)
        {
          _selectDataList[i] = _selectDataList[i].setCurrentPlaying(true);
        }
      else
        {
          _selectDataList[i] = _selectDataList[i].setCurrentPlaying(false);
        }
    }

    context.read<VocabularyItemListCubit>().setVocabularyItemList(_selectDataList);
  }

  void _setCheckAll(bool isCheckAll)
  {
    if(isCheckAll)
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
    context.read<VocabularyBottomControllerCubit>().setHaveSelectedItem(isCheckAll);
    context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
  }

  Future<void> _updateVocabularyData(MyVocabularyResult data) async
  {
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    for(int i = 0 ; i < _mainData.vocabularyList.length; i++)
      {
        if(_mainData.vocabularyList[i].id == data.id)
          {
            Logger.d("change Voca ID : ${data.id}");
            dataList[i] = data;
            break;
          }
      }
    final updateMainData = _mainData.copyWith(vocabularyList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, updateMainData);
  }

  void _syncVocabularyList()
  {
    Logger.d(" size : ${_vocabularyDataList.length}");
    // Create a set from the vocabularyIDs in _selectDataList
    Set<String> selectedVocabularyIDs = _selectDataList.map((item) => item.vocabularyID).toSet();

    // Remove items from _vocabularyDataList that match the selected IDs
    _vocabularyDataList.removeWhere((item) => selectedVocabularyIDs.contains(item.vocabularyID));

    Logger.d("removed list size : ${_vocabularyDataList.length}");
  }

  void _refreshVocabularyListData() async
  {
    _syncVocabularyList();

    List<MyVocabularyResult> tempVocabularyList = _mainData.vocabularyList.toList();
    for(int i = 0; i < tempVocabularyList.length; i++)
      {
        if(vocabularyInformationData.id == tempVocabularyList[i].id)
          {
            tempVocabularyList[i] = tempVocabularyList[i].setWordCount(_vocabularyDataList.length);
            _mainData = _mainData.copyWith(vocabularyList: tempVocabularyList);
            break;
          }
      }

    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        _mainData.vocabularyList
    );

    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    MainObserver().update();
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _subscription.cancel();
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
    _isHaveSelectedItem = !_isHaveSelectedItem;

    Logger.d("_isSelectAll : $_isHaveSelectedItem");
    _setCheckAll(_isHaveSelectedItem);
  }

  void onClickSelectPlay() async
  {
    if(_isSequencePlay)
      {
        _isSequencePlay = false;
        context.read<VocabularyItemListCubit>().setVocabularyItemList(_vocabularyDataList);
        context.read<VocabularyBottomControllerCubit>().setSelectItemCount(_currentSelectedItemCount);
        context.read<VocabularyPlayingCubit>().enablePlay(false);
        _selectDataList.clear();
        await autoScrollController.scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
        _stopAudio();
      }
    else
      {
        _selectDataList = _getSelectedList();
        if(_selectDataList.isNotEmpty)
        {
          _isSequencePlay = true;
          _isHaveSelectedItem = true;
          context.read<VocabularyItemListCubit>().setVocabularyItemList(_selectDataList);
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

  void onClickAddVocabulary() async
  {
    _selectDataList = _getSelectedList();
    if(_selectDataList.isNotEmpty)
      {
        FoxSchoolDialog.showBottomAddBookSelectDialog(
            context: context,
            type: MyBooksType.VOCABULARY,
            list: _mainData.vocabularyList,
            onItemPressed: (index) {
              Logger.d("index : $index");
              _selectMyVocabularyResult = _mainData.vocabularyList[index];
              BlocProvider.of<VocabularyBloc>(context).add(
                VocabularyContentsAddEvent(
                    contentID: vocabularyInformationData.id,
                    vocabularyID: _selectMyVocabularyResult.id,
                    list: _selectDataList)
              );
            });
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_select_words_put_in_vocabulary']);
      }
  }

  void onClickDeleteVocabularyItem()
  {
    _selectDataList = _getSelectedList();
    if(_selectDataList.isNotEmpty)
      {
        FoxSchoolDialog.showSelectDialog(
            context: context,
            message: getIt<FoxschoolLocalization>().data['message_question_delete_contents_in_vocabulary'],
            buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
            onSelected: () {
              BlocProvider.of<VocabularyBloc>(context).add(
                  VocabularyContentsDeleteEvent(
                      vocabularyID: vocabularyInformationData.id,
                      data: _selectDataList)
              );
            },);
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_select_words_delete_in_vocabulary']);
      }
  }



}