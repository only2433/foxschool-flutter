

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

class SeriesEnableInformationViewState extends Equatable
{
  final bool isEnable;
  SeriesEnableInformationViewState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}