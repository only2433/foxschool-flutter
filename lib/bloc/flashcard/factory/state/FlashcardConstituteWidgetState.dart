
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class FlashcardConstituteWidgetState extends Equatable
{
  final List<Widget> list;
  const FlashcardConstituteWidgetState({
    required this.list
  });

  @override
  List<Object?> get props => [list];

}