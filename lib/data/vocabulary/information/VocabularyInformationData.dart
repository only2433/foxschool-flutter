
import '../../../enum/VocabularyType.dart';

class VocabularyInformationData
{
  final String id;
  final VocabularyType type;
  final String title;
  VocabularyInformationData({
    required this.id,
    required this.type,
    required this.title
  });
}