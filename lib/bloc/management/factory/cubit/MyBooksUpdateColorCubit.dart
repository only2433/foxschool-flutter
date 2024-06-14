
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyUpdateState.dart';
import 'package:foxschool/bloc/management/factory/state/MyBooksUpdateColorState.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';

class MyBooksUpdateColorCubit extends Cubit<MyBooksUpdateColorState>
{
  MyBooksUpdateColorCubit() : super(const MyBooksUpdateColorState(type: MyBooksColorType.RED));

  void setColor(MyBooksColorType type)
  {
    emit(MyBooksUpdateColorState(type: type));
  }

}