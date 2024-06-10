
import 'package:flutter/material.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';

class VocabularyShelfListEvent extends BlocEvent
{
  final String vocabularyID;
  VocabularyShelfListEvent({
    required this.vocabularyID
  });

  @override
  List<Object?> get props => [vocabularyID];
}