
import 'package:equatable/equatable.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';

class MainSongCategoryListState extends Equatable
{
  final List<SeriesInformationResult> list;

  const MainSongCategoryListState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}