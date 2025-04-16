
import 'package:equatable/equatable.dart';

class FlashcardOptionSelectState extends Equatable
{
  final bool isAutoMode;
  final bool isShuffleMode;
  const FlashcardOptionSelectState({
    required this.isAutoMode,
    required this.isShuffleMode
  });

  @override
  List<Object?> get props => [isAutoMode, isShuffleMode];
}