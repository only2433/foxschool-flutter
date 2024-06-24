
import 'package:foxschool/bloc/base/BlocEvent.dart';

class BookshelfContentListEvent extends BlocEvent
{
  final String id;
  BookshelfContentListEvent({
    required this.id
  });

  @override
  List<Object?> get props => [id];

}