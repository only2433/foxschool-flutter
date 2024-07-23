
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/flashcard/factory/state/FlashcardStudyListUpdateState.dart';

import '../../../../data/flashcard/FlashcardDataResult.dart';

class FlashcardStudyListUpdateCubit extends Cubit<FlashcardStudyListUpdateState>
{
  FlashcardStudyListUpdateCubit() : super(FlashcardStudyListUpdateState(list: []));

  void setData(List<FlashcardDataResult> data)
  {
    emit(FlashcardStudyListUpdateState(list: data));
  }

}