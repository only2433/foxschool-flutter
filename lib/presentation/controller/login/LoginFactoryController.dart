
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/school_data/SchoolData.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/controller/login/river_pod/LoginAPINotifier.dart';
import 'package:foxschool/presentation/controller/login/river_pod/LoginUINotifier.dart';
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;


class LoginFactoryController extends BlocController {

  late StreamSubscription _subscription;
  late List<SchoolData> _schoolDataList;
  List<SchoolData> _currentSearchSchoolList = [];
  String _schoolName = "";
  bool _isAutoLoginCheck = false;
  late LoginAPINotifierProvider _repositoryProvider;

  final BuildContext context;
  final WidgetRef widgetRef;
  LoginFactoryController({
    required this.context,
    required this.widgetRef
  });

  @override
  void init() {
    _repositoryProvider = loginAPINotifierProvider(getIt<FoxSchoolRepository>());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL));
      widgetRef.read(_repositoryProvider.notifier).requestSchoolData();
    });
    _settingRequestDataNotifier();
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (common){
            common.maybeWhen(
                loadingState: (){
                  LoadingDialog.show(context);
                },
                errorState: (message){
                  LoadingDialog.dismiss(context);
                  //Fluttertoast.showToast(msg: message);
                },
                orElse: (){}
             );
          },
          schoolDataLoadedState: (data){
            Logcats.message("LoadedState : ${data.toString()}");
            LoadingDialog.dismiss(context);
            _schoolDataList = data;
          },
          loginLoadedState: (data){
            Logcats.message("LoadedState : ${data.toString()}");
            LoadingDialog.dismiss(context);
            Navigator.of(context).pop(true);
          });
    });
  }

  void _settingCurrentSearchSchoolList() {
    _currentSearchSchoolList = [];
    for (int i = 0; i < _schoolDataList.length; i++) {
      if (_schoolDataList[i].name.contains(_schoolName)) {
        _currentSearchSchoolList.add(_schoolDataList[i]);
      }
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

  @override
  void onBackPressed()
  {
    Navigator.of(context).pop(false);
  }

  String getSchoolID(String selectSchoolName) {
    String result = "";
    for (var data in _schoolDataList) {
      if (data.name == selectSchoolName) {
        result = data.id;
        break;
      }
    }
    return result;
  }

  void onClickLogin(String userID, String password, String schoolCode) {
    widgetRef.read(_repositoryProvider.notifier).requestLoginData(
        userID,
        password,
        schoolCode);
  }

  void onInitSchoolData()
  {
    _schoolName = "";
    _currentSearchSchoolList.clear();
    widgetRef.read(loginUINotifierProvider.notifier).setSchoolList(_currentSearchSchoolList);
  }

  void onSetSchoolName(String value)
  {
    Logcats.message("value : $value");
    _schoolName = value;
    widgetRef.read(loginUINotifierProvider.notifier).setSchoolName(_schoolName);
  }

  void onSetFindSchoolList(List<SchoolData> list)
  {
    _currentSearchSchoolList = list;
    widgetRef.read(loginUINotifierProvider.notifier).setSchoolList(_currentSearchSchoolList);
  }

  void onChangeSchoolData(String value)
  {
    _schoolName = value;
    _settingCurrentSearchSchoolList();
    widgetRef.read(loginUINotifierProvider.notifier).setSchoolName(_schoolName);
    widgetRef.read(loginUINotifierProvider.notifier).setSchoolList(_currentSearchSchoolList);
  }

  void onCheckAutoLogin() async
  {
    _isAutoLoginCheck = !_isAutoLoginCheck;
    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, _isAutoLoginCheck);
    widgetRef.read(loginUINotifierProvider.notifier).enableAutoLogin(_isAutoLoginCheck);
  }
}