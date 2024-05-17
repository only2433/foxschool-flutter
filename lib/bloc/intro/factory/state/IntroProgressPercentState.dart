
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class IntroProgressPercentState extends Equatable
{
  final double percent;
  const IntroProgressPercentState({
    required this.percent
  });

  @override
  List<Object> get props => [percent];
}