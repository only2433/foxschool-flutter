import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class FoxschoolBlocObserver extends BlocObserver
{
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //  Logger.d('bloc: ${bloc.runtimeType}, event: ${change}');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
 //   Logger.d('bloc: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.d('bloc: ${bloc.runtimeType}, error: ${error.toString()}');
  }


}