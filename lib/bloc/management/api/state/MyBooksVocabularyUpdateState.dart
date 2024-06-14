

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/main/my_vocabulary/MyVocabularyResult.dart';

class MyBooksVocabularyUpdateState extends BlocState
{
  final MyVocabularyResult data;
  const MyBooksVocabularyUpdateState({
    required this.data
  });

  @override
  List<Object?> get props => [data];

}