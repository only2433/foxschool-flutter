
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/ContentsItemListState.dart';
import '../../../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../../base/ContentsListBaseState.dart';

class ContentsItemListCubit extends Cubit<ContentsListBaseState>
{
  ContentsItemListCubit() : super(LoadingState());

  void showLoading()
  {
    emit(LoadingState());
  }

  void showSeriesItemList(String seriesColor, bool isFullName, List<ContentsBaseResult> list)
  {
    emit(ContentsItemListState(
        seriesColor: seriesColor,
        isFullName: isFullName,
        itemList: list)
    );
  }

  void showContentsItemList(List<ContentsBaseResult> list)
  {
    emit(ContentsItemListState(itemList: list));
  }
}


