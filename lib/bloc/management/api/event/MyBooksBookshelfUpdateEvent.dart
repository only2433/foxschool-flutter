
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MyBooksBookshelfUpdateEvent extends BlocEvent
{
  final String bookshelfID;
  final String name;
  final String color;
  MyBooksBookshelfUpdateEvent({
    required this.bookshelfID,
    required this.name,
    required this.color
  });

  @override
  List<Object?> get props => [bookshelfID, name, color];
}