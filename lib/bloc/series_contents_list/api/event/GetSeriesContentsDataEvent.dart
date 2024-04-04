
import 'package:foxschool/bloc/base/BlocEvent.dart';

class GetSeriesContentsDataEvent extends BlocEvent
{
  final String displayID;
  GetSeriesContentsDataEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}