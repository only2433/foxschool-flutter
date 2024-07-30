import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:dio/dio.dart';
import 'package:foxschool/common/Common.dart';

class AuthInterceptor extends Interceptor
{
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    var token = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
    var userAgent = Common.TEST_USER_AGENT;

    options.headers['Authorization'] = "Bearer $token";
    options.headers['api-user-agent'] = Common.TEST_USER_AGENT;

    super.onRequest(options, handler);
  }
}