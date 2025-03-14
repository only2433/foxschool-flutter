

import 'package:foxschool/enum/MyBooksColorType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ManagementMybooksUIState.freezed.dart';
@freezed
class ManagementMybooksUIState with _$ManagementMybooksUIState
{
  factory ManagementMybooksUIState({
    required MyBooksColorType colorType,
    required String title,
    required String bookName,
    required String buttonText
  }) = _ManagementMybooksUIState;
}