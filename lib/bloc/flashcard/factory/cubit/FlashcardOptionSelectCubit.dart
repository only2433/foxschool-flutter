
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardOptionSelectState.dart';

class FlashcardOptionSelectCubit extends Cubit<FlashcardOptionSelectState>
{
  FlashcardOptionSelectCubit() : super(const FlashcardOptionSelectState(isAutoMode: false, isShuffleMode: false));

  void setAutoMode(bool isAutoMode)
  {
    emit(FlashcardOptionSelectState(isAutoMode: isAutoMode, isShuffleMode: super.state.isShuffleMode));
  }

  void setShuffleMode(bool isShuffleMode)
  {
    emit(FlashcardOptionSelectState(isAutoMode: super.state.isAutoMode, isShuffleMode: isShuffleMode));
  }

}