import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SelectItemCountState.dart';

class SelectItemCountCubit extends Cubit<SelectItemCountState>
{
  SelectItemCountCubit() : super(SelectItemCountState(count: 0));

  void setSelectItemCount(int count)
  {
    emit(SelectItemCountState(count: count));
  }

}