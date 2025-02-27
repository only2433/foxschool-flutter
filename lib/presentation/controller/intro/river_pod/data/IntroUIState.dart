
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../enum/IntroScreenType.dart';

part 'IntroUIState.freezed.dart';

@freezed
class IntroUIState with _$IntroUIState
{
  factory IntroUIState({
    required IntroScreenType type,
    required double percent
  }) = _IntroUIState;
}