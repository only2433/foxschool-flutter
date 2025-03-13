
import 'package:foxschool/data/model/story_category_contents/StoryCategoryContentsResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CategoryListAPIState.freezed.dart';

@freezed
abstract class CategoryListAPIState with _$CategoryListAPIState
{
  const factory CategoryListAPIState.common(CommonAPIState state) = _Common;
  const factory CategoryListAPIState.contentsLoadedState(StoryCategoryContentsResult result) = _ContentsLoadedState;
}