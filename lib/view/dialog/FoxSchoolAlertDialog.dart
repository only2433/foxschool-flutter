

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';


Future<void> showSelectDialog(BuildContext context, String message, String buttonText, VoidCallback onSelected) async
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

Future<void> showConfirmDialog(BuildContext context, String message,  VoidCallback onSelected) async
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


Widget _AlertSelectDialog(BuildContext context, String message, String buttonText, VoidCallback onSelected)
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