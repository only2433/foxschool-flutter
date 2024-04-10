
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/enum/SearchType.dart';

class SearchTypeState extends Equatable
{
  final SearchType type;
  SearchTypeState({
    required this.type
  });

  @override
  List<Object> get props => [type];
}