
import 'package:foxschool/bloc/base/BlocEvent.dart';

class QuizInformationEvent extends BlocEvent
{
  final String contentID;
  QuizInformationEvent({
    required this.contentID
  });

  @override
  List<Object?> get props => [contentID];
}