
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardBookmarkedState.dart';

class FlashcardBookmarkedCubit extends Cubit<FlashcardBookmarkedState>
{
  FlashcardBookmarkedCubit() : super(FlashcardBookmarkedState(isBookmarked: false));

  void checkBookmark(bool isChecked)
  {
    emit(FlashcardBookmarkedState(isBookmarked: isChecked));
  }

}