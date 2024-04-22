
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/menu/MoviePlayerMenuState.dart';

class MoviePlayerMenuCubit extends Cubit<MoviePlayerMenuState>
{
  MoviePlayerMenuCubit(): super(const MoviePlayerMenuState.init());

  void enableMenu({required bool isEnable})
  {
    emit(MoviePlayerMenuState.enableMenu(isEnable));
  }

  void enablePrevButton({required bool isEnable})
  {
    emit(MoviePlayerMenuState.enablePrevButton(isEnable));
  }

  void enableNextButton({required bool isEnable})
  {
    emit(MoviePlayerMenuState.enablePrevButton(isEnable));
  }

  void changePlayButton({required bool isMoviePlaying})
  {
    emit(MoviePlayerMenuState.changePlayButton(isMoviePlaying));
  }

  void enableCaptionButton({required bool isEnable})
  {
    emit(MoviePlayerMenuState.enableCaptionButton(isEnable));
  }

}