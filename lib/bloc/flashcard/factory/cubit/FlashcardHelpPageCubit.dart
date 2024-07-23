

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardHelpPageState.dart';

class FlashcardHelpPageCubit extends Cubit<FlashcardHelpPageState>
{
  FlashcardHelpPageCubit() : super(FlashcardHelpPageState(isShowHelpPage: false));

  void showHelpPage(bool isVisible)
  {
    emit(FlashcardHelpPageState(isShowHelpPage: isVisible));
  }

}