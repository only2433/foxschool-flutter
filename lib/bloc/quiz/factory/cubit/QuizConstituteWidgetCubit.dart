
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/QuizConstituteWidgetState.dart';

class QuizConstituteWidgetCubit extends Cubit<QuizConstituteWidgetState>
{
  QuizConstituteWidgetCubit() : super(QuizConstituteWidgetState(list: []));

  void setWidgetList(List<Widget> list)
  {
    emit(QuizConstituteWidgetState(list: list));
  }

}