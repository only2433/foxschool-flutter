
import 'package:equatable/equatable.dart';

class SelectItemCountState extends Equatable
{
  final int count;
  SelectItemCountState({
    required this.count
  });

  @override
  List<Object> get props => [count];
}