
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stack_trace/stack_trace.dart';

class Logcats {
  static final Logcats _instance = Logcats._internal();
  final String TAG = "System.out";

  static const MethodChannel _channel = MethodChannel('com.littlefox.app.foxschool/log');

  Logcats._internal();

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

  static void message(String message) {
    _instance._log("INFO", message);
  }

  static void warning(String message)
  {
    _instance._log("WARN", message);
  }

  static void error(String message)
  {
    _instance._log("ERROR", message);
  }

  void _log(String level, String message)
  {
    final stackTrace = Trace.current(2);
    final frame = stackTrace.frames.first;

    final fileName = frame.uri.pathSegments.isNotEmpty ? frame.uri.pathSegments.last : "unKnown";
    final functionName = _extractFunctionName(frame);
    final lineNumber = frame.line != null ? frame.line.toString() : "unKnown";

    final DateTime now = DateTime.now();
    final String formattedDate = "${now.day} ${_getMonth(now.month)} ${now.year} ${_formatTime(now)}";
    final String logMessage = "$fileName( $functionName:$lineNumber )    $message";


    if(Platform.isAndroid)
      {
        _channel.invokeMethod('log', {
        'tag': TAG,
        'level': level,
        'message': logMessage
        });
      }
  }

  String _extractFunctionName(Frame frame) {
    final member = frame.member;
    if (member == null) {
      return "unKnown";
    }
    final functionData = member.replaceAll(".<fn>", "");
    return functionData.split('.').last;
  }

  String _getMonth(int month) {
    const List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    int hour = dateTime.hour;
    String amPm = "AM";

    if (hour >= 12) {
      amPm = "PM";
      if (hour > 12) hour -= 12;
    }
    if (hour == 0) hour = 12;

    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');

    return "$hour:$minute:$second $amPm";
  }

  // 로그 레벨에 따른 색상 (ANSI 색상 코드)
  static String _colorForLevel(String level) {
    switch (level) {
      case "INFO": return '\x1B[34m'; // 파란색
      case "WARNING": return '\x1B[33m'; // 노란색
      case "ERROR": return '\x1B[31m'; // 빨간색
      default: return '\x1B[37m'; // 흰색
    }
  }
}