
import 'package:equatable/equatable.dart';

class FlashcardHelpPageState extends Equatable
{
  final bool isShowHelpPage;
  const FlashcardHelpPageState({
    required this.isShowHelpPage
  });

  @override
  List<Object?> get props => [isShowHelpPage];

}