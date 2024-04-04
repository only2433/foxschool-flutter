
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/enum/SearchType.dart';

class SearchTypeState extends BlocState
{
  final SearchType type;
  SearchTypeState({
    required this.type
  });

  @override
  List<Object> get props => [type];
}