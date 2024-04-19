
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayCompleteState.dart';

class MoviePlayCompleteCubit extends Cubit<MoviePlayCompleteState>
{
  MoviePlayCompleteCubit() : super(MoviePlayCompleteState(isComplete: false));


  void showPlayCompleteView(bool isEnable)
  {
    emit(MoviePlayCompleteState(isComplete: isEnable));
  }
}