

import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'BookshelfListUIState.freezed.dart';

@freezed
class BookshelfListUIState with _$BookshelfListUIState
{
  factory BookshelfListUIState({
    required bool isContentsLoading,
    required List<ContentsBaseResult> itemList,
    required int selectItemCount,
    required bool isEnableBottomSelectView,
  }) = _BookshelfListUIState;
}