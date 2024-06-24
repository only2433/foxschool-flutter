
import 'package:equatable/equatable.dart';

import '../../../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../../base/BlocState.dart';

class BookshelfContentListLoadedState extends BlocState
{
  final List<ContentsBaseResult> data;
  const BookshelfContentListLoadedState({
   required this.data
  });

  @override
  List<Object?> get props => [data];

}