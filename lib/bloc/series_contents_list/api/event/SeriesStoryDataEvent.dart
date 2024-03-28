
import 'package:foxschool/bloc/base/BlocEvent.dart';

class SeriesStoryDataEvent extends BlocEvent
{
  final String displayID;
  SeriesStoryDataEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}