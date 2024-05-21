
import 'package:foxschool/bloc/base/BlocEvent.dart';

class CategoryContentsEvent extends BlocEvent
{
  final String displayID;
  CategoryContentsEvent({
    required this.displayID
  });

  @override
  List<Object?> get props => [displayID];
}