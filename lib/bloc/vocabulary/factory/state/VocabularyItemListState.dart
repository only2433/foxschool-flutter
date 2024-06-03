

import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyListBaseState.dart';

import '../../../../data/vocabulary/VocabularyDataResult.dart';

class VocabularyItemListState extends VocabularyListBaseState
{
  final List<VocabularyDataResult> data;
  const VocabularyItemListState({
    required this.data
  });

}