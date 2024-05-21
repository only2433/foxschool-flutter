
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class SeriesEnableBottomViewState extends Equatable
{
  final bool isEnable;
  const SeriesEnableBottomViewState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}