
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayTitleState.dart';

class MoviePlayTitleCubit extends Cubit<MoviePlayTitleState>
{
  MoviePlayTitleCubit() : super(MoviePlayTitleState(title: ""));

  void setTitle(String title)
  {
    emit(MoviePlayTitleState(title: title));
  }
}