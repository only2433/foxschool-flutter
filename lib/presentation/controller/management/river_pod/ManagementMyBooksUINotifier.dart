
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';
import 'package:foxschool/presentation/controller/management/river_pod/data/ManagementMybooksUIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ManagementMyBooksUINotifier.g.dart';

@riverpod
class ManagementMyBooksUINotifier extends _$ManagementMyBooksUINotifier
{
  @override
  ManagementMybooksUIState build() {
    return ManagementMybooksUIState(
        colorType: MyBooksColorType.RED,
        title: "",
        bookName: "",
        buttonText: "");
  }

  void setBookColorType(MyBooksColorType type)
  {
    state = state.copyWith(
      colorType: type
    );
  }

  void setBookTitle(String text)
  {
    state = state.copyWith(
      title: text
    );
  }

  void setBookName(String name)
  {
    state = state.copyWith(
      bookName: name
    );
  }

  void setButtonText(String text)
  {
    state = state.copyWith(
      buttonText: text
    );
  }

}