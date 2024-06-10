
import 'package:foxschool/bloc/base/BlocEvent.dart';

import '../../../../data/vocabulary/VocabularyDataResult.dart';

class VocabularyContentsDeleteEvent extends BlocEvent
{
  final String vocabularyID;
  final List<VocabularyDataResult> data;
  VocabularyContentsDeleteEvent({
    required this.vocabularyID,
    required this.data
  });

  @override
  List<Object?> get props => [vocabularyID, data];

}