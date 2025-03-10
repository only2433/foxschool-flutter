

import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BookshelfListAPIState.freezed.dart';

@freezed
abstract class BookshelfListAPIState with _$BookshelfListAPIState
{
  const factory BookshelfListAPIState.common(CommonAPIState state) = _Common;
  const factory BookshelfListAPIState.bookshelfContentsLoadedState(List<ContentsBaseResult> data) = _BookshelfContentsLoadedState;
  const factory BookshelfListAPIState.bookshelfContentsDeleteState(MyBookshelfResult data) = _BookshelfContentsDeletedState;
}