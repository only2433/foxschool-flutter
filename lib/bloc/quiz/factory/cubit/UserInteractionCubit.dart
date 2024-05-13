
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/UserInteractionState.dart';

class UserInteractionCubit extends Cubit<UserInteractionState>
{
  UserInteractionCubit() : super(UserInteractionState(pictureQuizSelectIndex: -1, textQuizSelectIndex: -1, isCorrect: false, isSelectedComplete: false));

  void selectPictureQuiz(int index, bool isCorrect)
  {
    emit(UserInteractionState(pictureQuizSelectIndex: index, textQuizSelectIndex: -1, isCorrect: isCorrect, isSelectedComplete: true));
  }

  void selectTextQuiz(int index, bool isCorrect)
  {
    emit(UserInteractionState(pictureQuizSelectIndex: -1, textQuizSelectIndex: index, isCorrect: isCorrect, isSelectedComplete: true));
  }

}