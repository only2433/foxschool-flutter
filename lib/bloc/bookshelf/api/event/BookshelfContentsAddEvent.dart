
import 'package:foxschool/bloc/base/BlocEvent.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';

class BookshelfContentsAddEvent extends BlocEvent
{
  final String bookshelfID;
  final List<ContentsBaseResult> data;
  BookshelfContentsAddEvent({
    required this.bookshelfID,
    required this.data
  });

  @override
  List<Object?> get props => [bookshelfID, data];

}