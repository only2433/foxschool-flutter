
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:flutter_easylogger/flutter_logger.dart';

import '../../common/Common.dart';
import '../../data/base/BaseResponse.dart';
import 'BlocState.dart';

mixin BlocException
{
  void processException(Bloc bloc, String text) async
  {
    Map<String, dynamic> data = json.decode(text);
    BaseResponse response = BaseResponse.fromJson(data);
    Logger.d("response : ${text}");
    if(response.access_token != "")
    {
      await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
    }

    if(response.isDuplicateLogin())
    {
      bloc.emit(AuthenticationErrorState(isAutoRestart: true, message: response.message));
    }
    else if(response.isAuthenticationBroken())
    {
      bloc.emit(AuthenticationErrorState(isAutoRestart: false, message: response.message));
    }
    else
    {
      bloc.emit(ErrorState(message: response.message));
    }
  }
}