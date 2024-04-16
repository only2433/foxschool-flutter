
import 'package:equatable/equatable.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';

class MoviePlayListState extends Equatable
{
  final List<ContentsBaseResult> list;
  MoviePlayListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}