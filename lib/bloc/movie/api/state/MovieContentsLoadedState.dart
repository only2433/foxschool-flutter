
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/movie/MovieItemResult.dart';


class MovieContentsLoadedState extends BlocState
{
  final MovieItemResult data;

  MovieContentsLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}