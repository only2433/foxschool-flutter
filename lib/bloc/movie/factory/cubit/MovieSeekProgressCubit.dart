
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/factory/state/MovieSeekProgressState.dart';

class MovieSeekProgressCubit extends Cubit<MovieSeekProgressState>
{
  MovieSeekProgressCubit() : super(MovieSeekProgressState(isVisible: false, percent: 0));

  void setInvisible()
  {
    emit(MovieSeekProgressState(isVisible: false, percent: 0));
  }

  void setPercent(double percent)
  {
    emit(MovieSeekProgressState(isVisible : true, percent: percent));
  }

}