

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/search/factory/state/base/SeachListBaseState.dart';
import '../../../../data/contents/contents_base/ContentsBaseResult.dart';
import '../state/SearchItemListState.dart';

class SearchItemListCubit extends Cubit<SearchListBaseState>
{
  SearchItemListCubit() : super(InitState());

  void init()
  {
    emit(InitState());
  }

  void showLoading()
  {
    emit(LoadingState());
  }

  void setErrorMessage(String message)
  {
    emit(ErrorState(message: message));
  }

  void setSearchContentsList(bool isLoading, List<ContentsBaseResult> list)
  {
    emit(SearchItemListState(isLoading: isLoading, list : list));
  }

}