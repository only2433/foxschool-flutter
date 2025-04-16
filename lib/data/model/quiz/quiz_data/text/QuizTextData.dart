
import 'dart:math';

import '../../quiz_item/QuizItemResult.dart';
import 'ExampleTextData.dart';

class QuizTextData
{
  String title = "";
  String soundUrl = "";
  List<ExampleTextData> exampleList = [];
  final int quizIndex;
  final int serverSequenceIndex;
  final QuizItemResult quizItemResult;
  QuizTextData({required this.quizIndex, required this.serverSequenceIndex, required this.quizItemResult})
  {
    title = quizItemResult.questionTitle;
    soundUrl = quizItemResult.questionSoundUrl;
    init();
  }

  void init()
  {
    exampleList = [];
    int quizCorrectTextIndex = quizItemResult.answerIndex;
    for(int i = 0 ; i < quizItemResult.examples.length; i++)
      {
        if(quizCorrectTextIndex == quizItemResult.examples[i].exampleIndex)
          {
            exampleList.add(
                ExampleTextData(
                    index: quizItemResult.examples[i].exampleIndex,
                    text: quizItemResult.examples[i].exampleText,
                    soundUrl: quizItemResult.examples[i].exampleSoundUrl,
                    isAnswer: true)
            );
          }
        else
          {
            exampleList.add(
                ExampleTextData(
                    index: quizItemResult.examples[i].exampleIndex,
                    text: quizItemResult.examples[i].exampleText,
                    soundUrl: quizItemResult.examples[i].exampleSoundUrl,
                    isAnswer: false)
            );
          }
      }
    exampleList.shuffle(Random(DateTime.now().microsecondsSinceEpoch));
  }

  int getQuizIndex()
  {
    return quizIndex + 1;
  }

  int getQuizCorrectIndex()
  {
    for(int i = 0 ; i < exampleList.length; i++)
      {
        if(exampleList[i].isAnswer)
          {
            return exampleList[i].index;
          }
      }
    return 0;
  }


}