
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/VocabularyPlayingState.dart';

class VocabularyPlayingCubit extends Cubit<VocabularyPlayingState>
{
  VocabularyPlayingCubit() : super(const VocabularyPlayingState(isPlaying: false));

  void enablePlay(bool isPlay)
  {
    emit(VocabularyPlayingState(isPlaying: isPlay));
  }

}