
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksVocabularyUpdateEvent extends BlocEvent
{
  final String vocabularyID;
  final String name;
  final String color;

  MyBooksVocabularyUpdateEvent({
    required this.vocabularyID,
    required this.name,
    required this.color
  });

  @override
  List<Object?> get props => [vocabularyID, name, color];

}