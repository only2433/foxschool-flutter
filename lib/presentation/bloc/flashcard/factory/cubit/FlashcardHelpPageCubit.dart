
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardHelpPageState.dart';

class FlashcardHelpPageCubit extends Cubit<FlashcardHelpPageState>
{
  FlashcardHelpPageCubit() : super(const FlashcardHelpPageState(isShowHelpPage: false));

  void showHelpPage(bool isVisible)
  {
    emit(FlashcardHelpPageState(isShowHelpPage: isVisible));
  }

}