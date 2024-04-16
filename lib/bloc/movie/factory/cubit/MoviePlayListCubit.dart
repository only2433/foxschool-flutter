

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/movie/api/event/MovieContentsEvent.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayListState.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';

class MoviePlayListCubit extends Cubit<MoviePlayListState>
{
  MoviePlayListCubit() : super(MoviePlayListState(list: []));

  void setMoviePlayList(List<ContentsBaseResult> list)
  {
    emit(MoviePlayListState(list: list));
  }

}