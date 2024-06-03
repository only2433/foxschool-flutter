
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyBottomControllerState.dart';

class VocabularyBottomControllerCubit extends Cubit<VocabularyBottomControllerState>
{
  VocabularyBottomControllerCubit() : super(InitState());


  void setInterval(int intervalIndex)
  {
    emit(VocabularySelectIntervalState(index: intervalIndex));
  }

  void setHaveSelectedItem(bool isHave)
  {
    emit(VocabularySelectAllState(isHaveSelectedItem: isHave));
  }

  void setSelectItemCount(int count)
  {
    emit(VocabularySelectItemCountState(count: count));
  }

}