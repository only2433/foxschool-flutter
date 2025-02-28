

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/presentation/bloc/main/factory/state/MainMyBooksTypeState.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/enum/MyBooksType.dart';

class MainMyBooksTypeCubit extends Cubit<MainMyBooksTypeState> {
  MainMyBooksTypeCubit() : super(const MainMyBooksTypeState(
      type: MyBooksType.BOOKSHELF,
      bookshelfList: [],
      vocabularyList: [])
  );

  void setMyBooksTypeData(MyBooksType type, List<MyBookshelfResult> bookshelfList, List<MyVocabularyResult> vocabularyList)
  {
    emit(MainMyBooksTypeState(
        type: type,
        bookshelfList: bookshelfList,
        vocabularyList: vocabularyList
    ));
  }
}