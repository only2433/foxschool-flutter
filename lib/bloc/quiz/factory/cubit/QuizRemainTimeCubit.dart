
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizRemainTimeState.dart';

class QuizRemainTimeCubit extends Cubit<QuizRemainTimeState>
{
  QuizRemainTimeCubit() : super(QuizRemainTimeState(time: '--:--'));

  void setRemainTime(String data)
  {
    emit(QuizRemainTimeState(time: data));
  }

}