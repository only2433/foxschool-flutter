
import 'package:equatable/equatable.dart';


class VocabularyStudyTypeState extends Equatable
{
  final bool isSelectAll;
  final bool isSelectTitle;
  final bool isSelectMean;
  final bool isSelectExample;
  const VocabularyStudyTypeState({
    required this.isSelectAll,
    required this.isSelectTitle,
    required this.isSelectMean,
    required this.isSelectExample
  });

  @override
  List<Object?> get props => [isSelectAll, isSelectTitle, isSelectMean, isSelectExample];
}