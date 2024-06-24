
import 'package:equatable/equatable.dart';

class ContentsSelectItemCountState extends Equatable
{
  final int count;
  ContentsSelectItemCountState({
    required this.count
  });

  @override
  List<Object> get props => [count];
}