
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class ContentsEnableBottomViewState extends Equatable
{
  final bool isEnable;
  const ContentsEnableBottomViewState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}