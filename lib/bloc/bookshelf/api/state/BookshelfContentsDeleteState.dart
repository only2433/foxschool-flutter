
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';

class BookshelfContentsDeleteState extends BlocState
{
  final MyBookshelfResult data;
  const BookshelfContentsDeleteState({
    required this.data
  });

  @override
  List<Object?> get props => [data];

}