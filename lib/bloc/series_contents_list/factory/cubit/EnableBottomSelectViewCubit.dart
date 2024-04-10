import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/EnableBottomSelectViewState.dart';

class EnableBottomSelectViewCubit extends Cubit<EnableBottomSelectViewState>
{
  EnableBottomSelectViewCubit() : super(const EnableBottomSelectViewState(isEnable: false));

  void enableBottomSelectView(bool isEnable)
  {
    emit(EnableBottomSelectViewState(isEnable: isEnable));
  }

}