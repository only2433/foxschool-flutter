
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksVocabularyDeleteEvent extends BlocEvent
{
  final String vocabularyID;
  MyBooksVocabularyDeleteEvent({
    required this.vocabularyID
  });

  @override
  List<Object?> get props => [vocabularyID];
}