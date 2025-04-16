
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardBookmarkedState.dart';

class FlashcardBookmarkedCubit extends Cubit<FlashcardBookmarkedState>
{
  FlashcardBookmarkedCubit() : super(const FlashcardBookmarkedState(isBookmarked: false));

  void checkBookmark(bool isChecked)
  {
    emit(FlashcardBookmarkedState(isBookmarked: isChecked));
  }

}