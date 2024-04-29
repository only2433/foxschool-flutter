
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayTimeState.dart';

class MoviePlayTimeCubit extends Cubit<MoviePlayTimeState>
{
  MoviePlayTimeCubit() : super(const MoviePlayTimeState(currentTime: "--:--", totalTime: "--:--"));

  void setPlayTime(String current, String remain)
  {
    emit(MoviePlayTimeState(currentTime: current, totalTime: remain));
  }

}