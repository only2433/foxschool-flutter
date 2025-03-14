
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ManagementMybooksAPIState.freezed.dart';
@freezed
abstract class ManagementMybooksAPIState with _$ManagementMybooksAPIState
{
  const factory ManagementMybooksAPIState.common(CommonAPIState state) = _Common;
  const factory ManagementMybooksAPIState.createBookshelf(MyBookshelfResult result) = _CreateBookshelf;
  const factory ManagementMybooksAPIState.createVocabulary(MyVocabularyResult result) = _CreateVocabulary;
  const factory ManagementMybooksAPIState.updateBookshelf(MyBookshelfResult result) = _UpdateBookshelf;
  const factory ManagementMybooksAPIState.updateVocabulary(MyVocabularyResult result) = _UpdateVocabulary;
  const factory ManagementMybooksAPIState.deleteBookshelf() = _DeleteBookshelf;
  const factory ManagementMybooksAPIState.deleteVocabulary() = _DeleteVocabulary;
}