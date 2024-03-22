
import 'package:foxschool/bloc/base/BlocState.dart';

class ProgressPercentState extends BlocState
{
  final double percent;
  const ProgressPercentState({
    required this.percent
  });

  @override
  List<Object> get props => [percent];
}