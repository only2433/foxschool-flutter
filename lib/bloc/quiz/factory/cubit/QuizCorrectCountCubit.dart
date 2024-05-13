
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizCorrectCountState.dart';

class QuizCorrectCountCubit extends Cubit<QuizCorrectCountState>
{
  QuizCorrectCountCubit() : super(QuizCorrectCountState(correctCount: 0, totalCount: 0));

  void setCorrectCount(int answerCount, int totalCount)
  {
    emit(QuizCorrectCountState(correctCount: answerCount, totalCount: totalCount));
  }

}