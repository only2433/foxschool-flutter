
import 'package:foxschool/enum/StorySeriesType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';

part 'MainUIState.freezed.dart';

@freezed
class MainUIState with _$MainUIState
{
  factory MainUIState({
    required String userName,
    required String userClass,
    required String userSchoolName,
    required StorySeriesType storySeriesType,
    required List<SeriesInformationResult> storyItemList,
    required List<SeriesInformationResult> songItemList,
    required MyBooksType myBooksType,
    required List<MyBookshelfResult> bookshelfList,
    required List<MyVocabularyResult> vocabularyList
  }) = _MainUIState;


}