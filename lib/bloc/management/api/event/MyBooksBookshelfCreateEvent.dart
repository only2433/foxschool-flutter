
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksBookshelfCreateEvent extends BlocEvent
{
  final String name;
  final String color;
  MyBooksBookshelfCreateEvent({
    required this.name,
    required this.color
  });

  @override
  List<Object?> get props => [name, color];
}