
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/values/AppColors.dart';

import '../state/SeriesTitleColorState.dart';

class SeriesTitleColorCubit extends Cubit<SeriesTitleColorState>
{
  SeriesTitleColorCubit() : super(SeriesTitleColorState(titleColor: Colors.transparent));

  void setTitleColor(Color color)
  {
    emit(SeriesTitleColorState(titleColor: color));
  }

}