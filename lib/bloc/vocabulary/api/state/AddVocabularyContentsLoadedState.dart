
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';

import '../../../base/BlocState.dart';

class AddVocabularyContentsLoadedState extends BlocState
{
  final MyVocabularyResult data;
  const AddVocabularyContentsLoadedState({
    required this.data
  });


  @override
  List<Object> get props => [data];
}