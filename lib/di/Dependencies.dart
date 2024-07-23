import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:foxschool/api/intercepter/AuthInterceptor.dart';
import 'package:foxschool/api/intercepter/LoggingInterceptor.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/bookshelf/api/MyBookshelfBloc.dart';
import 'package:foxschool/bloc/category_contents_list/api/CategoryContentsDataBloc.dart';
import 'package:foxschool/bloc/flashcard/api/FlashcardBloc.dart';
import 'package:foxschool/bloc/intro/api/IntroBloc.dart';
import 'package:foxschool/bloc/management/api/ManagementMyBooksBloc.dart';
import 'package:foxschool/bloc/movie/api/MovieContentsBloc.dart';
import 'package:foxschool/bloc/quiz/api/QuizInformationBloc.dart';
import 'package:foxschool/bloc/search/api/SearchContentsBloc.dart';
import 'package:foxschool/bloc/series_contents_list/api/SeriesContentsListBloc.dart';
import 'package:foxschool/bloc/vocabulary/api/VocabularyBloc.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/ApiClient.dart';
import 'package:get_it/get_it.dart';

import '../bloc/login/api/LoginBloc.dart';
import '../common/Common.dart';

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

  getIt.registerLazySingleton(() => FoxSchoolRepository(dio: getIt<Dio>(), apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton(() => IntroBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => LoginBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => SeriesContentsBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => CategoryContentsDataBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => SearchContentsBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => MovieContentsBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => QuizInformationBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => VocabularyBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => ManagementMyBooksBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => MyBookshelfBloc(repository: getIt<FoxSchoolRepository>()));
  getIt.registerLazySingleton(() => FlashcardBloc(repository: getIt<FoxSchoolRepository>()));
}



