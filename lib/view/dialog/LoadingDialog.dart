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
  Navigator.of(context).pop();
}

Widget _showLoading()
{
  return Center(
    child: CircularProgressIndicator(),
  );
}