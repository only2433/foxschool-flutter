
import 'package:equatable/equatable.dart';

class MainUserInformationState extends Equatable
{
  final String userName;
  final String userClass;
  final String userSchoolName;

  MainUserInformationState({
    required this.userName,
    required this.userClass,
    required this.userSchoolName
  });

  @override
  List<Object?> get props => [userName, userClass, userSchoolName];

}