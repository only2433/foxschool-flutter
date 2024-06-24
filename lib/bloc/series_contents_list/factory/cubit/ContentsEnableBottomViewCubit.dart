import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/ContentsEnableBottomViewState.dart';

class ContentsEnableBottomViewCubit extends Cubit<ContentsEnableBottomViewState>
{
  ContentsEnableBottomViewCubit() : super(const ContentsEnableBottomViewState(isEnable: false));

  void enableBottomSelectView(bool isEnable)
  {
    emit(ContentsEnableBottomViewState(isEnable: isEnable));
  }

}