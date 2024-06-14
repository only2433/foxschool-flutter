
import 'package:equatable/equatable.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';

class MyBooksUpdateColorState extends Equatable
{
  final MyBooksColorType type;
  const MyBooksUpdateColorState({
    required this.type
  });

  @override
  List<Object?> get props => [type];

}