

import 'package:equatable/equatable.dart';

abstract class MoviePlayerMenuState extends Equatable
{
  const MoviePlayerMenuState();

  @override
  List<Object> get props => [];
}

class InitState extends MoviePlayerMenuState {}

class EnableMenuState extends MoviePlayerMenuState
{
  final bool isEnable;
  EnableMenuState({
   required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}

class EnablePrevButtonState extends MoviePlayerMenuState
{
  final bool isEnable;
  EnablePrevButtonState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}

class EnableNextButtonState extends MoviePlayerMenuState
{
  final bool isEnable;
  EnableNextButtonState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}

class ChangePlayButtonState extends MoviePlayerMenuState
{
  final bool isMoviePlaying;
  ChangePlayButtonState({
    required this.isMoviePlaying
  });

  @override
  List<Object> get props => [isMoviePlaying];
}

class EnableCaptionButtonState extends MoviePlayerMenuState
{
  final bool isEnable;
  EnableCaptionButtonState({
    required this.isEnable
  });

  @override
  List<Object> get props => [isEnable];
}