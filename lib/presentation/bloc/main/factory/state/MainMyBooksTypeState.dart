

import 'package:equatable/equatable.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/enum/MyBooksType.dart';

class MainMyBooksTypeState extends Equatable
{
  final MyBooksType type;
  final List<MyBookshelfResult> bookshelfList;
  final List<MyVocabularyResult> vocabularyList;

  const MainMyBooksTypeState({
    required this.type,
    required this.bookshelfList,
    required this.vocabularyList
  });

  @override
  List<Object> get props => [type, bookshelfList, vocabularyList];
}