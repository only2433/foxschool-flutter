
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/enum/IntroScreenType.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'data/IntroUIState.dart';


part 'IntroUINotifier.g.dart';

@riverpod
class IntroUINotifier extends _$IntroUINotifier{
  @override
  IntroUIState build() {
    return IntroUIState(
        type: IntroScreenType.TYPE_SELECT_MENU,
        percent: 0.0);
  }

  void changeScreenType(IntroScreenType screenType)
  {
    state = state.copyWith(
      type: screenType
    );
  }

  void updateProgress(double progress)
  {
    state = state.copyWith(
      percent: progress
    );
  }
}