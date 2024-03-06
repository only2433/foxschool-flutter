

import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../data/school_data/SchoolData.dart';

class SchoolDataLoadedState extends BlocState
{
  final List<SchoolData> data;
  const SchoolDataLoadedState({
  required this.data
  });
  @override
  List<Object> get props => [data];
}