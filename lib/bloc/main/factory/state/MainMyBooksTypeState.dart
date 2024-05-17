

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/my_book/MyBookshelfResult.dart';
import '../../../../data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../../../enum/MyBooksType.dart';

class MainMyBooksTypeState extends Equatable
{
  final MyBooksType type;
  final List<MyBookshelfResult> bookshelfList;
  final List<MyVocabularyResult> vocabularyList;

  MainMyBooksTypeState({
    required this.type,
    required this.bookshelfList,
    required this.vocabularyList
  });

  @override
  List<Object> get props => [type, bookshelfList, vocabularyList];
}