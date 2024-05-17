
import 'package:foxschool/bloc/base/BlocEvent.dart';

class SeriesContentsDataEvent extends BlocEvent
{
  final String displayID;
  SeriesContentsDataEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}