

import 'dart:ui';

import 'package:equatable/equatable.dart';

class SeriesTitleColorState extends Equatable
{
  final Color titleColor;

  SeriesTitleColorState({
    required this.titleColor
  });

  @override
  List<Object?> get props => [titleColor];

}