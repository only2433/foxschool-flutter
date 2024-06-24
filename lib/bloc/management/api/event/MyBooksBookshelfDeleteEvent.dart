
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksBookshelfDeleteEvent extends BlocEvent
{
  final String bookshelfID;
  MyBooksBookshelfDeleteEvent({
    required this.bookshelfID
  });

  @override
  List<Object?> get props => [bookshelfID];

}