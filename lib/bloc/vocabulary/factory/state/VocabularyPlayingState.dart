
import 'package:equatable/equatable.dart';

class VocabularyPlayingState extends Equatable
{
  final bool isPlaying;
  const VocabularyPlayingState({
    required this.isPlaying
  });

  @override
  List<Object?> get props => [isPlaying];

}