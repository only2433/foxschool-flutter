
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class ProgressPercentState extends Equatable
{
  final double percent;
  const ProgressPercentState({
    required this.percent
  });

  @override
  List<Object> get props => [percent];
}