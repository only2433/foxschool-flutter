import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:foxschool/enum/BookColor.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../enum/DeviceType.dart';

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

  String _twoDigits(int n)
  {
    if(n >= 10)
      {
        return "$n";
      }
    return "0$n";
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

    double displayFactor = MediaQuery.of(_context).orientation == Orientation.portrait ?
      MediaQuery.of(_context).size.width/1080 :
      MediaQuery.of(_context).size.width/1920;
    return size * displayFactor;
  }

  double getHeight(dynamic size)
  {
    double displayFactor = MediaQuery.of(_context).orientation == Orientation.portrait ?
      MediaQuery.of(_context).size.height/1920 :
      MediaQuery.of(_context).size.height/1080;
    return size * displayFactor;
  }

  String getFormatDuration(Duration duration)
  {
    String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }


  BookColor getBookColorType(String color)
  {
    switch(color)
    {
      case "red":
        return BookColor.RED;
      case "orange":
        return BookColor.ORANGE;
      case "green":
        return BookColor.GREEN;
      case "blue":
        return BookColor.BLUE;
      case "purple":
        return BookColor.PURPLE;
      case "pink":
        return BookColor.PINK;
    }
    return BookColor.RED;
  }

  String getBookResource(BookColor color)
  {
    switch(color)
    {
      case BookColor.RED:
        return 'asset/image/bookshelf_01.png';
      case BookColor.ORANGE:
        return 'asset/image/bookshelf_02.png';
      case BookColor.GREEN:
        return 'asset/image/bookshelf_03.png';
      case BookColor.BLUE:
        return 'asset/image/bookshelf_04.png';
      case BookColor.PURPLE:
        return 'asset/image/bookshelf_05.png';
      case BookColor.PINK:
        return 'asset/image/bookshelf_06.png';
    }
  }

  String getBookColorString(BookColor color)
  {
    switch(color)
    {
      case BookColor.RED:
        return 'red';
      case BookColor.ORANGE:
        return 'orange';
      case BookColor.GREEN:
        return 'green';
      case BookColor.BLUE:
        return 'blue';
      case BookColor.PURPLE:
        return 'purple';
      case BookColor.PINK:
        return 'pink';
    }
  }

  // 문자열 형식의 색상 코드를 Color 객체로 변환하는 함수
  Color colorFromHex(String colorCode) {
    final hexCode = colorCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Future<int> getSDKInt() async
  {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt;
  }

  DeviceType getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? DeviceType.PHONE : DeviceType.TABLET;
  }

}