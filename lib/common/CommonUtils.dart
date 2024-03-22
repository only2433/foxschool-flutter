import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils
{
  static CommonUtils? _instance;
  static late BuildContext _context;

  static CommonUtils getInstance(BuildContext context) {
    if(_instance == null)
    {
      _instance = CommonUtils();
    }
    _context = context;
    return _instance!;
  }

  void showErrorMessage(String errorMessage)
  {
    ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(milliseconds: 1000),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(getWidth(10)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getWidth(10))
            ),
            content: Text(
              errorMessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getWidth(30),
                color: Colors.white,
              ),
            )
        )
    );
  }

  void showSuccessMessage(String successMessage) {
    ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(milliseconds: 1000),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(getWidth(10)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getWidth(10))
            ),
            content: Text(
              successMessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getWidth(30),
                color: Colors.white,
              ),
            )
        )
    );
  }

  double getWidth(dynamic size)
  {
    double displayFactor = MediaQuery.of(_context).size.width/1080;
    return size * displayFactor;
  }

  double getHeight(dynamic size)
  {
    double displayFactor = MediaQuery.of(_context).size.height/1920;
    return size * displayFactor;
  }



}