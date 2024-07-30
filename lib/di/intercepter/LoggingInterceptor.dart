import 'dart:convert';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 요청 전에 호출되는 부분
    print("--> ${options.method} ${options.uri}");
    print("Headers: ${options.headers}");
    print("Data: ${jsonEncode(options.data)}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 응답을 받은 후 호출되는 부분
    print("<-- ${response.statusCode} ${response.requestOptions.path}");
    print("Headers: ${response.headers}");
    print("Response: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 에러가 발생한 경우 호출되는 부분
    print("<-- Error --> ${err.message}");
    super.onError(err, handler);
  }
}