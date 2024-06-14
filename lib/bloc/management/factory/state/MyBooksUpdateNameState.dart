
import 'package:equatable/equatable.dart';

class MyBooksUpdateNameState extends Equatable
{
  final String name;
  const MyBooksUpdateNameState({
    required this.name
  });

  @override
  List<Object?> get props => [name];

}