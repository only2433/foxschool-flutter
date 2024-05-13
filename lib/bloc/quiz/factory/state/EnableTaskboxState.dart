
import 'package:equatable/equatable.dart';

class EnableTaskboxState extends Equatable
{
  final bool isEnable;
  EnableTaskboxState({
    required this.isEnable
  });

  @override
  List<Object?> get props => [isEnable];

}