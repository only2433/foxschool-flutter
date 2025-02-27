

import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/enum/StorySeriesType.dart';
import 'package:foxschool/data/model/main/series/SeriesInformationResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/presentation/controller/main/river_pod/data/MainUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'MainUINotifier.g.dart';

@riverpod
class MainUINotifier extends _$MainUINotifier
{
  @override
  MainUIState build() {
    return MainUIState(
        userName: "",
        userClass: "",
        userSchoolName: "",
        storySeriesType: StorySeriesType.LEVEL,
        storyItemList: [],
        songItemList: [],
        myBooksType: MyBooksType.BOOKSHELF,
        bookshelfList: [],
        vocabularyList: []);
  }

  void setUserInformation(String name, String className, String schoolName)
  {
    state = state.copyWith(
      userName: name,
      userClass: className,
      userSchoolName: schoolName
    );
  }

  void setStorySelectTypeList(StorySeriesType type, List<SeriesInformationResult> list)
  {
    state = state.copyWith(
      storySeriesType: type,
      storyItemList: list
    );
  }

  void setSongCategoryList(List<SeriesInformationResult> list)
  {
    state = state.copyWith(
      songItemList: list
    );
  }

  void setMyBooksTypeList(MyBooksType type, List<MyBookshelfResult> bookList, List<MyVocabularyResult> vocaList)
  {
    state = state.copyWith(
      myBooksType: type,
      bookshelfList: bookList,
      vocabularyList: vocaList
    );
  }

}