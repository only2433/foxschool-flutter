
import 'package:equatable/equatable.dart';
import 'package:foxschool/bloc/base/BlocState.dart';

import '../../../../data/school_data/SchoolData.dart';

class SchoolNameState extends Equatable
{
  final String name;

  const SchoolNameState({
    required this.name,
  });

  @override
  List<Object> get props => [name];

}