
import 'dart:ui';

import 'package:equatable/equatable.dart';

class CategoryTitleColorState extends Equatable
{
  final Color titleColor;
  CategoryTitleColorState({
    required this.titleColor
  });

  @override
  List<Object?> get props => [titleColor];

}