
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizUserInteractionState.dart';

class QuizUserInteractionCubit extends Cubit<QuizUserInteractionState>
{
  QuizUserInteractionCubit() : super(QuizUserInteractionState(pictureQuizSelectIndex: -1, textQuizSelectIndex: -1, isCorrect: false, isSelectedComplete: false));

  void selectPictureQuiz(int index, bool isCorrect)
  {
    emit(QuizUserInteractionState(pictureQuizSelectIndex: index, textQuizSelectIndex: -1, isCorrect: isCorrect, isSelectedComplete: true));
  }

  void selectTextQuiz(int index, bool isCorrect)
  {
    emit(QuizUserInteractionState(pictureQuizSelectIndex: -1, textQuizSelectIndex: index, isCorrect: isCorrect, isSelectedComplete: true));
  }

}