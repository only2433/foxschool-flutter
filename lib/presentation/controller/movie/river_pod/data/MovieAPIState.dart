
import 'package:foxschool/data/model/movie/MovieItemResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'MovieAPIState.freezed.dart';

@freezed
abstract class MovieAPIState with _$MovieAPIState
{
  const factory MovieAPIState.common(CommonAPIState state) = _Common;
  const factory MovieAPIState.contentsLoadedState(MovieItemResult result) = _ContentsLoadedState;
}