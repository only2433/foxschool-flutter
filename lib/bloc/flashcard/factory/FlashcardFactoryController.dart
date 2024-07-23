
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardBookmarkOptionSelectCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardBookmarkedCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardConstituteWidgetCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardHelpPageCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardOptionSelectCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardStudyCurrentIndexCubit.dart';
import 'package:foxschool/bloc/flashcard/factory/cubit/FlashcardStudyListUpdateCubit.dart';
import 'package:foxschool/bloc/vocabulary/api/event/VocabularyContentsListEvent.dart';
import 'package:foxschool/data/vocabulary/VocabularyDataResult.dart';
import 'package:foxschool/enum/FlashcardPlayType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/view/screen/sub_screen/flashcard/FlashcardBookmarkSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/flashcard/FlashcardResultSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/flashcard/FlashcardStudySubScreen.dart';

import '../../../common/Common.dart';
import '../../../common/CommonUtils.dart';
import '../../../common/FoxschoolLocalization.dart';
import '../../../common/MainObserver.dart';
import '../../../data/flashcard/FlashcardDataResult.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/view/dialog/BottomContentItemDialog.dart' as BottomContentDialog;
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;

import '../../../data/main/MainInformationResult.dart';
import '../../../data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../../di/Dependencies.dart';
import '../../../enum/MyBooksType.dart';
import '../../main/factory/cubit/MainMyBooksTypeCubit.dart';
import '../../vocabulary/api/state/VocabularyContentsAddState.dart';
import '../../vocabulary/api/state/VocabularyDataListLoadedState.dart';
import '../api/FlashcardBloc.dart';

class FlashcardFactoryController extends BlocController {

  final int DURAION_AUTO_PLAY = 3000;
  late StreamSubscription _subscription;
  late MainInformationResult _mainData;
  late List<FlashcardDataResult> _bookmarkedList;
  late PageController _studyPageController;
  late List<VocabularyDataResult> _originDataList;

  FlashcardPlayType _currentFlashcardPlayType = FlashcardPlayType.DEFAULT;
  bool _isSelectAutoPlay = false;
  bool _isRandomPlay = false;
  int _currentPageIndex = 0;
  int _currentFlashcardIndex = 0;
  int _maxStudyItemCount = 0;
  Timer? _autoPlayTimer;


  final BuildContext context;
  final PageController subScreenPageController;
  final String contentID;
  final VocabularyType vocabularyType;
  List<FlashcardDataResult> flashcardList;

  FlashcardFactoryController({
    required this.context,
    required this.subScreenPageController,
    required this.contentID,
    required this.vocabularyType,
    required this.flashcardList
  });

  @override
  void init() async
  {
    await _getMainData();
    _settingSubscriptions();

    if (vocabularyType == VocabularyType.VOCABULARY_SHELF) {
      //TODO: 바로 세팅
    }
    else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
          BlocProvider.of<FlashcardBloc>(context).add(
              VocabularyContentsListEvent(contentID: contentID)
          );
        });
      });
    }
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  void _settingSubscriptions() {
    var blocState;
    _subscription = BlocProvider
        .of<FlashcardBloc>(context)
        .stream
        .listen((state) async {
      Logger.d("state : ${state.toString()}");
      switch (state.runtimeType) {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case VocabularyDataListLoadedState:
          blocState = state as VocabularyDataListLoadedState;
          _originDataList = blocState.data;
/*          _constituteInitList();
          _initFlashcardData(blocState.data);
          _settingCardNumber(flashcardList);
          context.read<FlashcardStudyListUpdateCubit>().setData(flashcardList);
          context.read<FlashcardStudyCurrentIndexCubit>().setIndex(0, flashcardList.length);*/
          LoadingDialog.dismiss(context);
          break;
        case VocabularyContentsAddState:
          {
            Logger.d("AddVocabularyContentsLoadedState");
            blocState = state as VocabularyContentsAddState;
            MyVocabularyResult result = blocState.data;
            await _updateVocabularyData(result);

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
        case AuthenticationErrorState:
          blocState = state as AuthenticationErrorState;
          LoadingDialog.dismiss(context);
          if (blocState.isAutoRestart == false) {
            await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
          }
          Fluttertoast.showToast(msg: blocState.message);
          Navigator.pushAndRemoveUntil(
            context,
            Page.getIntroTransition(context),
                (route) => false,
          );

          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          await Future.delayed(Duration(milliseconds: Common.DURATION_SHORTER), () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
            ));
          },);

          break;
        case ErrorState:
          blocState = state as ErrorState;
          LoadingDialog.dismiss(context);
          Fluttertoast.showToast(msg: blocState.message);
          onBackPressed();
          break;
      }
    });
  }

  Future<void> _updateVocabularyData(MyVocabularyResult data) async
  {
    await _getMainData();
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    for (int i = 0; i < _mainData.vocabularyList.length; i++) {
      if (_mainData.vocabularyList[i].id == data.id) {
        Logger.d("change Voca ID : ${data.id}");
        dataList[i] = data;
        break;
      }
    }
    _mainData = _mainData.copyWith(vocabularyList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
  }

  void _initFlashcardData(List<VocabularyDataResult> data) {
    flashcardList = [];
    for (int i = 0; i < data.length; i++) {
      FlashcardDataResult item = FlashcardDataResult(vocabularyDataResult: data[i]);
      item = item.setIndex(i + 1);
      flashcardList.add(item);
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
    context.read<FlashcardConstituteWidgetCubit>().setWidgetList(result);
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
    context.read<FlashcardConstituteWidgetCubit>().setWidgetList(result);
  }


  List<FlashcardDataResult> _getCurrentStudyList() {
    return _currentFlashcardPlayType == FlashcardPlayType.DEFAULT ? flashcardList : _bookmarkedList;
  }

  List<FlashcardDataResult> _getBookmarkedList() {
    return flashcardList.where((item) => item.isBookmark).toList();
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
        duration: Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void _animateStudyPage() {
    _studyPageController.animateToPage(
        _currentFlashcardIndex,
        duration: Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void _moveToPrevStudyPage()
  {
    _currentFlashcardIndex--;
    Logger.d("currentIndex : $_currentFlashcardIndex , list size : ${_maxStudyItemCount - 1}");
    _animateStudyPage();
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(_currentFlashcardIndex, _maxStudyItemCount);
  }

  void _moveToNextStudyPage()
  {
    _animateStudyPage();
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(_currentFlashcardIndex, _maxStudyItemCount);
  }

  void _moveToScreenPage()
  {
    if(_currentFlashcardPlayType == FlashcardPlayType.DEFAULT)
    {
      _currentPageIndex++;
      context.read<FlashcardBookmarkedCubit>().checkBookmark(_isBookmarkPlayPossible());
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
        flashcardList.sort((a,b) => a.index.compareTo(b.index));
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
        flashcardList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
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
          Logger.d("_currentFlashcardIndex : $_currentFlashcardIndex, _maxStudyItemCount : $_maxStudyItemCount");
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
    _subscription.cancel();
    subScreenPageController.dispose();
  }

  @override
  void onBackPressed()
  {
    Logger.d("onBackPressed");
    Navigator.of(context).pop();
  }

  /// 단어로 학습 하기 버튼
  void onClickDefaultStudyWords()
  {
    Logger.d("_isSelectAutoPlay: $_isSelectAutoPlay");
    _constituteInitList();
    _initFlashcardData(_originDataList);
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(flashcardList);
    _maxStudyItemCount = flashcardList.length;
    context.read<FlashcardStudyListUpdateCubit>().setData(flashcardList);
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
      {
        Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
          _enableAutoPlayTimer(true);
        },);
      }
  }

  /// 단어로 학습 하기 버튼 - Bookmark
  void onClickBookmarkStudyWords()
  {
    Logger.d("");
    _constituteBookmarkedList();
    _initBookmarkData(_getBookmarkedList());
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(_bookmarkedList);
    _maxStudyItemCount = _bookmarkedList.length;
    context.read<FlashcardStudyListUpdateCubit>().setData(_bookmarkedList);
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }

  /// 뜻으로 학습 하기 버튼
  void onClickDefaultStudyMeans()
  {
    Logger.d("");
    _constituteInitList();
    _initFlashcardData(_originDataList);
    if(_isRandomPlay)
      {
        _randomFlashcardStudyItemData();
      }
    _settingCardNumber(flashcardList);
    _maxStudyItemCount = flashcardList.length;
    context.read<FlashcardStudyListUpdateCubit>().setData(flashcardList);
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }
  void onClickBookmarkStudyMeans()
  {
    Logger.d("");
    _constituteBookmarkedList();
    _initBookmarkData(_getBookmarkedList());
    if(_isRandomPlay)
    {
      _randomFlashcardStudyItemData();
    }
    _settingCardNumber(_bookmarkedList);
    _maxStudyItemCount = _bookmarkedList.length;
    context.read<FlashcardStudyListUpdateCubit>().setData(_bookmarkedList);
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(0, _maxStudyItemCount);
    _currentPageIndex++;
    _animateScreenPage();

    if(_isSelectAutoPlay)
    {
      Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
        _enableAutoPlayTimer(true);
      },);
    }
  }

  void onCheckAutoPlay()
  {
    _isSelectAutoPlay = !_isSelectAutoPlay;
    context.read<FlashcardOptionSelectCubit>().setAutoMode(_isSelectAutoPlay);
  }

  void onCheckBookmarkAutoPlay()
  {
    _isSelectAutoPlay = !_isSelectAutoPlay;
    context.read<FlashcardBookmarkOptionSelectCubit>().setAutoMode(_isSelectAutoPlay);
  }

  void onCheckRandomPlay()
  {
    _isRandomPlay = !_isRandomPlay;
    context.read<FlashcardOptionSelectCubit>().setShuffleMode(_isRandomPlay);
  }

  void onCheckBookmarkRandomPlay()
  {
    _isRandomPlay = !_isRandomPlay;
    context.read<FlashcardBookmarkOptionSelectCubit>().setShuffleMode(_isRandomPlay);
  }

  void onShowHelpPage()
  {
    context.read<FlashcardHelpPageCubit>().showHelpPage(true);
  }

  void onHideHelpPage()
  {
    context.read<FlashcardHelpPageCubit>().showHelpPage(false);
  }

  void setStudyPageController(PageController controller)
  {
    _studyPageController = controller;
  }

  void onClickPrevButton()
  {
    Logger.d("");
    if(_currentFlashcardIndex > 0)
      {
        _moveToPrevStudyPage();
      }
  }

  void onClickNextButton()
  {
    _currentFlashcardIndex++;
    Logger.d("_currentFlashcardIndex : $_currentFlashcardIndex, _maxStudyItemCount : $_maxStudyItemCount");
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
    Logger.d("_currentFlashcardPlayType : $_currentFlashcardPlayType");
    Logger.d("index : $index, isBookmark : $isBookmark");
    flashcardList[index] = flashcardList[index].enableBookmark(isBookmark);
    context.read<FlashcardStudyListUpdateCubit>().setData(flashcardList);
  }

  /**
   * 결과 화면 에서 리플레이 버튼 -> 버튼 클릭시, 학습 화면으로 이동
   */
  void onClickReplay()
  {
    List<FlashcardDataResult> list = _getCurrentStudyList();
    _maxStudyItemCount = list.length;
    _currentFlashcardIndex = 0;
    context.read<FlashcardStudyCurrentIndexCubit>().setIndex(_currentFlashcardIndex, _maxStudyItemCount);
    _currentPageIndex = 1;
    _animateScreenPage();
  }

  /**
   * 결과 화면 에서 북마크 학습 하기 버튼 -> 버튼 클릭시, 북마크된 리스트 시작 화면으로 이동
   */
  void onClickBookmarkedPlay()
  {
    LoadingDialog.show(context);
    _isSelectAutoPlay = false;
    _isRandomPlay = false;
    _currentFlashcardPlayType = FlashcardPlayType.BOOKMARKED;
    context.read<FlashcardBookmarkOptionSelectCubit>().setAutoMode(false);
    context.read<FlashcardBookmarkOptionSelectCubit>().setShuffleMode(false);

    _currentPageIndex++;
    _animateScreenPage();
    Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
      flashcardList = _getBookmarkedList();

      context.read<FlashcardStudyListUpdateCubit>().setData(flashcardList);
      LoadingDialog.dismiss(context);
    },);


  }
}