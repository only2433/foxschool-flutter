
import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/BottomAddBookWidget.dart';
import 'package:foxschool/presentation/view/widget/BottomIntervalSelectWidget.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/presentation/view/widget/RobotoRegularText.dart';

const int BUTTON_1_CLICK = 0;
const int BUTTON_2_CLICK = 1;

Future<void> showSelectDialog({
  required BuildContext context,
  required String message,
  required String buttonText,
  required VoidCallback onSelected}) async
{
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _AlertSelectDialog(
            context,
            message,
            buttonText,
            onSelected
        );
      },
  );
}

Future<void> showSelectDetailDialog({
  required BuildContext context,
  required String message,
  required String button1Text,
  required String button2Text,
  required Function(int index) onSelected}) async
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _AlertSelectDetailDialog(
          context,
          message,
          button1Text,
          button2Text,
          onSelected
      );
    },
  );
}

Future<void> showConfirmDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onSelected}) async
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _AlertConfirmDialog(
          context,
          message,
          onSelected
      );
    },
  );
}

Future<void> showBottomIntervalSelectDialog({
  required BuildContext context,
  required int currentIntervalIndex,
  required Function(int index) onItemPressed
}) async
{
  showModalBottomSheet(context: context, builder: (context) {
    return BottomIntervalSelectWidget(
        currentSelectIndex: currentIntervalIndex,
        onItemPressed: onItemPressed);
  },);
}

Future<void> showBottomAddVocabularySelectDialog({
  required BuildContext context,
  required List<MyVocabularyResult> list,
  required Function(int index) onItemPressed
}) async
{
  showModalBottomSheet(context: context, builder: (context) {
    return BottomAddBookWidget(
        bookType: MyBooksType.VOCABULARY,
        vocabularyList: list,
        onItemPressed: onItemPressed);
  },);
}

Future<void> showBottomAddBookshelfSelectDialog({
  required BuildContext context,
  required List<MyBookshelfResult> list,
  required Function(int index) onItemPressed
}) async
{
  showModalBottomSheet(context: context, builder: (context) {
    return BottomAddBookWidget(
        bookType: MyBooksType.BOOKSHELF,
        bookshelfList: list,
        onItemPressed: onItemPressed);
  },);
}





Widget _AlertSelectDialog(BuildContext context, String message, String buttonText, VoidCallback onSelected)
{
  return AlertDialog(
    content:  RobotoNormalText(
        text: message,
        fontSize: CommonUtils.getInstance(context).getWidth(40),
        color: AppColors.color_000000,
        maxLines: 3,
      ),
    actionsPadding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(10)),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
              alignment: Alignment.bottomCenter
          ),
          child: RobotoNormalText(
            text: getIt<FoxschoolLocalization>().data['text_cancel'],
            fontSize: CommonUtils.getInstance(context).getWidth(35),
            color: AppColors.color_5c42a6,
          )
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSelected();
          },
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
            alignment: Alignment.bottomCenter
          ),
          child: RobotoNormalText(
            text: buttonText,
            fontSize: CommonUtils.getInstance(context).getWidth(35),
            color: AppColors.color_5c42a6,
          )
      )
    ],
  );
}


Widget _AlertSelectDetailDialog(
    BuildContext context,
    String message,
    String button1Text,
    String button2Text,
    Function(int position) onSelected)
{
  return AlertDialog(
    content:  RobotoNormalText(
      text: message,
      fontSize: CommonUtils.getInstance(context).getWidth(40),
      color: AppColors.color_000000,
    ),
    actionsPadding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(10)),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSelected(0);
          },
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
              alignment: Alignment.bottomCenter
          ),
          child: RobotoNormalText(
            text: button1Text,
            fontSize: CommonUtils.getInstance(context).getWidth(35),
            color: AppColors.color_5c42a6,
          )
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSelected(1);
          },
          style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
              alignment: Alignment.bottomCenter
          ),
          child: RobotoNormalText(
            text: button2Text,
            fontSize: CommonUtils.getInstance(context).getWidth(35),
            color: AppColors.color_5c42a6,
          )
      )
    ],
  );
}

Widget _AlertConfirmDialog(BuildContext context, String message, VoidCallback onSelected)
{
  return AlertDialog(
    content: RobotoNormalText(
      text: message,
      fontSize: CommonUtils.getInstance(context).getWidth(45),
      color: AppColors.color_000000,
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSelected();
          },
          child: RobotoRegularText(
            text: getIt<FoxschoolLocalization>().data['text_confirm'],
            fontSize: CommonUtils.getInstance(context).getWidth(35),
            color: AppColors.color_5c42a6,
          )
      )
    ],
  );
}