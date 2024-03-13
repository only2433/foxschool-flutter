import "package:flutter/material.dart";


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
    child: CircularProgressIndicator(),
  );
}