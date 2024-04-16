
import 'package:equatable/equatable.dart';

class MoviePlayTitleState extends Equatable
{
  final String title;
  MoviePlayTitleState({
    required this.title
  });

  @override
  List<Object?> get props => [title];

}