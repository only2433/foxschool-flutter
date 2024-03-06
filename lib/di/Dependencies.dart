import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:foxschool/api/remote_intro/IntroRepository.dart';
import 'package:foxschool/bloc/intro/IntroBloc.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/ApiClient.dart';
import 'package:get_it/get_it.dart';

import '../common/Common.dart';

final getIt = GetIt.instance;
Future<void> init() async
{

  final dio = Dio();
  String accessToken = await Preference.getString(Common.PARAMS_ACCESS_TOKEN);
  dio.options.headers['Authorization'] = "Bearer " + accessToken;
  dio.options.headers['api-user-agent'] = "LF_APP_AOS:phone/1.0.0/SM-N981N/Android:13";
  getIt.registerSingleton(dio);

  final apiClient = ApiClient(getIt<Dio>());
  getIt.registerSingleton(apiClient);

  getIt.registerLazySingleton(() => IntroRepository(dio: getIt<Dio>(), apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton(() => IntroBloc(repository: getIt<IntroRepository>()));
}



