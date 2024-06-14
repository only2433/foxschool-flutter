
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/management/factory/state/MyBooksUpdateNameState.dart';

class MyBooksUpdateNameCubit extends Cubit<MyBooksUpdateNameState>
{
  MyBooksUpdateNameCubit() : super(const MyBooksUpdateNameState(name: ""));

  void setName(String name)
  {
    emit(MyBooksUpdateNameState(name: name));
  }
}