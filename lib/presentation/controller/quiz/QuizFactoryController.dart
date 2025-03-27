
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/model/quiz/save_data/QuizStudyRecordData.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';

import 'package:foxschool/data/model/quiz/QuizInformationResult.dart';
import 'package:foxschool/data/model/quiz/quiz_data/QuizUserInteractionData.dart';
import 'package:foxschool/data/model/quiz/quiz_data/picture/ExamplePictureData.dart';
import 'package:foxschool/data/model/quiz/quiz_data/picture/QuizPictureData.dart';
import 'package:foxschool/data/model/quiz/quiz_data/text/QuizPhonicsTextData.dart';
import 'package:foxschool/data/model/quiz/quiz_data/text/QuizTextData.dart';
import 'package:foxschool/presentation/bloc/quiz/factory/state/QuizUserInteractionState.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizAPINotifier.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizTaskNotifier.dart';
import 'package:foxschool/presentation/controller/quiz/river_pod/QuizUINotifier.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/quiz/QuizPhonicsPlaySubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/quiz/QuizPicturePlaySubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/quiz/QuizResultSubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/quiz/QuizTextPlaySubScreen.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/model/quiz/file/FileData.dart';
import 'package:foxschool/data/model/quiz/quiz_item/QuizItemResult.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;

class QuizFactoryController extends BlocController {

  final List<String> INDEX_SOUND_LIST = [
          "cdn.littlefox.co.kr/contents/quiz/data/a.mp3",
          "cdn.littlefox.co.kr/contents/quiz/data/b.mp3"
          "cdn.littlefox.co.kr/contents/quiz/data/c.mp3"
          "cdn.littlefox.co.kr/contents/quiz/data/d.mp3"
  ];

  final String MEDIA_EXCELLENT_PATH = "mp3/quiz_excellent.mp3";
  final String MEDIA_VERYGOOD_PATH  = "mp3/quiz_verygood.mp3";
  final String MEDIA_GOODS_PATH     = "mp3/quiz_good.mp3";
  final String MEDIA_POOL_PATH      = "mp3/quiz_tryagain.mp3";
  final String MEDIA_CORRECT_PATH   = "mp3/quiz_correct.mp3";
  final String MEDIA_INCORRECT_PATH = "mp3/quiz_incorrect.mp3";

  final int PLAY_INIT = 0;
  final int PLAY_REPLAY = 1;

  final int QUIZ_IMAGE_WIDTH = 479;
  final int QUIZ_IMAGE_HEIGHT = 361;


  late QuizAPINotifierProvider _repositoryProvider;
  late QuizInformationResult _quizInformationResult;
  late Directory _currentDocumentDirectory;
  late AudioPlayer _audioPlayer;
  late AudioPlayer _effectPlayer;

  String _currentQuizType = Common.QUIZ_CODE_TEXT;
  List<QuizItemResult> _originQuizItemList = [];
  List<QuizPictureData> _pictureQuizItemList = [];
  List<QuizTextData> _textQuizItemList = [];
  List<QuizPhonicsTextData> _phonicsQuizItemList = [];
  int _maxPageCount = 0;
  int _currentPageIndex = 0;
  int _correctQuizCount = 0;
  int _totalQuizCount = 0;
  int _currentQuizIndex = 0;
  Timer? _quizTimer;
  int _quizLimitTime = 0;

  final List<QuizUserInteractionData> _userSelectDataList = [];
  final BuildContext context;
  final String contentsID;
  final PageController pageController;
  final WidgetRef widgetRef;

  QuizFactoryController({
    required this.context,
    required this.contentsID,
    required this.pageController,
    required this.widgetRef
  });


  @override
  void init() async{
    _currentPageIndex = 0;
    _maxPageCount = 0;
    _repositoryProvider = QuizAPINotifierProvider(getIt<FoxSchoolRepository>());
    pageController.addListener(_handlePageChange);

    Future.delayed(Duration.zero,(){
      widgetRef.read(quizUINotifierProvider.notifier).initData();
    });

    _initAudioPlayer();
    _settingRequestDataNotifier();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
        widgetRef.read(_repositoryProvider.notifier).requestQuizContentsData(contentsID);
      },);
    });
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _effectPlayer = AudioPlayer();
  }
  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state){
            state.maybeWhen(
                loadingState: (){
                  LoadingDialog.show(context);
                },
                authenticationErrorState: (isRestart, message) async{
                  LoadingDialog.dismiss(context);
                  if(isRestart == false)
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

                  await SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                  await Future.delayed(const Duration(milliseconds: Common.DURATION_SHORTER),() {
                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                    ));
                  },);
                },
                errorState: (message){
                  LoadingDialog.dismiss(context);
                  Fluttertoast.showToast(msg: message);
                  onBackPressed();
                },
                orElse: (){}
            );
          },
          contentsLoadedState: (data) async{
            _quizInformationResult = data;
            _settingQuizData();
            await _readyToPlay(PLAY_INIT);
          },
          saveQuizSuccessState: () {
            LoadingDialog.dismiss(context);
            widgetRef.read(quizUINotifierProvider.notifier).enableAnswerReportButton(false);
            FoxSchoolDialog.showConfirmDialog(
                context: context,
                message: getIt<FoxschoolLocalization>().data["message_quiz_save_record_success"],
                onSelected: (){

                });
          });
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
    _userSelectDataList.clear();
    _correctQuizCount = 0;
    _totalQuizCount = _quizInformationResult.quizCount;
    _quizLimitTime = _quizInformationResult.quizLimitTime;
    _currentQuizType = _quizInformationResult.quizType;
    _originQuizItemList = List.from(_quizInformationResult.questions!);
    Logger.d("origin list size : ${_originQuizItemList.length}");
    if (_currentQuizType == Common.QUIZ_CODE_TEXT && _originQuizItemList[0].questionSoundUrl != "")
    {
      _currentQuizType = Common.QUIZ_CODE_SOUND_TEXT;
    }

  }

  Future<void> _readyToPlay(int playType) async
  {
    switch (_currentQuizType) {
      case Common.QUIZ_CODE_PICTURE:
        if(playType == PLAY_INIT)
          {
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
          }
        await _makePictureQuizData();
        widgetRef.read(quizUINotifierProvider.notifier).enableContentsLoading(false);
        break;
      case Common.QUIZ_CODE_TEXT:
      case Common.QUIZ_CODE_SOUND_TEXT:
        _makeTextQuizData();
        widgetRef.read(quizUINotifierProvider.notifier).enableContentsLoading(false);
        break;
      case Common.QUIZ_CODE_PHONICS_SOUND_TEXT:
        _makePhonicsQuestion();
        widgetRef.read(quizUINotifierProvider.notifier).enableContentsLoading(false);
        break;
      default:
        break;
    }
  }

  void _initTaskboxData() {
    String timeText = CommonUtils.getInstance(context).getFormatTimeText(_quizLimitTime);
    Logger.d("_correctQuizCount:$_correctQuizCount, _totalQuizCount: $_totalQuizCount, timeText: $timeText");
    widgetRef.read(quizUINotifierProvider.notifier).setUserAnswerData(_correctQuizCount, _totalQuizCount);
    widgetRef.read(quizTaskNotifierProvider.notifier).setRemainTime(timeText);
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
    widgetRef.read(quizUINotifierProvider.notifier).setWidgetList(result);
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
    widgetRef.read(quizUINotifierProvider.notifier).setWidgetList(result);
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
    widgetRef.read(quizUINotifierProvider.notifier).setWidgetList(result);
  }



  void _handlePageChange() async
  {
    final newPageIndex = pageController.page!.round();

    if (newPageIndex != _currentPageIndex) {
      Logger.d("update currentPage : $_currentPageIndex, newPage : $newPageIndex,  maxQuizCount : $_maxPageCount");
      _currentPageIndex = newPageIndex;
      if (_currentPageIndex == _maxPageCount) {
        _enableTimer(false);
        Future.delayed(Duration.zero, (){
          widgetRef.read(quizUINotifierProvider.notifier).enableTaskBox(false);
        });
      }
      else {
        if (_currentPageIndex == 1) {
          _userSelectDataList.clear();
          Future.delayed(Duration.zero, (){
            widgetRef.read(quizUINotifierProvider.notifier).enableTaskBox(true);
          });
          await Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), (){
            _initTaskboxData();
          });
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

  void _playEffectAudio(bool isCorrect) async
  {
    if(_effectPlayer.state == PlayerState.playing)
    {
      await _effectPlayer.stop();
    }
    if(isCorrect)
    {
      await _effectPlayer.play(AssetSource(MEDIA_CORRECT_PATH));
    }
    else
    {
      await _effectPlayer.play(AssetSource(MEDIA_INCORRECT_PATH));
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
      _quizTimer = Timer.periodic(const Duration(milliseconds: Common.DURATION_LONG), (timer) {
        _checkQuizLimitTime();
      });
    }
    else {
      _quizTimer?.cancel();
      _quizTimer = null;
    }
  }

  void _checkQuizLimitTime() {
    if (_quizLimitTime >= 0)
    {
      String timeText = CommonUtils.getInstance(context).getFormatTimeText(_quizLimitTime);
      widgetRef.read(quizTaskNotifierProvider.notifier).setRemainTime(timeText);
    }
    else
    {
      _enableTimer(false);
      _currentPageIndex = _maxPageCount - 1;

      Logger.d("_currentPageIndex : $_currentPageIndex");
      pageController.animateToPage(
          _currentPageIndex + 1,
          duration: const Duration(milliseconds: Common.DURATION_NORMAL),
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
        quizSequence += "${pictureData.exampleList[i].index},";
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
        incorrectIndexText = "${pictureData.getRecordIncorrectImageIndex()}r";
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
            quizSequence += "${data.exampleList[i].index},";
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
        result.add("https://${INDEX_SOUND_LIST[i]}");
      }
      else
      {
        result.add("http://${INDEX_SOUND_LIST[i]}");
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
  void dispose() {
    _enableTimer(false);

    pageController.removeListener(_handlePageChange);
    pageController.dispose();
  }

  void onSelectPictureQuizData(int selectIndex, QuizPictureData pictureData, bool isCorrect)
  {
    widgetRef.read(quizUINotifierProvider.notifier).selectPictureQuizItem(selectIndex, isCorrect);
    QuizUserInteractionData data = _makePictureQuizUserSelectData(selectIndex, pictureData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    widgetRef.read(quizUINotifierProvider.notifier).setUserAnswerData(_correctQuizCount, _totalQuizCount);
  }

  void onSelectTextQuizData(int selectIndex, QuizTextData textData, bool isCorrect)
  {
    widgetRef.read(quizUINotifierProvider.notifier).selectTextQuizItem(selectIndex, isCorrect);
    QuizUserInteractionData data = _makeTextQuizUserSelectData(selectIndex, textData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    widgetRef.read(quizUINotifierProvider.notifier).setUserAnswerData(_correctQuizCount, _totalQuizCount);
  }

  void onSelectPhonicsQuizData(int selectIndex, QuizPhonicsTextData phonicsData, bool isCorrect)
  {
    widgetRef.read(quizUINotifierProvider.notifier).selectTextQuizItem(selectIndex, isCorrect);
    QuizUserInteractionData data = _makePhonicsQuizUserSelectData(selectIndex, phonicsData);
    _userSelectDataList.add(data);
    _correctQuizCount = data.isCorrect ? _correctQuizCount + 1 : _correctQuizCount;
    widgetRef.read(quizUINotifierProvider.notifier).setUserAnswerData(_correctQuizCount, _totalQuizCount);
  }

  void onClickPlayAudioButton()
  {
    _playAudio(_originQuizItemList[_currentQuizIndex].questionSoundUrl);
  }

  void onPlayCorrectSound(bool isCorrect)
  {
    _playEffectAudio(isCorrect);
  }

  void onClickNextButton() async
  {
    Logger.d("");
    await Future.delayed(Duration.zero, (){
      widgetRef.read(quizUINotifierProvider.notifier).initUserInteraction();
    });
    pageController.animateToPage(
        _currentPageIndex + 1,
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn);
  }

  void onClickSaveScoreButton() async
  {
    if(_quizLimitTime <= 0)
      {
        FoxSchoolDialog.showConfirmDialog(
            context: context,
            message: getIt<FoxschoolLocalization>().data['message_quiz_limit_not_save'],
            onSelected: (){

            });
      }
    else
      {
        LoadingDialog.show(context);
        final requestData = QuizStudyRecordData(
            contentsID: contentsID, dataList: _userSelectDataList);
        widgetRef.read(_repositoryProvider.notifier).requestSaveQuizRecord(requestData);
      }
  }

  void onClickReplayButton() async
  {
    await Future.delayed(Duration.zero, (){
      widgetRef.read(quizUINotifierProvider.notifier).initUserInteraction();
    });
    _settingQuizData();
    await _readyToPlay(PLAY_REPLAY);
    pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastEaseInToSlowEaseOut);
  }
}