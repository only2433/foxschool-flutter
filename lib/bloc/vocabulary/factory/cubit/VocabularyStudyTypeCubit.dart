
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/VocabularyStudyTypeState.dart';


class VocabularyStudyTypeCubit extends Cubit<VocabularyStudyTypeState>
{
  VocabularyStudyTypeCubit() : super(const VocabularyStudyTypeState(isSelectAll: true, isSelectTitle: true, isSelectMean: true, isSelectExample: true));


  void setSelectType(bool isEnableALL, bool isEnableText, bool isEnableMean, bool isEnableExample)
  {
    emit(VocabularyStudyTypeState(
        isSelectAll: isEnableALL,
        isSelectTitle: isEnableText,
        isSelectMean: isEnableMean,
        isSelectExample: isEnableExample));
  }

}