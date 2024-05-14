
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayTimeCubit.dart';
import 'package:foxschool/bloc/quiz/api/QuizInformationBloc.dart';
import 'package:foxschool/bloc/quiz/api/event/QuizInformationEvent.dart';
import 'package:foxschool/bloc/quiz/api/state/QuizInformationLoadedState.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/ConstituteWidgetCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/EnableTaskboxCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizCorrectCountCubit.dart';
import 'package:foxschool/bloc/quiz/factory/cubit/QuizReadyDataCubit.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizRemainTimeState.dart';
import 'package:foxschool/data/quiz/QuizInformationResult.dart';
import 'package:foxschool/data/quiz/quiz_data/QuizUserInteractionData.dart';
import 'package:foxschool/data/quiz/quiz_data/picture/ExamplePictureData.dart';
import 'package:foxschool/data/quiz/quiz_data/picture/QuizPictureData.dart';
import 'package:foxschool/data/quiz/quiz_data/text/QuizPhonicsTextData.dart';
import 'package:foxschool/data/quiz/quiz_data/text/QuizTextData.dart';
import 'package:foxschool/enum/QuizPlayType.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizPhonicsPlaySubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizPicturePlaySubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizResultSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/quiz/QuizTextPlaySubScreen.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/quiz/file/FileData.dart';
import '../../data/quiz/quiz_item/QuizItemResult.dart';
import 'factory/cubit/QuizRemainTimeCubit.dart';

class QuizFactoryController extends BlocController {

  final List<String> INDEX_SOUND_LIST = [
          "cdn.littlefox.co.kr/contents/quiz/data/a.mp3",
          "cdn.littlefox.co.kr/contents/quiz/data/b.mp3"
          "cdn.littlefox.co.kr/contents/quiz/data/c.mp3"
          "cdn.littlefox.co.kr/contents/quiz/data/d.mp3"
  ];

  final String MEDIA_EXCELLENT_PATH = "mp3/quiz_excellent.mp3";
  final String MEDIA_VERYGOOD_PATH = "mp3/quiz_verygood.mp3";
  final String MEDIA_GOODS_PATH = "mp3/quiz_good.mp3";
  final String MEDIA_POOL_PATH = "mp3/quiz_tryagain.mp3";
  final String MEDIA_CORRECT_PATH = "mp3/quiz_correct.mp3";
  final String MEDIA_INCORRECT_PATH = "mp3/quiz_incorrect.mp3";

  final int QUIZ_IMAGE_WIDTH = 479;
  final int QUIZ_IMAGE_HEIGHT = 361;


  late StreamSubscription _subscription;
  late QuizInformationResult _quizInformationResult;
  String _currentQuizType = Common.QUIZ_CODE_TEXT;
  List<QuizItemResult> _originQuizItemList = [];
  List<QuizPictureData> _pictureQuizItemList = [];
  List<QuizTextData> _textQuizItemList = [];
  List<QuizPhonicsTextData> _phonicsQuizItemList = [];
  List<QuizUserInteractionData> _userSelectDataList = [];
  late Directory _currentDocumentDirectory;
  late AudioPlayer _audioPlayer;
  int _maxPageCount = 0;
  int _currentPageIndex = 0;
  int _correctQuizCount = 0;
  int _totalQuizCount = 0;
  int _currentQuizIndex = 0;
  Timer? _quizTimer;
  int _quizLimitTime = 0;
  final BuildContext context;
  final String contentID;
  final PageController pageController;

  QuizFactoryController({
    required this.context,
    required this.contentID,
    required this.pageController
  });


  @override
  void init() {
    _currentPageIndex = 0;
    pageController.addListener(_handlePageChange);
    context.read<QuizReadyDataCubit>().showLoading();
    context.read<ConstituteWidgetCubit>().setWidgetList([]);
    context.read<EnableTaskboxCubit>().setEnable(false);
    _initAudioPlayer();
    _settingSubscription();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
        BlocProvider.of<QuizInformationBloc>(context).add(
            QuizInformationEvent(contentID: contentID)
        );
      },);
    });
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
  }

  void _settingSubscription() {
    var blocState;
    _subscription = BlocProvider
        .of<QuizInformationBloc>(context)
        .stream
        .listen((state) async {
      Logger.d("state.runtimeType : ${state.runtimeType}");
      switch (state.runtimeType) {
        case QuizInformationLoadedState:
          blocState = state as QuizInformationLoadedState;
          _quizInformationResult = blocState.data;
          _settingQuizData();
        case LoadingState:
          break;
        case ErrorState:
          blocState = state as ErrorState;
          Fluttertoast.showToast(msg: blocState.message);
          onBackPressed();
          break;
      }
    });
  }

  Future<void> _startFileDownload(List<FileData> list) async
  {
    _currentDocumentDirectory = await getApplicationDocumentsDirectory();
    for (int i = 0; i < list.length; i++) {
      final url = list[i].url;
      final response = await http.get(Uri.parse(url));
      final filePath = '${_currentDocumentDirectory.path}/${list[i].fileName}';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
    }
  }

  void _settingQuizData() async
  {
    _correctQuizCount = 0;
    _totalQuizCount = _quizInformationResult.quizCount;
    _quizLimitTime = _quizInformationResult.quizLimitTime;
    _currentQuizType = _quizInformationResult.quizType;
    _originQuizItemList = List.from(_quizInformationResult.questions!);
    Logger.d("origin list size : ${_originQuizItemList.length}");
    if (_currentQuizType == Common.QUIZ_CODE_TEXT && _originQuizItemList[0].questionSoundUrl != "") {
      _currentQuizType = Common.QUIZ_CODE_SOUND_TEXT;
    }

    switch (_currentQuizType) {
      case Common.QUIZ_CODE_PICTURE:
        List<FileData> fileList = [];
        fileList.add(
          FileData(url: _quizInformationResult.correctImageUrl, fileName: _quizInformationResult.getCorrectImageFileName()),
        );
        if (_quizInformationResult.incorrectImageUrl != "") {
          fileList.add(
            FileData(url: _quizInformationResult.incorrectImageUrl, fileName: _quizInformationResult.getIncorrectImageFileName()),
          );
        }
        await _startFileDownload(fileList);
        await _makePictureQuizData();
        context.read<QuizReadyDataCubit>().loadingComplete();
        break;
      case Common.QUIZ_CODE_TEXT:
      case Common.QUIZ_CODE_SOUND_TEXT:
        _makeTextQuizData();
        context.read<QuizReadyDataCubit>().loadingComplete();
        break;
      case Common.QUIZ_CODE_PHONICS_SOUND_TEXT:
        _makePhonicsQuestion();
        context.read<QuizReadyDataCubit>().loadingComplete();
        break;
      default:
        break;
    }
  }

  void _initTaskboxData() {
    context.read<QuizCorrectCountCubit>().setCorrectCount(_correctQuizCount, _totalQuizCount);
    String timeText = CommonUtils.getInstance(context).getFormatTimeText(_quizLimitTime);
    context.read<QuizRemainTimeCubit>().setRemainTime(timeText);
  }

  void _makeTextQuizData()
  {
    int maxQuizCount = _quizInformationResult.quizCount;
    _textQuizItemList = [];
    _originQuizItemList.shuffle(Random(DateTime
        .now()
        .microsecondsSinceEpoch));

    for(int i = 0; i < maxQuizCount ; i++)
      {
        _textQuizItemList.add(
            QuizTextData(
                quizIndex: i,
                serverSequenceIndex: _originQuizItemList[i].questionIndex,
                quizItemResult: _originQuizItemList[i]
            )
        );
      }
    _constituteTextQuizList();
  }

  void _makePhonicsQuestion()
  {
    int maxQuizCount = _quizInformationResult.quizCount;
    _phonicsQuizItemList = [];
    _originQuizItemList.shuffle(Random(DateTime
        .now()
        .microsecondsSinceEpoch));
    for(int i = 0; i < maxQuizCount ; i++)
    {
      _phonicsQuizItemList.add(
          QuizPhonicsTextData(
              quizIndex: i, dataList: List<QuizItemResult>.from(_originQuizItemList))
      );
    }
    _constitutePhonicsQuizList();
  }

  Future<void> _makePictureQuizData() async
  {
    int correctQuestionIndex = -1;
    int randImageIndex = -1;
    QuizPictureData? data;
    int maxQuizCount = _quizInformationResult.quizCount;
    List<img.Image> correctImages = [];
    _pictureQuizItemList = [];
    _originQuizItemList.shuffle(Random(DateTime
        .now()
        .microsecondsSinceEpoch));

    try {
      final filePath = '${_currentDocumentDirectory.path}/${_quizInformationResult.getCorrectImageFileName()}';
      Uint8List fileBytes = await _getBytesFromFile(filePath);
      img.Image correctImage = img.decodeImage(fileBytes)!;

      for (int i = 0; i < _originQuizItemList.length; i++) {
        final img.Image tempImage = img.copyCrop(correctImage,
            x: 0,
            y: i * QUIZ_IMAGE_HEIGHT,
            width: QUIZ_IMAGE_WIDTH,
            height: QUIZ_IMAGE_HEIGHT);
        correctImages.add(tempImage);
      }
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    if (_quizInformationResult.incorrectImageUrl == "") {
      for (int i = 0; i < maxQuizCount; i++) {
        correctQuestionIndex = _originQuizItemList[i].getCorrectIndex();
        randImageIndex = CommonUtils.getInstance(context).getRandomNumber(maxQuizCount, correctQuestionIndex);
        data = QuizPictureData(
            currentQuizIndex: i,
            title: _originQuizItemList[i].questionTitle,
            firstData: ExamplePictureData(
              index: correctQuestionIndex,
              image: correctImages[correctQuestionIndex],
            ),
            secondData: ExamplePictureData(
              index: randImageIndex,
              image: correctImages[randImageIndex],
            )
        );
        data.setRecordQuizImageValue(correctQuestionIndex, randImageIndex);
        data.shuffle();
        _pictureQuizItemList.add(data);
      }
    }
    else {
      final filePath = '${_currentDocumentDirectory.path}/${_quizInformationResult.getIncorrectImageFileName()}';
      Uint8List fileBytes = await _getBytesFromFile(filePath);
      img.Image incorrectImage = img.decodeImage(fileBytes)!;

      for (int i = 0; i < maxQuizCount; i++) {
        correctQuestionIndex = _originQuizItemList[i].getCorrectIndex();

        final img.Image tempImage = img.copyCrop(incorrectImage,
            x: 0,
            y: correctQuestionIndex * QUIZ_IMAGE_HEIGHT,
            width: QUIZ_IMAGE_WIDTH,
            height: QUIZ_IMAGE_HEIGHT);

        data = QuizPictureData(
            currentQuizIndex: i,
            title: _originQuizItemList[i].questionTitle,
            firstData: ExamplePictureData(
              index: correctQuestionIndex,
              image: correctImages[correctQuestionIndex],
            ),
            secondData: ExamplePictureData(
                index: correctQuestionIndex,
                image: tempImage
            )
        );
        data.setRecordQuizImageValue(correctQuestionIndex, correctQuestionIndex);
        data.shuffle();
        _pictureQuizItemList.add(data);
      }
    }
    correctImages.clear();
    _constitutePictureQuizList();
  }

  Future<Uint8List> _getBytesFromFile(String path) async {
    File file = File(path);
    Uint8List bytes = await file.readAsBytes();
    return bytes;
  }

  void _constitutePictureQuizList() {
    List<Widget> result = [];
    for (int i = 0; i < _pictureQuizItemList.length; i++) {
      result.add(
          QuizPicturePlayScreen(
              quizController: this, data: _pictureQuizItemList[i])
      );
    }
    result.add(QuizResultSubScreen(quizFactoryController: this));

    _maxPageCount = result.length;
    context.read<ConstituteWidgetCubit>().setWidgetList(result);
  }

  void _constituteTextQuizList()
  {
    List<Widget> result = [];
    for(int i = 0; i < _textQuizItemList.length; i++)
    {
      result.add(
        QuizTextPlaySubScreen(
            quizController: this,
            data: _textQuizItemList[i],
            currentQuizType: _currentQuizType)
      );
    }
    result.add(QuizResultSubScreen(quizFactoryController: this));

    _maxPageCount = result.length;
    context.read<ConstituteWidgetCubit>().setWidgetList(result);
  }


  void _constitutePhonicsQuizList()
  {
    List<Widget> result = [];
    for(int i = 0; i < _phonicsQuizItemList.length; i++)
    {
      result.add(
          QuizPhonicsPlaySubScreen(
              quizController: this,
              data: _phonicsQuizItemList[i],
              currentQuizType: _currentQuizType)
      );
    }
    result.add(QuizResultSubScreen(quizFactoryController: this));

    _maxPageCount = result.length;
    context.read<ConstituteWidgetCubit>().setWidgetList(result);
  }



  void _handlePageChange() async
  {
    final newPageIndex = pageController.page!.round();
    if (newPageIndex != _currentPageIndex && newPageIndex > _currentPageIndex) {
      Logger.d("update currentPage : $_currentPageIndex, newPage : $newPageIndex,  maxQuizCount : $_maxPageCount");
      _currentPageIndex = newPageIndex;
      if (_currentPageIndex == _maxPageCount) {
        _enableTimer(false);
        context.read<EnableTaskboxCubit>().setEnable(false);
      }
      else {
        context.read<EnableTaskboxCubit>().setEnable(true);
        if (_currentPageIndex == 1) {
          _userSelectDataList.clear();
          _initTaskboxData();
          _enableTimer(true);
        }
        _currentQuizIndex = _currentPageIndex - 1;
        if (_currentQuizType == Common.QUIZ_CODE_PICTURE || _currentQuizType == Common.QUIZ_CODE_PHONICS_SOUND_TEXT)
        {
          Logger.d("quizIndex : $_currentQuizIndex , url : ${_originQuizItemList[_currentQuizIndex].questionSoundUrl}");
          _playAudio(_originQuizItemList[_currentQuizIndex].questionSoundUrl);
        }
        else if(_currentQuizType == Common.QUIZ_CODE_SOUND_TEXT)
        {
          _playAudioList(getQuizExampleSoundList(_currentQuizIndex));
        }
      }
    }
  }

  void _playAudio(String url) async
  {
    if (_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.stop();
    }
    await _audioPlayer.play(UrlSource(url));
  }

  void _playAudioList(List<String> playList)
  {
    int index = 0;
    _playAudio(playList[index]);
    _audioPlayer.onPlayerComplete.listen((event) {
      index++;
      if(index < playList.length)
        {
          _playAudio(playList[index]);
        }
    });
  }

  void _enableTimer(bool isEnable) {
    if (isEnable) {
      _quizTimer = Timer.periodic(Duration(milliseconds: Common.DURATION_LONG), (timer) {
        _checkQuizLimitTime();
      });
    }
    else {
      _quizTimer?.cancel();
      _quizTimer = null;
    }
  }

  void _checkQuizLimitTime() {
    if (_quizLimitTime >= 0) {
      String timeText = CommonUtils.getInstance(context).getFormatTimeText(_quizLimitTime);
      context.read<QuizRemainTimeCubit>().setRemainTime(timeText);
    }
    else {
      _enableTimer(false);
      _currentPageIndex = _maxPageCount - 1;

      Logger.d("_currentPageIndex : $_currentPageIndex");
      pageController.animateToPage(
          _currentPageIndex + 1,
          duration: Duration(milliseconds: Common.DURATION_NORMAL),
          curve: Curves.fastOutSlowIn);
    }
    _quizLimitTime--;
  }

  QuizUserInteractionData _makePictureQuizUserSelectData(int selectIndex, QuizPictureData pictureData)
  {
    QuizUserInteractionData result;
    String quizSequence = "";
    String incorrectIndexText = "";
    bool isCorrect = pictureData.exampleList[selectIndex].isAnswer;

    for (int i = 0; i < pictureData.exampleList.length; i++) {
      if (i == pictureData.exampleList.length - 1) {
        quizSequence += pictureData.exampleList[i].index.toString();
      }
      else {
        quizSequence += pictureData.exampleList[i].index.toString() + ",";
      }
    }

    if (isCorrect) {
      result = QuizUserInteractionData(
          isCorrect: true,
          quizSequence: quizSequence,
          correctNo: pictureData.getRecordCorrectImageIndex(),
          chosenNo: pictureData.getRecordCorrectImageIndex().toString());
    }
    else {
      if (pictureData.getRecordCorrectImageIndex() == pictureData.getRecordIncorrectImageIndex()) {
        incorrectIndexText = pictureData.getRecordIncorrectImageIndex().toString() + "r";
      }
      else {
        incorrectIndexText = pictureData.getRecordIncorrectImageIndex().toString();
      }
      result = QuizUserInteractionData(
          isCorrect: false,
          quizSequence: quizSequence,
          correctNo: pictureData.getRecordCorrectImageIndex(),
          chosenNo: incorrectIndexText);
    }
    return result;
  }

  QuizUserInteractionData _makeTextQuizUserSelectData(int selectIndex, QuizTextData data)
  {
    QuizUserInteractionData result;
    String quizSequence = data.serverSequenceIndex.toString();
    bool isCorrect = data.exampleList[selectIndex].isAnswer;

    result = QuizUserInteractionData(
        isCorrect: isCorrect,
        quizSequence: quizSequence,
        correctNo: data.getQuizCorrectIndex(),
        chosenNo: data.exampleList[selectIndex].index.toString()
    );
    return result;
  }

  QuizUserInteractionData _makePhonicsQuizUserSelectData(int selectIndex, QuizPhonicsTextData data)
  {
    QuizUserInteractionData result;
    String quizSequence = "";
    bool isCorrect = data.exampleList[selectIndex].isAnswer;
    for(int i = 0; i < data.exampleList.length; i++)
      {
        if(i == data.exampleList.length - 1)
          {
            quizSequence += data.exampleList[i].index.toString();
          }
        else
          {
            quizSequence += data.exampleList[i].index.toString() +",";
          }
      }

    result = QuizUserInteractionData(
        isCorrect: isCorrect,
        quizSequence: quizSequence,
        correctNo: data.getQuizCorrectIndex(),
        chosenNo: data.exampleList[selectIndex].index.toString()
    );
    return result;
  }

  List<String> getQuizExampleSoundList(int index)
  {
    List<String> result = [];
    result.add(_textQuizItemList[index].soundUrl);
    bool isHttpsUseModel = _textQuizItemList[index].soundUrl.contains('https') ? true : false;

    for(int i = 0 ; i < _textQuizItemList[index].exampleList.length; i ++)
    {
      if(isHttpsUseModel)
      {
        result.add("https://"+INDEX_SOUND_LIST[i]);
      }
      else
      {
        result.add("http://"+INDEX_SOUND_LIST[i]);
      }
      result.add(_textQuizItemList[index].exampleList[i].soundUrl!);
      Logger.d("index : $i , url : ${_textQuizItemList[index].exampleList[i].soundUrl}");
    }
    return result;
  }

  @override
  void onBackPressed() async{
    Logger.d("onBackPressed");
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
    _subscription.cancel();
    pageController.removeListener(_handlePageChange);
    pageController.dispose();
  }

  void onSelectPictureQuizData(int selectIndex, QuizPictureData pictureData)
  {
    QuizUserInteractionData data = _makePictureQuizUserSelectData(selectIndex, pictureData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    context.read<QuizCorrectCountCubit>().setCorrectCount(_correctQuizCount, _totalQuizCount);
  }

  void onSelectTextQuizData(int selectIndex, QuizTextData textData)
  {
    QuizUserInteractionData data = _makeTextQuizUserSelectData(selectIndex, textData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    context.read<QuizCorrectCountCubit>().setCorrectCount(_correctQuizCount, _totalQuizCount);
  }

  void onSelectPhonicsQuizData(int selectIndex, QuizPhonicsTextData phonicsData)
  {
    QuizUserInteractionData data = _makePhonicsQuizUserSelectData(selectIndex, phonicsData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    context.read<QuizCorrectCountCubit>().setCorrectCount(_correctQuizCount, _totalQuizCount);
  }

  void onClickPlayAudioButton()
  {
    _playAudio(_originQuizItemList[_currentQuizIndex].questionSoundUrl);
  }

  void onClickNextButton()
  {
    Logger.d("");
    pageController.animateToPage(
        _currentPageIndex + 1,
        duration: Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void onClickSaveScoreButton()
  {

  }

  void onClickReplayButton()
  {

  }
}