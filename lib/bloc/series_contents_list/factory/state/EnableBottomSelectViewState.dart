
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class EnableBottomSelectViewState extends Equatable
{
  final bool isEnable;
  const EnableBottomSelectViewState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}