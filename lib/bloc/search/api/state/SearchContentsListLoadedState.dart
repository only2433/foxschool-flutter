
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/search/SearchListPagingResult.dart';

class SearchContentsListLoadedState extends BlocState
{
  final SearchListPagingResult data;

  SearchContentsListLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}