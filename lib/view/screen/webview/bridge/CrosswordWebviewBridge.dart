import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../common/Common.dart';


class CrosswordWebviewBridge {

  final BuildContext context;
  CrosswordWebviewBridge({
    required this.context
  });

  dynamic handle(String functionName, List<dynamic> params)
  {
    switch(functionName)
    {
      case 'onInterfaceExitView':
        _onInterfaceExitView(params[0]);
        break;
    }
  }

  void _onInterfaceExitView(String message) async
  {
    Logger.d("message : $message");
    Fluttertoast.showToast(msg: message);
    await Future.delayed(Duration(milliseconds: Common.DURATION_NORMAL), () {
      Navigator.of(context).pop();
    },);
  }
}