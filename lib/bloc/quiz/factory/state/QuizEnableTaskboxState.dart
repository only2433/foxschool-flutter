
import 'package:equatable/equatable.dart';

class QuizEnableTaskboxState extends Equatable
{
  final bool isEnable;
  QuizEnableTaskboxState({
    required this.isEnable
  });

  @override
  List<Object?> get props => [isEnable];

}