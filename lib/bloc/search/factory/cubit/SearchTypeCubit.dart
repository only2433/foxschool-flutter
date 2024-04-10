
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/search/factory/state/SearchTypeState.dart';

import '../../../../enum/SearchType.dart';

class SearchTypeCubit extends Cubit<SearchTypeState>
{
  SearchTypeCubit() : super(SearchTypeState(type: SearchType.ALL));

  void init()
  {
    emit(SearchTypeState(type: SearchType.ALL));
  }

  void setSearchType(SearchType searchType)
  {
    emit(SearchTypeState(type: searchType));
  }
}