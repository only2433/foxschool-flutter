

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/enum/VocabularySelectType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/controller/vocabulary/river_pod/VocabularyAPINotifier.dart';
import 'package:foxschool/presentation/controller/vocabulary/river_pod/VocabularyUINotifier.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/data/model/vocabulary/information/VocabularyInformationData.dart';


class VocabularyFactoryController extends BlocController
{
  final List<int> INTERVAL_SECONDS = [0, 1, 2, 3, 5, 7, 10, 15, 20, 30];
  late StreamSubscription _subscription;
  late List<VocabularyDataResult> _vocabularyDataList;
  late List<VocabularyDataResult> _selectDataList;
  late AudioPlayer _audioPlayer;
  late MainInformationResult _mainData;
  late MyVocabularyResult _selectMyVocabularyResult;
  late VocabularyAPINotifierProvider _repositoryProvider;

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
  final WidgetRef widgetRef;
  VocabularyFactoryController({
    required this.context,
    required this.vocabularyInformationData,
    required this.autoScrollController,
    required this.widgetRef
  });

  @override
  void init() async {
    _repositoryProvider = vocabularyAPINotifierProvider(getIt<FoxSchoolRepository>());
    Future.delayed(Duration.zero, (){
      widgetRef.read(vocabularyUINotifierProvider.notifier).updateContentsLoadingState(isDataLoading: true);
    });
    await _getMainData();
    _currentIntervalIndex = await Preference.getInt(Common.PARAMS_VOCABULARY_INTERVAL, defaultData: 2);
    Future.delayed(Duration.zero, (){
      widgetRef.read(vocabularyUINotifierProvider.notifier).setPlayIntervalIndex(_currentIntervalIndex);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        if(vocabularyInformationData.type == VocabularyType.VOCABULARY_CONTENTS)
        {
          widgetRef.read(_repositoryProvider.notifier).requestVocabularyContentsList(vocabularyInformationData.id);
        }
        else
        {
          widgetRef.read(_repositoryProvider.notifier).requestVocabularyMyBooksList(vocabularyInformationData.id);
        }
      },);
    });
    _initAudioPlayer();
    _settingRequestDataNotifier();
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
        Logcats.message("play index : $_playIndex,  length: ${_selectDataList.length}");
        await Future.delayed(Duration(seconds: INTERVAL_SECONDS[_currentIntervalIndex]), () async{
          await autoScrollController.scrollToIndex(_playIndex, preferPosition: AutoScrollPosition.begin);
          _playAudio(_selectDataList[_playIndex].soundUrl);
          _setCurrentPlayItem(_playIndex);
        },);
      }
    });
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state) {
            state.maybeWhen(
                loadingState: (){
                  LoadingDialog.show(context);
                },
                errorState: (message){
                  LoadingDialog.dismiss(context);
                  Fluttertoast.showToast(msg: message);
                  onBackPressed();
                },
                authenticationErrorState: (isAutoRestart, message) async{
                  if(isAutoRestart == false)
                  {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );
                },
                orElse: (){}
            );
          },
          vocabularyContentsLoadedState: (data) {
            _vocabularyDataList = data;
            Logcats.message("_vocabularyDataList.size: ${_vocabularyDataList.length}");

            // 새로운 리스트 생성
            List<VocabularyDataResult> newVocabularyDataList = [];

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

              // 새로운 객체를 생성하고 setLineCount() 호출
              VocabularyDataResult newVocabularyData = _vocabularyDataList[i].setLineCount(meanLineCount + exampleLineCount);
              newVocabularyDataList.add(newVocabularyData);
              Logcats.message("index : $i , title : ${_vocabularyDataList[i].wordText}, meanLineCount: $meanLineCount, exampleLineCount: $exampleLineCount");
            }
            _vocabularyDataList = newVocabularyDataList;
            widgetRef.read(vocabularyUINotifierProvider.notifier).notifyVocabularyItemList(_vocabularyDataList);
          },
          addContentsState: (data) async{
            MyVocabularyResult result = data;
            await _updateVocabularyData(result);
            _isHaveSelectedItem = false;
            _setCheckAll(false);
            LoadingDialog.dismiss(context);
            CommonUtils.getInstance(context).showSuccessMessage(
                getIt<FoxschoolLocalization>().data['message_success_save_contents_in_vocabulary']
            );
          },
          deleteContentsState: () {
            LoadingDialog.dismiss(context);
            _refreshVocabularyListData();
            _isHaveSelectedItem = false;
            _setCheckAll(false);
            Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_success_delete_contents']);
          },);
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
    widgetRef.read(vocabularyUINotifierProvider.notifier).notifyVocabularyItemList(_selectDataList);
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

    widgetRef.read(vocabularyUINotifierProvider.notifier)
      ..setSelectItemCount(_currentSelectedItemCount)
      ..enableHaveSelectedItem(isCheckAll)
      ..notifyVocabularyItemList(_vocabularyDataList);
  }

  Future<void> _updateVocabularyData(MyVocabularyResult data) async
  {
    await _getMainData();
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    for(int i = 0 ; i < _mainData.vocabularyList.length; i++)
    {
      if(_mainData.vocabularyList[i].id == data.id)
      {
        Logcats.message("change Voca ID : ${data.id}");
        dataList[i] = data;
        break;
      }
    }

    _mainData = _mainData.copyWith(vocabularyList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    MainObserver().update();

    widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        _mainData.vocabularyList);
  }

  void _syncVocabularyList()
  {
    Logcats.message(" size : ${_vocabularyDataList.length}");
    // Create a set from the vocabularyIDs in _selectDataList
    Set<String> selectedVocabularyIDs = _selectDataList.map((item) => item.vocabularyID).toSet();

    // Remove items from _vocabularyDataList that match the selected IDs
    _vocabularyDataList.removeWhere((item) => selectedVocabularyIDs.contains(item.vocabularyID));

    Logcats.message("removed list size : ${_vocabularyDataList.length}");
  }

  void _refreshVocabularyListData() async
  {
    await _getMainData();
    _syncVocabularyList();
    List<MyVocabularyResult> tempVocabularyList = _mainData.vocabularyList.toList();
    for(int i = 0; i < tempVocabularyList.length; i++)
    {
      if(vocabularyInformationData.id == tempVocabularyList[i].id)
      {
        tempVocabularyList[i] = tempVocabularyList[i].copyWith(wordsCount: _vocabularyDataList.length);
        _mainData = _mainData.copyWith(vocabularyList: tempVocabularyList);
        break;
      }
    }
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    MainObserver().update();

    widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        _mainData.vocabularyList);
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
    Logcats.message("_isSequencePlay : $_isSequencePlay");

    if(_isSequencePlay)
      {
        return;
      }

    if(type == VocabularySelectType.ALL)
    {
      _isEnableAll = !_isEnableAll;
      if(_isEnableAll)
      {
        _isEnableWord = true;
        _isEnableMean = true;
        _isEnableExample = true;
      }
      else
      {
        _isEnableWord = false;
        _isEnableMean = false;
        _isEnableExample = false;
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
    }

    widgetRef.read(vocabularyUINotifierProvider.notifier).setPlayType(
        isSelectAll: _isEnableAll,
        isSelectWord: _isEnableWord,
        isSelectMean: _isEnableMean,
        isSelectExample: _isEnableExample
    );
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


    widgetRef.read(vocabularyUINotifierProvider.notifier).notifyVocabularyItemList(_vocabularyDataList);

    _currentSelectedItemCount = _getSelectedItemCount();

    Logcats.message("index : $index, isSelected : ${_vocabularyDataList[index].isSelected}, selectCount: $_currentSelectedItemCount");
    if(_currentSelectedItemCount  > 0)
    {
      _isHaveSelectedItem = true;
    }
    else
    {
      _isHaveSelectedItem = false;
    }
    widgetRef.read(vocabularyUINotifierProvider.notifier)
      ..enableHaveSelectedItem(_isHaveSelectedItem)
      ..setSelectItemCount(_currentSelectedItemCount);
  }

  void onPlayItem(int index)
  {
    _playAudio(_vocabularyDataList[index].soundUrl);
  }

  void onClickInterval() async
  {
    Logcats.message("");
    int currentIndex = await Preference.getInt(Common.PARAMS_VOCABULARY_INTERVAL);
    FoxSchoolDialog.showBottomIntervalSelectDialog(
      context: context,
      currentIntervalIndex: currentIndex, onItemPressed: (index) async{
      await Preference.setInt(Common.PARAMS_VOCABULARY_INTERVAL, index);

      widgetRef.read(vocabularyUINotifierProvider.notifier).setPlayIntervalIndex(index);
    },);
  }

  void onClickSelectAll()
  {
    _isHaveSelectedItem = !_isHaveSelectedItem;

    Logcats.message("_isSelectAll : $_isHaveSelectedItem");
    _setCheckAll(_isHaveSelectedItem);
  }

  void onClickSelectPlay() async
  {
    if(_isSequencePlay)
    {
      _isSequencePlay = false;
      widgetRef.read(vocabularyUINotifierProvider.notifier)
        ..notifyVocabularyItemList(_vocabularyDataList)
        ..setSelectItemCount(_currentSelectedItemCount)
        ..enablePlay(false);
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
        widgetRef.read(vocabularyUINotifierProvider.notifier)
          ..notifyVocabularyItemList(_selectDataList)
          ..setSelectItemCount(0)
          ..enablePlay(true);
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
      FoxSchoolDialog.showBottomAddVocabularySelectDialog(
          context: context,
          list: _mainData.vocabularyList,
          onItemPressed: (index) {
            Logcats.message("index : $index");
            _selectMyVocabularyResult = _mainData.vocabularyList[index];
            widgetRef.read(_repositoryProvider.notifier).requestAddContents(
                vocabularyInformationData.id,
                _selectMyVocabularyResult.id,
                _selectDataList);
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
          widgetRef.read(_repositoryProvider.notifier).requestDeleteContents(
              vocabularyInformationData.id,
              _selectDataList);
        });
    }
    else
    {
      Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_select_words_delete_in_vocabulary']);
    }
  }



}