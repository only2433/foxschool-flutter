
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/menu/MovieCaptionTextState.dart';

class MovieCaptionTextCubit extends Cubit<MovieCaptionTextState>
{
  MovieCaptionTextCubit() : super(MovieCaptionTextState(text: ""));

  void setText(String text)
  {
    emit(MovieCaptionTextState(text: text));
  }
}