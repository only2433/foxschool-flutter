import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:foxschool/api/intercepter/AuthInterceptor.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/intro/IntroBloc.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/ApiClient.dart';
import 'package:get_it/get_it.dart';

import '../bloc/login/LoginBloc.dart';
import '../common/Common.dart';

final getIt = GetIt.instance;
Future<void> init() async
{
  final FoxschoolLocalization foxschoolLocalization = FoxschoolLocalization(filePath: 'asset/json/string_kr.json');
  await foxschoolLocalization.onSetting();
  getIt.registerSingleton(foxschoolLocalization);

  final dio = Dio();
  dio.interceptors.add(AuthInterceptor());
  getIt.registerSingleton(dio);

  final apiClient = ApiClient(getIt<Dio>());
  getIt.registerSingleton(apiClient);

  getIt.registerLazySingleton(() => FoxSchoolRepository(dio: getIt<Dio>(), apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton(() => IntroBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => LoginBloc(repository: getIt<FoxSchoolRepository>()));
}



