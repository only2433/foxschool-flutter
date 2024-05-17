import "package:flutter/material.dart";

import "../../values/AppColors.dart";


void show(BuildContext context)
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return _showLoading();
    },);

}

void dismiss(BuildContext context)
{
  if (Navigator.of(context).canPop())
  {
    Navigator.of(context).pop();
  }
}

Widget _showLoading()
{
  return Center(
    child: CircularProgressIndicator(
        color: AppColors.color_47e1ad
    ),
  );
}