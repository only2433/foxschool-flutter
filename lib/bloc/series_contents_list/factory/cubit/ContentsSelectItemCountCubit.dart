import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/ContentsSelectItemCountState.dart';

class ContentsSelectItemCountCubit extends Cubit<ContentsSelectItemCountState>
{
  ContentsSelectItemCountCubit() : super(ContentsSelectItemCountState(count: 0));

  void setSelectItemCount(int count)
  {
    emit(ContentsSelectItemCountState(count: count));
  }

}