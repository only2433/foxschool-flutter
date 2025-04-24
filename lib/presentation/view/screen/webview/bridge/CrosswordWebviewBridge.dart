import 'package:flutter/cupertino.dart';
import 'package:foxschool/common/Common.dart';

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
   //Fluttertoast.showToast(msg: message);
    await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
      Navigator.of(context).pop();
    },);
  }
}