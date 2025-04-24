
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Fluttertoast {
  static final Fluttertoast _instance = Fluttertoast._internal();
  final String TAG = "System.out";

  static const MethodChannel _channel = MethodChannel('com.littlefox.app.foxschool/event');

  Fluttertoast._internal();

  static Future<void> initialize() async
  {
    if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod('initialize');
      }
      catch (e) {
        debugPrint("Logger initialization failed : $e");
      }
    }
  }

  static void showToast({required String msg}) {
    _instance._show(msg);
  }

  void _show(String message)
  {
    if(Platform.isAndroid)
      {
        _channel.invokeListMethod('toast',{
          'message': message
        });
      }
  }
}