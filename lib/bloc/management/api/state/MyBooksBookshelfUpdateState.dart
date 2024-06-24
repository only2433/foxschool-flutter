
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';

class MyBooksBookshelfUpdateState extends BlocState
{
  final MyBookshelfResult data;
  MyBooksBookshelfUpdateState({
    required this.data
  });
}