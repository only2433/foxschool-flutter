
import 'package:foxschool/bloc/base/BlocEvent.dart';

class SearchContentsListEvent extends BlocEvent
{
  final String type;
  final String keyword;
  final String currentPage;

  SearchContentsListEvent({
    required this.type,
    required this.keyword,
    required this.currentPage
  });

  @override
  List<Object?> get props => [type, keyword, currentPage];

}