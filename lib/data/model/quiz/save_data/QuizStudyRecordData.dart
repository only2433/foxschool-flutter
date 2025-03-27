
import 'package:foxschool/data/model/quiz/quiz_data/QuizUserInteractionData.dart';

class QuizStudyRecordData
{
  final String contentsID;
  final List<QuizUserInteractionData> dataList;
  QuizStudyRecordData({
    required this.contentsID,
    required this.dataList
  });

  String getContentID()
  {
    return contentsID;
  }

  List<QuizUserInteractionData> getDataList()
  {
    return dataList;
  }
}