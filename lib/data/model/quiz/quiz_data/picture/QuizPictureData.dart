
import 'dart:math';
import 'ExamplePictureData.dart';

class QuizPictureData
{

  int _quizCorrectImageIndex = 0;
  int _quizIncorrectImageIndex = 0;

  final int currentQuizIndex;
  final String title;
  late List<ExamplePictureData> exampleList;
  QuizPictureData({required this.currentQuizIndex, required this.title, required ExamplePictureData firstData, required ExamplePictureData secondData})
  {
    exampleList = [];
    exampleList.add(firstData);
    exampleList.add(secondData);
    exampleList[0].setAnswer(true);
  }

  int getQuizIndex()
  {
    return currentQuizIndex + 1;
  }

  int getRecordCorrectImageIndex()
  {
    return _quizCorrectImageIndex;
  }

  int getRecordIncorrectImageIndex()
  {
    return _quizIncorrectImageIndex;
  }

  List<ExamplePictureData> getExampleList()
  {
    return exampleList;
  }

  void setRecordQuizImageValue(int correctIndex, int incorrectIndex)
  {
    _quizCorrectImageIndex = correctIndex;
    _quizIncorrectImageIndex = incorrectIndex;
  }

  void shuffle()
  {
    exampleList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
  }


}