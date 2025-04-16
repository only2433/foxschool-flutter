
import 'package:equatable/equatable.dart';

class FlashcardBookmarkedState extends Equatable
{
  final bool isBookmarked;
  const FlashcardBookmarkedState({
    required this.isBookmarked
  });

  @override
  List<Object?> get props => [isBookmarked];

}