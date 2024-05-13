
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ConstituteWidgetState extends Equatable
{
  List<Widget> list;
  ConstituteWidgetState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}