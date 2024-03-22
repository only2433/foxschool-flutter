
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/school_data/SchoolData.dart';

class SchoolNameState extends BlocState
{
  final String name;

  const SchoolNameState({
    required this.name,
  });

  @override
  List<Object> get props => [name];

}