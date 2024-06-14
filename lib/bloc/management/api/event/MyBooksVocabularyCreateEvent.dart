
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksVocabularyCreateEvent extends BlocEvent
{
  final String name;
  final String color;
  MyBooksVocabularyCreateEvent({
    required this.name,
    required this.color
  });

  @override
  List<Object?> get props => [name, color];

}