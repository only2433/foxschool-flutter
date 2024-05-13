
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/data/quiz/QuizInformationResult.dart';

class QuizInformationLoadedState extends BlocState
{
  final QuizInformationResult data;
  const QuizInformationLoadedState({
    required this.data
  });

  @override
  List<Object> get props => [data];
}