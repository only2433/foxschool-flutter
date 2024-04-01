
import 'package:foxschool/bloc/base/BlocEvent.dart';

class CategoryContentsDataEvent extends BlocEvent
{
  final String displayID;
  CategoryContentsDataEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}