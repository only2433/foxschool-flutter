
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/school_data/SchoolData.dart';

class FindSchoolListState extends Equatable
{
  final List<SchoolData> schoolList;
  const FindSchoolListState({
    required this.schoolList
  });

  @override
  List<Object> get props => [schoolList];

}