
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/category_contents_list/factory/state/CategoryItemListState.dart';
import '../../../../data/main/series/SeriesInformationResult.dart';
import '../../../base/ContentsListBaseState.dart';

class CategoryItemListCubit extends Cubit<ContentsListBaseState>
{
  CategoryItemListCubit() : super(LoadingState());

  void showLoading()
  {
    emit(LoadingState());
  }

  void setCategoryItemList(List<SeriesInformationResult> list)
  {
    emit(CategoryItemListState(itemList: list));
  }

}