
import 'package:equatable/equatable.dart';

class MovieSeekProgressState extends Equatable
{
  bool isVisible;
  double percent;
  MovieSeekProgressState({
    required this.isVisible,
    required this.percent
  });

  @override
  List<Object?> get props => [isVisible, percent];

}