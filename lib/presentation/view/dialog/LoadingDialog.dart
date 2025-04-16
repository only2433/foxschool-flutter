import "package:flutter/material.dart";

import "package:foxschool/values/AppColors.dart";

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
  return const Center(
    child: CircularProgressIndicator(
        color: AppColors.color_47e1ad
    ),
  );
}