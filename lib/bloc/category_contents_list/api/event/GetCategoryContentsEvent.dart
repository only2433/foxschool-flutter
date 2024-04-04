
import 'package:foxschool/bloc/base/BlocEvent.dart';

class GetCategoryContentsEvent extends BlocEvent
{
  final String displayID;
  GetCategoryContentsEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}