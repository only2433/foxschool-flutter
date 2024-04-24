
import 'package:equatable/equatable.dart';

class MovieCaptionTextState extends Equatable
{
  final String text;
  MovieCaptionTextState({
    required this.text
  });

  @override
  List<Object?> get props => [text];

}