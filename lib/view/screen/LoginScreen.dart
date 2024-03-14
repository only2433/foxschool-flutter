import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/login/LoginBloc.dart';
import 'package:foxschool/bloc/login/state/LoginLoadedState.dart';
import 'package:foxschool/view/widget/BlueTextButton.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_loading_dialog/simple_loading_dialog.dart';

import '../../bloc/intro/IntroBloc.dart';
import '../../bloc/login/event/GetSchoolDataEvent.dart';
import '../../bloc/login/event/LoginEvent.dart';
import '../../bloc/login/state/SchoolDataLoadedState.dart';
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../common/Preference.dart' as Preference;
import '../../data/school_data/SchoolData.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
import '../widget/LightBlueTextButton.dart';
import '../widget/TopTitleWidget.dart';
import '../dialog/LoadingDialog.dart' as LoadingDialog;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _schoolNameTextController = TextEditingController();
  final int MAX_TEXT_FIELD_COUNT = 3;
  final _formKey = GlobalKey<FormState>();
  late List<FocusNode> _focusNodeList;
  late StreamSubscription _subscription;
  late List<SchoolData> _schoolDataList;
  bool _isAutoLoginCheck = false;
  String _schoolName = "";
  String _userID = "";
  String _userPassword = "";
  String _selectSchoolID = "";
  List<SchoolData> _currentSearchSchoolList = [];
  bool isSchoolListItemSelected = false;
  bool isLoginSuccess = false;

  @override
  void initState() {
    super.initState();
    Logger.d("initState");
    isLoginSuccess = false;
    settingFocusNode();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp)
    {

      context.read<LoginBloc>().add(
          GetSchoolDataEvent()
      );
    });
    settingSubscriptions();

  }

  void settingSubscriptions()
  {

    var blocState;
    _subscription = context.read<LoginBloc>().stream.listen((state) {

      switch (state.runtimeType) {
        case LoadingState:
          {
            LoadingDialog.show(context);
            break;
          }
        case SchoolDataLoadedState:
          {
            blocState = state as SchoolDataLoadedState;
            Logger.d("LoadedState : ${blocState.data.toString()}");
            LoadingDialog.dismiss(context);
            _schoolDataList = blocState.data;
            break;
          }
        case LoginLoadedState:
          {
            blocState = state as LoginLoadedState;
            Logger.d("LoadedState : ${blocState.data.toString()}");
            LoadingDialog.dismiss(context);
            isLoginSuccess = true;
            Navigator.of(context).pop(isLoginSuccess);
            break;
          }
        case ErrorState:
          {
            var errorState = state as ErrorState;
            LoadingDialog.dismiss(context);
            CommonUtils.getInstance(context).showErrorMessage(errorState.message);
            break;
          }
      }
    });
  }

  void settingFocusNode() {
    _focusNodeList = List.generate(MAX_TEXT_FIELD_COUNT, (index) => FocusNode());
    for (var focus in _focusNodeList) {
      focus.addListener(() {
        setState(() {
        });
      });
    }
  }

  void settingCurrentSearchSchoolList()
  {
    _currentSearchSchoolList = [];
    for(int i = 0; i < _schoolDataList.length; i++)
      {
        if(_schoolDataList[i].name.contains(_schoolName))
          {
            _currentSearchSchoolList.add(_schoolDataList[i]);
          }
      }
  }

  String getSchoolID(String selectSchoolName)
  {
    String result = "";
    for(var data in _schoolDataList)
    {
      if(data.name == selectSchoolName)
      {
        result = data.id;
        break;
      }
    }
    return result;
  }

  void submitLogin()
  {
    if(_selectSchoolID == "" || _userID == "" || _userPassword == "")
    {
      if(_selectSchoolID == "")
        {
          CommonUtils.getInstance(context).showErrorMessage(
            getIt<FoxschoolLocalization>().data['message_warning_empty_school']
          );
        }
      else if(_userID == "")
        {
          CommonUtils.getInstance(context).showErrorMessage(
              getIt<FoxschoolLocalization>().data['message_warning_empty_id']
          );
        }
      else if(_userPassword == "")
        {
          CommonUtils.getInstance(context).showErrorMessage(
              getIt<FoxschoolLocalization>().data['message_warning_empty_password']
          );
        }
    }
    else
    {
      context.read<LoginBloc>().add(
          LoginEvent(
              loginID: _userID.trim().toString(),
              password: _userPassword.trim().toString(),
              schoolCode: _selectSchoolID)
      );
    }
  }

  void disposeFocusNode() {
    for (var focusNode in _focusNodeList) {
      focusNode.dispose();
    }
  }

  @override
  void activate() {
    super.activate();
    Logger.d("activate");
  }


  @override
  void dispose() {
    _subscription.cancel();
    _schoolNameTextController.dispose();
    disposeFocusNode();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_47e1ad,
        child: SafeArea(
            child: Column(
                children: [
                  TopTitleWidget(
                      title: getIt<FoxschoolLocalization>().data['text_login'],
                      type: TopTitleButtonType.BACK,
                      onPressed: () {
                        Navigator.of(context).pop(isLoginSuccess);
                      },
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.color_edeef2,
                      child: Padding(
                        padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(30)),
                        child: Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: CommonUtils.getInstance(context).getHeight(1000),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.color_999999,
                                        width: CommonUtils.getInstance(context).getWidth(2)
                                    ),
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10))
                                ),
                                child: Column(
                                  children: [
                                    _InputTextField(),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(50),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _isAutoLoginCheck = !_isAutoLoginCheck;
                                            });
                                            Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, _isAutoLoginCheck);
                                          },
                                          child: _isAutoLoginCheck == false ?
                                          Image.asset('asset/image/radio_off.png',
                                            width: CommonUtils.getInstance(context).getWidth(60),
                                            height: CommonUtils.getInstance(context).getWidth(60)) :
                                          Image.asset('asset/image/radio_on.png',
                                            width: CommonUtils.getInstance(context).getWidth(60),
                                            height: CommonUtils.getInstance(context).getWidth(60),
                                          ),
                                        ),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(20),
                                        ),
                                        Text(getIt<FoxschoolLocalization>().data['text_auto_login'],
                                        style: TextStyle(
                                          color: AppColors.color_444444,
                                          fontFamily: 'Roboto',
                                          fontSize: CommonUtils.getInstance(context).getWidth(40),
                                          fontWeight: FontWeight.normal
                                        ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(35),
                                    ),
                                    LightBlueTextButton(
                                        width: CommonUtils.getInstance(context).getWidth(880),
                                        height: CommonUtils.getInstance(context).getWidth(120),
                                        text: getIt<FoxschoolLocalization>().data['text_login'],
                                        onPressed: () {
                                          submitLogin();
                                        },),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(88),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RobotoNormalText(
                                            text: getIt<FoxschoolLocalization>().data['text_find_login'],
                                            fontSize: CommonUtils.getInstance(context).getWidth(38),
                                            color: AppColors.color_444444),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(40),
                                        ),
                                        Container(
                                          width: CommonUtils.getInstance(context).getWidth(2),
                                          height: CommonUtils.getInstance(context).getWidth(40),
                                          decoration: BoxDecoration(
                                            color: AppColors.color_444444,
                                          ),
                                        ),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(40),
                                        ),
                                        RobotoNormalText(
                                            text: getIt<FoxschoolLocalization>().data['text_find_password'],
                                            fontSize: CommonUtils.getInstance(context).getWidth(40),
                                            color: AppColors.color_444444),
                                      ],
                                    )
                                  ],
                                )
                            ),
                            if(_schoolName.length > 0 && _focusNodeList[0].hasFocus)
                              _SchoolListView(),
                            _bottomInfoLayout()
                          ],
                        ),
                      ),
                    ),
                  )
                ])
            )
        )
    );
  }

  Widget _InputTextField()
  {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(30)),
        child: Column(
          children: [
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(75),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(120),
              padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(35)),
              child: TextFormField(
                key: const ValueKey(1),
                focusNode: _focusNodeList[0],
                controller: _schoolNameTextController,
                onTap: () {
                  _schoolNameTextController.text = "";
                  _currentSearchSchoolList = [];
                  _schoolName = "";
                  isSchoolListItemSelected = false;
                },
                onSaved: (newValue) {
                  Logger.d("onSaved : ${newValue}");
                  _schoolName = newValue!;
                },
                onFieldSubmitted: (value) {
                  Logger.d("onSaved : ${value}");
                  String schoolID = getSchoolID(value);
                  if(schoolID == "")
                  {
                    _schoolNameTextController.clear();
                      setState(() {
                        _schoolName = "";
                      });
                  }
                  else
                  {
                    _selectSchoolID = schoolID;
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _schoolName = value;
                    settingCurrentSearchSchoolList();
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('asset/image/icon_search_2.png',
                        width: CommonUtils.getInstance(context).getWidth(45),
                        height: CommonUtils.getInstance(context).getHeight(53),
                        fit: BoxFit.contain,
                        color: _focusNodeList[0].hasFocus ? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    suffixIcon: _schoolName.length > 0 && _focusNodeList[0].hasFocus ?  GestureDetector(
                      onTap: () {
                        _schoolNameTextController.clear();

                        setState(() {
                          _schoolName = "";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset('asset/image/btn_tex_del.png',
                          width: CommonUtils.getInstance(context).getWidth(60),
                          height: CommonUtils.getInstance(context).getWidth(60),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ) : null,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: _schoolName.length > 0  && _focusNodeList[0].hasFocus ? BorderRadius.only(
                              topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(10)),
                              topRight: Radius.circular(CommonUtils.getInstance(context).getWidth(10))
                            ) :
                             BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: _schoolName.length > 0  && _focusNodeList[0].hasFocus ? BorderRadius.only(
                            topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(10)),
                            topRight: Radius.circular(CommonUtils.getInstance(context).getWidth(10))
                        ) :BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    contentPadding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(2)),
                    hintText: getIt<FoxschoolLocalization>().data['text_school_search'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(40),
                        fontFamily: 'Roboto'
                    )
                ),
              ),
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(28),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(120),
              padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(35)),
              child: TextFormField(
                key: const ValueKey(2),
                focusNode: _focusNodeList[1],
                keyboardType: TextInputType.text,
                onSaved: (newValue) {
                  _userID = newValue!;
                },
                onChanged: (value) {
                  _userID = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding:  EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(34) ,
                          top: CommonUtils.getInstance(context).getWidth(32),
                          right: CommonUtils.getInstance(context).getWidth(34),
                          bottom: CommonUtils.getInstance(context).getWidth(32)
                      ),
                      child: Image.asset('asset/image/icon_id.png',
                        width: CommonUtils.getInstance(context).getWidth(50),
                        height: CommonUtils.getInstance(context).getWidth(52),
                        fit: BoxFit.contain,
                        color: _focusNodeList[1].hasFocus? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    contentPadding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(2)),
                    hintText: getIt<FoxschoolLocalization>().data['text_id_input'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(42),
                        fontFamily: 'Roboto'
                    )
                ),
              ),
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(28),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(120),
              padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(35)),
              child: TextFormField(
                key: const ValueKey(3),
                focusNode: _focusNodeList[2],
                obscureText: true,
                onSaved: (newValue) {
                  _userPassword = newValue!;
                },
                onChanged: (value) {
                  _userPassword = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding:  EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(34) ,
                          top: CommonUtils.getInstance(context).getWidth(32),
                          right: CommonUtils.getInstance(context).getWidth(34),
                          bottom: CommonUtils.getInstance(context).getWidth(32)
                      ),
                      child: Image.asset('asset/image/icon_lock.png',
                        width: CommonUtils.getInstance(context).getWidth(50),
                        height: CommonUtils.getInstance(context).getWidth(57),
                        fit: BoxFit.contain,
                        color: _focusNodeList[2].hasFocus? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(2)
                        )
                    ),
                    contentPadding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(2)),
                    hintText: getIt<FoxschoolLocalization>().data['text_password_input'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(42),
                        fontFamily: 'Roboto'
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _SchoolListView()
  {
    return Positioned(
      top: CommonUtils.getInstance(context).getHeight(195),
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(67)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: CommonUtils.getInstance(context).getHeight(400),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: AppColors.color_999999,
                width: CommonUtils.getInstance(context).getWidth(2)
            ),
          ),
          child: ListView.builder(
            itemCount: _currentSearchSchoolList.length,
            itemBuilder: (context, index) {
              Logger.d("index : ${index}, data : ${_currentSearchSchoolList[index]}");
              return Container(
                height: CommonUtils.getInstance(context).getWidth(100),
                padding: EdgeInsets.only(
                    left: CommonUtils.getInstance(context).getWidth(100)
                ),
                child: ListTile(
                  onTap: () {
                    _selectSchoolID = _currentSearchSchoolList[index].id;
                    setState(() {
                      _schoolName = _currentSearchSchoolList[index].name;
                      _schoolNameTextController.text = _schoolName;
                    });
                    _focusNodeList[0].unfocus();
                  },
                  title: RobotoRegularText(
                    text: _currentSearchSchoolList[index].name,
                    fontSize: CommonUtils.getInstance(context).getWidth(42),
                    color: AppColors.color_333333,
                  ),
                ),
              );
            },),
        ),
      ),
    );
  }

  Widget _bottomInfoLayout()
  {
    return Positioned(
        left: 0,
        right: 0,
        bottom: CommonUtils.getInstance(context).getHeight(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RobotoBoldText(
                text: getIt<FoxschoolLocalization>().data['message_sign_only_web'],
                fontSize: CommonUtils.getInstance(context).getWidth(40),
                color: AppColors.color_444444
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(20),
            ),
            RobotoNormalText(
                text: getIt<FoxschoolLocalization>().data['message_company_information_from_login'],
                fontSize: CommonUtils.getInstance(context).getWidth(40),
                color: AppColors.color_444444,
                align: TextAlign.center)
          ],
        )
    );
  }


}
