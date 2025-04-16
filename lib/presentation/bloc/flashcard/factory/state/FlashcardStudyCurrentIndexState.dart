
import 'package:equatable/equatable.dart';

class FlashcardStudyCurrentIndexState extends Equatable
{
  final int currentIndex;
  final int maxCount;
  const FlashcardStudyCurrentIndexState({
    required this.currentIndex,
    required this.maxCount
  });

  @override
  List<Object?> get props => [currentIndex, maxCount];

}