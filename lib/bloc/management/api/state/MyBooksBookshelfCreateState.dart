
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';

class MyBooksBookshelfCreateState extends BlocState
{
  final MyBookshelfResult data;
  MyBooksBookshelfCreateState({
    required this.data
  });
}