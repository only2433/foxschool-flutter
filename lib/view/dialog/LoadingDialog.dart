import "package:flutter/material.dart";
import "package:flutter_easylogger/flutter_logger.dart";

import "../../values/AppColors.dart";

bool _isLoading = false;

void show(BuildContext context)
{
  if(_isLoading == false)
    {
      _isLoading = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return _showLoading();
        },);
    }
}

void dismiss(BuildContext context)
{
  Logger.d("_isLoading : $_isLoading, isPop : ${Navigator.of(context).canPop()}");
  if (_isLoading && Navigator.of(context).canPop())
  {
    _isLoading = false;
    Navigator.of(context).pop();
  }
}

bool isLoading()
{
  return _isLoading;
}

Widget _showLoading()
{
  return Center(
    child: CircularProgressIndicator(
        color: AppColors.color_47e1ad
    ),
  );
}