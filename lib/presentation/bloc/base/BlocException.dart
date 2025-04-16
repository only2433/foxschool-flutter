
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/common/Preference.dart' as Preference;


import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'BlocState.dart';

mixin BlocException
{
  void processException(Bloc bloc, String text) async
  {
    Map<String, dynamic> data = json.decode(text);
    BaseResponse response = BaseResponse.fromJson(data);
    Logcats.error("response : $text");
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

  Future<CommonAPIState> processRequestException(String text) async
  {
    Map<String, dynamic> data = json.decode(text);
    BaseResponse response = BaseResponse.fromJson(data);
    Logcats.error("response : $text");
    if(response.access_token != "")
    {
      await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
    }

    if(response.isDuplicateLogin())
    {
      return CommonAPIState.authenticationErrorState(true, response.message);
    }
    else if(response.isAuthenticationBroken())
    {
      return CommonAPIState.authenticationErrorState(false, response.message);
    }
    else
    {
      return CommonAPIState.errorState(response.message);
    }
  }
}