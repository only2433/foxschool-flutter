
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/story_category_contents/StoryCategoryContentsResult.dart';

class CategoryContentsLoadedState extends BlocState
{
  final StoryCategoryContentsResult data;
  CategoryContentsLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}