
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/menu/MoviePlayerMenuState.dart';

class MoviePlayerMenuCubit extends Cubit<MoviePlayerMenuState>
{
  MoviePlayerMenuCubit(): super(InitState());

  void enableMenu({required bool isEnable})
  {
    emit(EnableMenuState(isEnable: isEnable));
  }

  void enablePrevButton({required bool isEnable})
  {
    emit(EnablePrevButtonState(isEnable: isEnable));
  }

  void enableNextButton({required bool isEnable})
  {
    emit(EnableNextButtonState(isEnable: isEnable));
  }

  void changePlayButton({required bool isMoviePlaying})
  {
    emit(ChangePlayButtonState(isMoviePlaying: isMoviePlaying));
  }

  void enableCaptionButton({required bool isEnable})
  {
    emit(EnableCaptionButtonState(isEnable: isEnable));
  }

}