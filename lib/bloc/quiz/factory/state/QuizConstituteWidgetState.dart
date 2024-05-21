
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class QuizConstituteWidgetState extends Equatable
{
  List<Widget> list;
  QuizConstituteWidgetState({
    required this.list
  });

  @override
  List<Object> get props => [list];
}