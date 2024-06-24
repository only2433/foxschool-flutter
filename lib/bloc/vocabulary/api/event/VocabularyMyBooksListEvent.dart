
import 'package:flutter/material.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';

class VocabularyMyBooksListEvent extends BlocEvent
{
  final String vocabularyID;
  VocabularyMyBooksListEvent({
    required this.vocabularyID
  });

  @override
  List<Object?> get props => [vocabularyID];
}