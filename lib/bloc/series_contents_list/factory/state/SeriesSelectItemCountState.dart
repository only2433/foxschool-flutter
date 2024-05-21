
import 'package:equatable/equatable.dart';

class SeriesSelectItemCountState extends Equatable
{
  final int count;
  SeriesSelectItemCountState({
    required this.count
  });

  @override
  List<Object> get props => [count];
}