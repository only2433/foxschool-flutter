
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/category_contents_list/factory/state/CategoryTitleColorState.dart';

class CategoryTitleColorCubit extends Cubit<CategoryTitleColorState>
{
  CategoryTitleColorCubit() : super(CategoryTitleColorState(titleColor: Colors.transparent));

  void setTitleColor(Color color)
  {
    emit(CategoryTitleColorState(titleColor: color));
  }

}