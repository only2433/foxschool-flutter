
import 'package:flutter/material.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/presentation/view/widget/BottomContentLayoutWidget.dart';

Future<void> showBottomContentItemDialog({
  required BuildContext context,
  required ContentsBaseResult data,
  final bool isFullName = false,
  final bool isDeleteItemInBookshelf = false,
  final bool isDisableBookshelf = false,
  final int index = 0,
  final String indexColor = "",
  required Function(ContentsItemType type) onItemTypeSelected
  }) async
{
  showModalBottomSheet(
      context: context, builder: (context) {
        return BottomContentLayoutWidget(
            data: data,
            isFullName: isFullName,
            isDeleteItemInBookshelf: isDeleteItemInBookshelf,
            isDisableBookshelf: isDisableBookshelf,
            index: index,
            indexColor: indexColor,
            onItemTypeSelected: onItemTypeSelected);
      },);
}