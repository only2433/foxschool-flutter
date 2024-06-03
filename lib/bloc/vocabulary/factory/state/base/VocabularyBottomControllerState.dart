
import 'package:equatable/equatable.dart';

class VocabularyBottomControllerState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class InitState extends VocabularyBottomControllerState {}


class VocabularySelectIntervalState extends VocabularyBottomControllerState
{
  final int index;
  VocabularySelectIntervalState({
    required this.index
  });

  @override
  List<Object?> get props => [index];

}

class VocabularySelectAllState extends VocabularyBottomControllerState
{
  final bool isHaveSelectedItem;
  VocabularySelectAllState({
    required this.isHaveSelectedItem
  });

  @override
  List<Object?> get props => [isHaveSelectedItem];
}

class VocabularySelectItemCountState extends VocabularyBottomControllerState
{
  final int count;
  VocabularySelectItemCountState({
    required this.count
  });

  @override
  List<Object?> get props => [count];
}

