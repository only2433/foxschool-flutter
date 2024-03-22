
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/school_data/SchoolData.dart';

class FindSchoolListState extends BlocState
{
  final List<SchoolData> schoolList;
  const FindSchoolListState({
    required this.schoolList
  });

  @override
  List<Object> get props => [schoolList];

}