
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/vocabulary/VocabularyDataResult.dart';

class VocabularyDataListLoadedState extends BlocState
{
  final List<VocabularyDataResult> data;
  const VocabularyDataListLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];

}