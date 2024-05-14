
import 'dart:math';

import '../../quiz_item/QuizItemResult.dart';
import 'ExampleTextData.dart';

class QuizPhonicsTextData
{
  final int MAX_ITEM_SIZE = 3;

  final int quizIndex;
  final int serverSequenceIndex;
  List<QuizItemResult> dataList;
  List<ExampleTextData> exampleList = [];
  QuizPhonicsTextData({required this.quizIndex, required this.dataList}) : serverSequenceIndex = dataList[quizIndex].questionIndex
  {
    init();
  }

  void init()
  {
    exampleList = [];
    QuizItemResult answerItem = dataList.removeAt(quizIndex);
    dataList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
    dataList = dataList.sublist(0 , MAX_ITEM_SIZE - 1);
    dataList.insert(0, answerItem);
    for(int i = 0; i < dataList.length ; i++)
      {
        if(i == 0)
          {
            exampleList.add(
              ExampleTextData(
                  index: dataList[i].questionIndex,
                  text: dataList[i].questionTitle,
                  isAnswer: true)
            );
          }
        else
          {
            exampleList.add(
                ExampleTextData(
                    index: dataList[i].questionIndex,
                    text: dataList[i].questionTitle,
                    isAnswer: false)
            );
          }
      }
    exampleList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
  }

  int getQuizCorrectIndex()
  {
    for (int i = 0; i < exampleList.length; i++)
    {
      if(exampleList[i].isAnswer)
        {
          return exampleList[i].index;
        }
    }
    return 0;
  }
}