import 'package:equatable/equatable.dart';

class FlashcardBookmarkOptionSelectState extends Equatable
{
  final bool isAutoMode;
  final bool isShuffleMode;
  const FlashcardBookmarkOptionSelectState({
    required this.isAutoMode,
    required this.isShuffleMode
  });

  @override
  List<Object?> get props => [isAutoMode, isShuffleMode];
}