
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardConstituteWidgetState.dart';

class FlashcardConstituteWidgetCubit extends Cubit<FlashcardConstituteWidgetState>
{
  FlashcardConstituteWidgetCubit() : super(const FlashcardConstituteWidgetState(list: []));

  void setWidgetList(List<Widget> list)
  {
    emit(FlashcardConstituteWidgetState(list: list));
  }

}