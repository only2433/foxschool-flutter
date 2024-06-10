
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/vocabulary/VocabularyDataResult.dart';

class VocabularyContentsListEvent extends BlocEvent
{
  final String contentID;
  VocabularyContentsListEvent({
    required this.contentID
  });

  @override
  List<Object?> get props => [contentID];

}