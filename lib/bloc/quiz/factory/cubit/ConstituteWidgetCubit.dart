
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/quiz/factory/state/ConstituteWidgetState.dart';

class ConstituteWidgetCubit extends Cubit<ConstituteWidgetState>
{
  ConstituteWidgetCubit() : super(ConstituteWidgetState(list: []));

  void setWidgetList(List<Widget> list)
  {
    emit(ConstituteWidgetState(list: list));
  }

}