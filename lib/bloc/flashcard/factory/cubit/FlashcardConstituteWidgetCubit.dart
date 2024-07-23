
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardConstituteWidgetState.dart';

class FlashcardConstituteWidgetCubit extends Cubit<FlashcardConstituteWidgetState>
{
  FlashcardConstituteWidgetCubit() : super(FlashcardConstituteWidgetState(list: []));

  void setWidgetList(List<Widget> list)
  {
    emit(FlashcardConstituteWidgetState(list: list));
  }

}