

import 'package:freezed_annotation/freezed_annotation.dart';

part 'MoviePlayerMenuState.freezed.dart';

@freezed
sealed class MoviePlayerMenuState with _$MoviePlayerMenuState
{
  const MoviePlayerMenuState._();
  const factory MoviePlayerMenuState.init() = Init;
  const factory MoviePlayerMenuState.enableMenu(bool isEnable) = EnableMenu;
  const factory MoviePlayerMenuState.enablePrevButton(bool isEnable) = EnablePrevButton;
  const factory MoviePlayerMenuState.enableNextButton(bool isEnable) = EnableNextButton;
  const factory MoviePlayerMenuState.changePlayButton(bool isMoviePlaying) = ChangePlayButton;
  const factory MoviePlayerMenuState.enableCaptionButton(bool isEnable) = EnableCaptionButton;

}