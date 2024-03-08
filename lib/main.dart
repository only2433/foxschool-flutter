import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/api/remote_intro/IntroRepository.dart';
import 'package:foxschool/bloc/intro/IntroBloc.dart';
import 'package:foxschool/bloc/observer/FoxschoolBlocObserver.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/route/RouteHelper.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/LoginScreen.dart';
import 'package:foxschool/view/screen/webview/FoxschoolIntroduceScreen.dart';
import 'package:foxschool/di/Dependencies.dart' as Dependencies;

import 'data/base/BaseResponse.dart';
import 'di/Dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = FoxschoolBlocObserver();
  await Dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => getIt<IntroBloc>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteHelper.getGenerateRoute,
          initialRoute: RouteHelper.getIntro(),
        )
    );
  }
}

