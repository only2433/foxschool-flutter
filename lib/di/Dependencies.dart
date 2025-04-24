
import 'package:dio/dio.dart';
import 'package:foxschool/di/intercepter/AuthInterceptor.dart';
import 'package:foxschool/di/intercepter/LoggingInterceptor.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/data/repository/FoxSchoolRepositoryImpl.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/remote/ApiClient.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
Future<void> init() async
{
  final FoxschoolLocalization foxschoolLocalization = FoxschoolLocalization(filePath: 'assets/json/string_kr.json');
  await foxschoolLocalization.onSetting();
  getIt.registerSingleton(foxschoolLocalization);

  final dio = Dio();
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(LoggingInterceptor());
  getIt.registerSingleton(dio);

  final apiClient = ApiClient(getIt<Dio>());
  getIt.registerSingleton(apiClient);
  getIt.registerLazySingleton<FoxSchoolRepository>(() => FoxSchoolRepositoryImpl(dio: getIt<Dio>(), apiClient: getIt<ApiClient>()));
}



