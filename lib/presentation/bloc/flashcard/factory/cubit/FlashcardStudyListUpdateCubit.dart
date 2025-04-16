
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/data/model/flashcard/FlashcardDataResult.dart';
import 'package:foxschool/presentation/bloc/flashcard/factory/state/FlashcardStudyListUpdateState.dart';

class FlashcardStudyListUpdateCubit extends Cubit<FlashcardStudyListUpdateState>
{
  FlashcardStudyListUpdateCubit() : super(const FlashcardStudyListUpdateState(list: []));

  void setData(List<FlashcardDataResult> data)
  {
    emit(FlashcardStudyListUpdateState(list: data));
  }

}