
import 'package:foxschool/bloc/base/BlocEvent.dart';

class MovieContentsEvent extends BlocEvent
{
  final String data;
  MovieContentsEvent({
    required this.data
  });

  @override
  List<Object?> get props => [data];
}