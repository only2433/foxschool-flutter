
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';

class BookshelfContentsAddState extends BlocState
{
  final MyBookshelfResult data;
  const BookshelfContentsAddState({
    required this.data
  });

  @override
  List<Object?> get props => [data];

}