

import 'package:foxschool/data/model/contents/DetailItemInformationResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SeriesListAPIState.freezed.dart';

@freezed
abstract class SeriesListAPIState with _$SeriesListAPIState
{
  const factory SeriesListAPIState.common(CommonAPIState state) = _Common;
  const factory SeriesListAPIState.seriesContentsDataLoadedState(DetailItemInformationResult data) = _SeriesContentsDataLoadedState;
  const factory SeriesListAPIState.bookshelfContentsAddState(MyBookshelfResult data) = _BookshelfContentsAddState;
}