
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/data/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/view/widget/BottomContentLayoutWidget.dart';

import '../../enum/ContentsItemType.dart';

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