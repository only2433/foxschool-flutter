
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/base/QuizBaseState.dart';

import '../../../../data/quiz/quiz_data/picture/QuizPictureData.dart';
import '../../../../data/quiz/quiz_data/text/QuizTextData.dart';

class QuizReadyDataCubit extends Cubit<QuizBaseState>
{
  QuizReadyDataCubit() : super(InitState());

  void showLoading()
  {
    emit(InitState());
  }

  void loadingComplete()
  {
    emit(LoadedCompleteState());
  }
}