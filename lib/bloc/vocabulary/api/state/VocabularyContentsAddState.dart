
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';

import '../../../base/BlocState.dart';

class VocabularyContentsAddState extends BlocState
{
  final MyVocabularyResult data;
  const VocabularyContentsAddState({
    required this.data
  });


  @override
  List<Object> get props => [data];
}