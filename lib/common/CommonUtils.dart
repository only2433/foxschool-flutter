import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/enum/Grade.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';
import 'package:foxschool/enum/DeviceType.dart';

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

  String getFormatTimeText(int time) {
    // 시간과 분 계산
    int hours = time ~/ 60; // 정수 나눗셈으로 시간 계산
    int minutes = time % 60; // 분 계산

    // 시간과 분을 "00" 형식의 문자열로 변환
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');

    // 시간과 분을 합쳐서 시간 문자열 생성
    return '$hoursStr:$minutesStr';
  }



  String getBookResource(String color)
  {
    switch(color)
    {
      case "red":
        return 'assets/image/bookshelf_01.png';
      case "orange":
        return 'assets/image/bookshelf_02.png';
      case "green":
        return 'assets/image/bookshelf_03.png';
      case "blue":
        return 'assets/image/bookshelf_04.png';
      case "purple":
        return 'assets/image/bookshelf_05.png';
      case "pink":
        return 'assets/image/bookshelf_06.png';
    }
    return 'assets/image/bookshelf_01.png';
  }

  MyBooksColorType getMyBooksType(String color)
  {
    switch(color)
    {
      case "red":
        return MyBooksColorType.RED;
      case "orange":
        return MyBooksColorType.ORANGE;
      case "green":
        return MyBooksColorType.GREEN;
      case "blue":
        return MyBooksColorType.BLUE;
      case "purple":
        return MyBooksColorType.PURPLE;
      case "pink":
        return MyBooksColorType.PINK;
    }
    return MyBooksColorType.RED;
  }

  String getMyBooksColorText(MyBooksColorType type)
  {
    switch(type)
    {
      case MyBooksColorType.RED:
        return 'red';
      case MyBooksColorType.ORANGE:
        return 'orange';
      case MyBooksColorType.GREEN:
        return 'green';
      case MyBooksColorType.BLUE:
        return 'blue';
      case MyBooksColorType.PURPLE:
        return 'purple';
      case MyBooksColorType.PINK:
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

  int getRandomNumber(int maxCount, int exceptNumber)
  {
    int seedNumber = -1;
    Random rand = Random(DateTime.now().microsecondsSinceEpoch);
    do
    {
      seedNumber = rand.nextInt(maxCount);
    } while(seedNumber == exceptNumber);

    return seedNumber;

  }

  double getVocabularyContentViewSize(int lineCount)
  {
    switch(lineCount)
    {
      case 1:
      case 2:
        return getWidth(174);
      case 3:
        return getWidth(210);
      case 4:
        return getWidth(280);
      case 5:
        return getWidth(330);
      default:
        return getWidth(390);
    }
  }


  Grade getMyGrade(int quizCorrectCount, int quizTotalCount)
  {
    if (quizCorrectCount == quizTotalCount)
    {
      return Grade.EXCELLENT;
    }

    switch (quizTotalCount) {
      case < 6:
        if (quizCorrectCount >= quizTotalCount - 1)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= quizTotalCount - 2)
        {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
      case < 11:
        if (quizCorrectCount >= quizTotalCount - 1)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= quizTotalCount - 3)
        {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
      case < 15:
        if (quizCorrectCount >= 8)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= 6)
        {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
      case < 17:
        if (quizCorrectCount >= 13)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= 11) {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
      case < 20:
        if (quizCorrectCount >= 15)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= 13)
        {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
      default:
        if (quizCorrectCount >= 18)
        {
          return Grade.VERY_GOOD;
        }
        else if (quizCorrectCount >= 16)
        {
          return Grade.GOOD;
        }
        else
        {
          return Grade.POOL;
        }
    }
  }

}