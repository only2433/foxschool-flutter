import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/FlashcardBookmarkOptionSelectState.dart';


class FlashcardBookmarkOptionSelectCubit extends Cubit<FlashcardBookmarkOptionSelectState>
{
  FlashcardBookmarkOptionSelectCubit() : super(const FlashcardBookmarkOptionSelectState(isAutoMode: false, isShuffleMode: false));

  void setAutoMode(bool isAutoMode)
  {
    emit(FlashcardBookmarkOptionSelectState(isAutoMode: isAutoMode, isShuffleMode: super.state.isShuffleMode));
  }

  void setShuffleMode(bool isShuffleMode)
  {
    emit(FlashcardBookmarkOptionSelectState(isAutoMode: super.state.isAutoMode, isShuffleMode: isShuffleMode));
  }

}