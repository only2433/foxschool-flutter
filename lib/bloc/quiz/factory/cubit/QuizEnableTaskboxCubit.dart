
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/QuizEnableTaskboxState.dart';

class QuizEnableTaskboxCubit extends Cubit<QuizEnableTaskboxState>
{
  QuizEnableTaskboxCubit(): super(QuizEnableTaskboxState(isEnable: false));

  void setEnable(bool isEnable)
  {
    emit(QuizEnableTaskboxState(isEnable: isEnable));
  }

}