

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Fluttertoast.dart';

import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataObject.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';


import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/enum/FlashcardPlayType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardAPINotifier.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardTaskNotifier.dart';
import 'package:foxschool/presentation/controller/flashcard/river_pod/FlashcardUINotifier.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/flashcard/FlashcardBookmarkSubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/flashcard/FlashcardResultSubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/flashcard/FlashcardStudySubScreen.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataResult.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/MyBooksType.dart';



class FlashcardFactoryController extends BlocController {

  final int DURAION_AUTO_PLAY = 3000;
  late MainInformationResult _mainData;
  late List<FlashcardDataResult> _studyCardList;
  late List<FlashcardDataResult> _bookmarkedList;
  late PageController _studyPageController;
  late List<VocabularyDataResult> _originDataList;
  late FlashcardAPINotifierProvider _repositoryProvider;

  FlashcardPlayType _currentFlashcardPlayType = FlashcardPlayType.DEFAULT;
  bool _isSelectAutoPlay = false;
  bool _isRandomPlay = false;
  int _currentPageIndex = 0;
  int _currentFlashcardIndex = 0;
  int _maxStudyItemCount = 0;
  Timer? _autoPlayTimer;


  final BuildContext context;
  final PageController subScreenPageController;
  final FlashcardDataObject flashcardDataObject;
  final WidgetRef widgetRef;

  FlashcardFactoryController({
    required this.context,
    required this.subScreenPageController,
    required this.flashcardDataObject,
    required this.widgetRef
  });

  @override
  void init() async
  {
    _repositoryProvider = flashcardAPINotifierProvider(getIt<FoxSchoolRepository>());
    await _getMainData();
    //_settingSubscriptions();

    _settingRequestDataNotifier();

    if (flashcardDataObject.vocabularyType == VocabularyType.VOCABULARY_SHELF) {
      //TODO: 바로 세팅
    }
    else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
          widgetRef.read(_repositoryProvider.notifier).requestVocabularyContentsList(flashcardDataObject.contentsID);
        });
      });
    }
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state) {
            state.maybeWhen(
                loadingState: () {
                  LoadingDialog.show(context);
                },
                authenticationErrorState: (isAutoRestart, message) async{

                  LoadingDialog.dismiss(context);
                  if (isAutoRestart == false) {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );

                  await SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                  await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER), () {
                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                    ));
                  },);
                },
                orElse: (){}
            );
          },
          vocabularyDataLoadedState: (data) {
            _originDataList = data;
            _constituteInitList();
            _initFlashcardData(data);
            _settingCardNumber(_studyCardList);
            
            widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_studyCardList);
            widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(0, _studyCardList.length);
            LoadingDialog.dismiss(context);
          },
          addVocabularyContents: (data) async{
            Logcats.message("AddVocabularyContentsLoadedState");
            MyVocabularyResult result = data;
            await _updateVocabularyData(result);
            widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(
                MyBooksType.VOCABULARY,
                _mainData.bookshelfList,
                _mainData.vocabularyList);
            MainObserver().update();
            LoadingDialog.dismiss(context);
            CommonUtils.getInstance(context).showSuccessMessage(
                getIt<FoxschoolLocalization>().data['message_success_save_contents_in_vocabulary']
            );
          },
      );
    });
  }


  Future<void> _updateVocabularyData(MyVocabularyResult data) async
  {
    await _getMainData();
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    for (int i = 0; i < _mainData.vocabularyList.length; i++) {
      if (_mainData.vocabularyList[i].id == data.id) {
        Logcats.message("change Voca ID : ${data.id}");
        dataList[i] = data;
        break;
      }
    }
    _mainData = _mainData.copyWith(vocabularyList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
  }

  void _initFlashcardData(List<VocabularyDataResult> data) {
    _studyCardList = [];
    for (int i = 0; i < data.length; i++) {
      FlashcardDataResult item = FlashcardDataResult(vocabularyDataResult: data[i]);
      item = item.setIndex(i + 1);
      _studyCardList.add(item);
    }
  }

  void _initBookmarkData(List<FlashcardDataResult> data) {
    _bookmarkedList = [];
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i].setIndex(i + 1);
      _bookmarkedList.add(data[i]);
    }
  }

  void _settingCardNumber(List<FlashcardDataResult> data) {
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i].setCardNumber(i + 1);
    }
  }

  void _constituteInitList() {
    _currentPageIndex = 0;
    _currentFlashcardIndex = 0;
    _bookmarkedList = [];
    List<Widget> result = [];

    result.add(
        FlashcardStudySubScreen(factoryController: this)
    );
    result.add(
        FlashcardResultSubScreen(factoryController: this)
    );
    result.add(
        FlashcardBookmarkSubScreen(factoryController: this)
    );
    widgetRef.read(flashcardUINotifierProvider.notifier).setScreenWidgetList(result);
  }

  void _constituteBookmarkedList() {
    _currentPageIndex = 0;
    _currentFlashcardIndex = 0;
    List<Widget> result = [];
    result.add(
        FlashcardStudySubScreen(
            factoryController: this)
    );
    result.add(
        FlashcardBookmarkSubScreen(factoryController: this)
    );
    widgetRef.read(flashcardUINotifierProvider.notifier).setScreenWidgetList(result);
  }


  List<FlashcardDataResult> _getCurrentStudyList() {
    return _currentFlashcardPlayType == FlashcardPlayType.DEFAULT ? _studyCardList : _bookmarkedList;
  }

  List<FlashcardDataResult> _getBookmarkedList() {
    return _studyCardList.where((item) => item.isBookmark).toList();
  }

  bool _isBookmarkPlayPossible() {
    List<FlashcardDataResult> list = _getCurrentStudyList();
    for (int i = 0; i < list.length; i++) {
      if (list[i].isBookmark) {
        return true;
      }
    }
    return false;
  }

  void _animateScreenPage() {
    subScreenPageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void _animateStudyPage() {
    _studyPageController.animateToPage(
        _currentFlashcardIndex,
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void _moveToPrevStudyPage()
  {
    _currentFlashcardIndex--;
    Logcats.message("currentIndex : $_currentFlashcardIndex , list size : ${_maxStudyItemCount - 1}");
    _animateStudyPage();
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(_currentFlashcardIndex, _maxStudyItemCount);
  }

  void _moveToNextStudyPage()
  {
    _animateStudyPage();
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(_currentFlashcardIndex, _maxStudyItemCount);
  }

  void _moveToScreenPage()
  {
    if(_currentFlashcardPlayType == FlashcardPlayType.DEFAULT)
    {
      _currentPageIndex++;
      widgetRef.read(flashcardUINotifierProvider.notifier).setBookmarkPlayMode(_isBookmarkPlayPossible());
      _animateScreenPage();
    }
    else
    {
      onClickBookmarkedPlay();
    }
  }

  void _sortFlashcardStudyItemData()
  {
    if(_currentFlashcardPlayType == FlashcardPlayType.DEFAULT)
      {
        _studyCardList.sort((a,b) => a.index.compareTo(b.index));
      }
    else
      {
        _bookmarkedList.sort((a,b) => a.index.compareTo(b.index));
      }
  }

  void _randomFlashcardStudyItemData()
  {
    if(_currentFlashcardPlayType == FlashcardPlayType.DEFAULT)
      {
        _studyCardList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
      }
    else
      {
        _bookmarkedList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
      }
  }

  void _enableAutoPlayTimer(bool isEnable)
  {
    if(isEnable)
      {
        _autoPlayTimer = Timer.periodic(Duration(milliseconds: DURAION_AUTO_PLAY), (timer) {
          _currentFlashcardIndex++;
          Logcats.message("_currentFlashcardIndex : $_currentFlashcardIndex, _maxStudyItemCount : $_maxStudyItemCount");
          if(_currentFlashcardIndex <= _maxStudyItemCount - 1)
          {
            _moveToNextStudyPage();
          }
          else
          {
            _moveToScreenPage();
            _autoPlayTimer?.cancel();
            _autoPlayTimer = null;
          }
        });
      }
    else
      {
        _autoPlayTimer?.cancel();
        _autoPlayTimer = null;
      }
  }


  @override
  void dispose()
  {
    subScreenPageController.dispose();
  }

  @override
  void onBackPressed()
  {
    Logcats.message("onBackPressed");
    Navigator.of(context).pop();
  }

  /// 단어로 학습 하기 버튼
  void onClickDefaultStudyWords()
  {
    Logcats.message("_isSelectAutoPlay: $_isSelectAutoPlay");
    _constituteInitList();
    _initFlashcardData(_originDataList);
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(_studyCardList);
    _maxStudyItemCount = _studyCardList.length;
    widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_studyCardList);
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
      {
        Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
          _enableAutoPlayTimer(true);
        },);
      }
  }

  /// 단어로 학습 하기 버튼 - Bookmark
  void onClickBookmarkStudyWords()
  {
    Logcats.message("");
    _constituteBookmarkedList();
    _initBookmarkData(_getBookmarkedList());
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(_bookmarkedList);
    _maxStudyItemCount = _bookmarkedList.length;
    widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_bookmarkedList);
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }

  /// 뜻으로 학습 하기 버튼
  void onClickDefaultStudyMeans()
  {
    Logcats.message("");
    _constituteInitList();
    _initFlashcardData(_originDataList);
    if(_isRandomPlay)
      {
        _randomFlashcardStudyItemData();
      }
    _settingCardNumber(_studyCardList);
    _maxStudyItemCount = _studyCardList.length;
    widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_studyCardList);
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }
  void onClickBookmarkStudyMeans()
  {
    Logcats.message("");
    _constituteBookmarkedList();
    _initBookmarkData(_getBookmarkedList());
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(_bookmarkedList);
    _maxStudyItemCount = _bookmarkedList.length;
    widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_bookmarkedList);
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }

  void onCheckAutoPlay()
  {
    _isSelectAutoPlay = !_isSelectAutoPlay;
    widgetRef.read(flashcardUINotifierProvider.notifier).setAutoMode(_isSelectAutoPlay);
  }

  void onCheckRandomPlay()
  {
    _isRandomPlay = !_isRandomPlay;
    widgetRef.read(flashcardUINotifierProvider.notifier).setShuffleMode(_isRandomPlay);
  }


  void onShowHelpPage()
  {
    widgetRef.read(flashcardUINotifierProvider.notifier).showHelpPage(true);
  }

  void onHideHelpPage()
  {
    widgetRef.read(flashcardUINotifierProvider.notifier).showHelpPage(false);
  }

  void setStudyPageController(PageController controller)
  {
    _studyPageController = controller;
  }

  void onClickPrevButton()
  {
    Logcats.message("");
    if(_currentFlashcardIndex > 0)
      {
        _moveToPrevStudyPage();
      }
  }

  void onClickNextButton()
  {
    _currentFlashcardIndex++;
    Logcats.message("_currentFlashcardIndex : $_currentFlashcardIndex, _maxStudyItemCount : $_maxStudyItemCount");
    if(_currentFlashcardIndex <= _maxStudyItemCount - 1)
      {
        _moveToNextStudyPage();
      }
    else
      {
       _moveToScreenPage();
      }
  }

  void onCheckBookmarkItem(int index, bool isBookmark)
  {
    Logcats.message("_currentFlashcardPlayType : $_currentFlashcardPlayType");
    Logcats.message("index : $index, isBookmark : $isBookmark");
    _studyCardList[index] = _studyCardList[index].enableBookmark(isBookmark);
    widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_studyCardList);
  }

  /// 결과 화면 에서 리플레이 버튼 -> 버튼 클릭시, 학습 화면으로 이동
  void onClickReplay()
  {
    List<FlashcardDataResult> list = _getCurrentStudyList();
    _maxStudyItemCount = list.length;
    _currentFlashcardIndex = 0;
    widgetRef.read(flashcardTaskNotifierProvider.notifier).setCurrentStatus(_currentFlashcardIndex, _maxStudyItemCount);
    _currentPageIndex = 1;
    _animateScreenPage();
  }

  /// 결과 화면 에서 북마크 학습 하기 버튼 -> 버튼 클릭시, 북마크된 리스트 시작 화면으로 이동
  void onClickBookmarkedPlay()
  {
    LoadingDialog.show(context);
    _isSelectAutoPlay = false;
    _isRandomPlay = false;
    _currentFlashcardPlayType = FlashcardPlayType.BOOKMARKED;
    widgetRef.read(flashcardUINotifierProvider.notifier).setAutoMode(false);
    widgetRef.read(flashcardUINotifierProvider.notifier).setShuffleMode(false);
    _currentPageIndex++;
    _animateScreenPage();
    Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
      _studyCardList = _getBookmarkedList();
      widgetRef.read(flashcardUINotifierProvider.notifier).notifyStudyFlashcardList(_studyCardList);
      LoadingDialog.dismiss(context);
    },);


  }
}
