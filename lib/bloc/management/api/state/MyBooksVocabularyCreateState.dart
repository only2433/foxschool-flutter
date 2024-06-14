

import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';

class MyBooksVocabularyCreateState extends BlocState
{
  final MyVocabularyResult data;
  const MyBooksVocabularyCreateState({
    required this.data
  });

  @override
  List<Object?> get props => [data];


}