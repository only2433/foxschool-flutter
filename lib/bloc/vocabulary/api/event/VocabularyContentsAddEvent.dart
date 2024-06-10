
import 'package:foxschool/bloc/base/BlocEvent.dart';

import '../../../../data/vocabulary/VocabularyDataResult.dart';

class VocabularyContentsAddEvent extends BlocEvent
{
  final String contentID;
  final String vocabularyID;
  final List<VocabularyDataResult> list;
  VocabularyContentsAddEvent({
    required this.contentID,
    required this.vocabularyID,
    required this.list
  });

  @override
  List<Object?> get props => [contentID, vocabularyID, list];

}