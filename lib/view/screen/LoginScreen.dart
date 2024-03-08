import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/intro/state/SchoolDataLoadedState.dart';
import 'package:foxschool/view/widget/BlueTextButton.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';
import 'package:simple_loading_dialog/simple_loading_dialog.dart';

import '../../bloc/intro/IntroBloc.dart';
import '../../bloc/intro/event/GetSchoolDataEvent.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
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
  List<String> _currentSearchSchoolList = [];

  @override
  void initState() {
    super.initState();
    Logger.d("initState");
    settingFocusNode();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp)
    {
      LoadingDialog.show(context);
      context.read<IntroBloc>().add(
          GetSchoolDataEvent()
      );
    });

    _subscription = context.read<IntroBloc>().stream.listen((state)
    {
      if (state is SchoolDataLoadedState) {
        Logger.d("LoadedState : ${state.data.toString()}");
        LoadingDialog.dismiss(context);// 다이얼로그 닫기
        _schoolDataList = state.data;
      }
    });
  }

  void settingFocusNode() {
    _focusNodeList = List.generate(MAX_TEXT_FIELD_COUNT, (index) => FocusNode());
    for (var focusNode in _focusNodeList) {
      focusNode.addListener(() {
        setState(() {});
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
            _currentSearchSchoolList.add(_schoolDataList[i].name);
          }
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
                        Navigator.of(context).pop();
                      },
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.color_edeef2,
                      child: Padding(
                        padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(15)),
                        child: Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: CommonUtils.getInstance(context).getHeight(400),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.color_999999,
                                        width: CommonUtils.getInstance(context).getWidth(1)
                                    ),
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(5))
                                ),
                                child: Column(
                                  children: [
                                    _InputTextField(),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(20),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _isAutoLoginCheck = !_isAutoLoginCheck;
                                            });
                                          },
                                          child: _isAutoLoginCheck == false ?
                                          Image.asset('asset/image/radio_off.png',
                                            width: CommonUtils.getInstance(context).getWidth(25),
                                            height: CommonUtils.getInstance(context).getWidth(25)) :
                                          Image.asset('asset/image/radio_on.png',
                                            width: CommonUtils.getInstance(context).getWidth(25),
                                            height: CommonUtils.getInstance(context).getWidth(25),
                                          ),
                                        ),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(15),
                                        ),
                                        Text(getIt<FoxschoolLocalization>().data['text_auto_login'],
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: CommonUtils.getInstance(context).getWidth(15),
                                          fontWeight: FontWeight.normal
                                        ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(20),
                                    ),
                                    LightBlueTextButton(
                                        width: CommonUtils.getInstance(context).getWidth(340),
                                        height: CommonUtils.getInstance(context).getWidth(45),
                                        text: getIt<FoxschoolLocalization>().data['text_login'],
                                        onPressed: () {

                                        },),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(20),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RobotoRegularText(
                                            text: getIt<FoxschoolLocalization>().data['text_find_login'],
                                            fontSize: CommonUtils.getInstance(context).getWidth(15),
                                            color: AppColors.color_444444),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(40),

                                        ),
                                        Container(
                                          width: CommonUtils.getInstance(context).getWidth(1),
                                          height: CommonUtils.getInstance(context).getWidth(20),
                                          decoration: BoxDecoration(
                                            color: AppColors.color_444444,
                                          ),
                                        ),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(40),
                                        ),
                                        RobotoRegularText(
                                            text: getIt<FoxschoolLocalization>().data['text_find_password'],
                                            fontSize: CommonUtils.getInstance(context).getWidth(15),
                                            color: AppColors.color_444444),
                                      ],
                                    )
                                  ],
                                )
                            ),
                            if(_schoolName.length > 0)
                            Positioned(
                              top: CommonUtils.getInstance(context).getHeight(65),
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(16)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: CommonUtils.getInstance(context).getHeight(200),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.color_999999,
                                      width: CommonUtils.getInstance(context).getWidth(1)
                                    ),
                                  ),
                                  child: ListView.builder(
                                    itemCount: _currentSearchSchoolList.length,
                                    itemBuilder: (context, index) {
                                      Logger.d("index : ${index}, data : ${_currentSearchSchoolList[index]}");
                                    return Container(
                                      height: CommonUtils.getInstance(context).getWidth(50),
                                      padding: EdgeInsets.only(
                                        left: CommonUtils.getInstance(context).getWidth(30)
                                      ),
                                      child: ListTile(
                                        title: RobotoRegularText(
                                          text: _currentSearchSchoolList[index],
                                          fontSize: CommonUtils.getInstance(context).getWidth(15),
                                          color: AppColors.color_333333,
                                        ),
                                      ),
                                    );
                                  },),
                                ),
                              ),
                            ),
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
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(15)),
        child: Column(
          children: [
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(15),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(50),
              child: TextFormField(
                key: const ValueKey(1),
                focusNode: _focusNodeList[0],
                controller: _schoolNameTextController,
                onSaved: (newValue) {
                  _schoolName = newValue!;
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
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset('asset/image/icon_search_2.png',
                        width: CommonUtils.getInstance(context).getWidth(10),
                        height: CommonUtils.getInstance(context).getWidth(10),
                        fit: BoxFit.fill,
                        color: _focusNodeList[0].hasFocus ? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    suffixIcon: _schoolName.length > 0 ?  GestureDetector(
                      onTap: () {
                        _schoolNameTextController.clear();
                        setState(() {
                          _schoolName = "";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset('asset/image/btn_tex_del.png',
                          width: CommonUtils.getInstance(context).getWidth(10),
                          height: CommonUtils.getInstance(context).getWidth(10),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ) : null,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: _schoolName.length > 0 ? BorderRadius.only(
                              topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(10)),
                              topRight: Radius.circular(CommonUtils.getInstance(context).getWidth(10))
                            ) :
                             BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: _schoolName.length > 0 ? BorderRadius.only(
                            topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(10)),
                            topRight: Radius.circular(CommonUtils.getInstance(context).getWidth(10))
                        ) :BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    hintText: getIt<FoxschoolLocalization>().data['text_school_search'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(14),
                        fontFamily: 'Roboto'
                    )
                ),
              ),
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(15),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(50),
              child: TextFormField(
                key: const ValueKey(2),
                focusNode: _focusNodeList[1],
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
                      padding: const EdgeInsets.only(
                          left: 16,
                          top: 14,
                          right: 16,
                          bottom: 14
                      ),
                      child: Image.asset('asset/image/icon_id.png',
                        width: CommonUtils.getInstance(context).getWidth(10),
                        height: CommonUtils.getInstance(context).getWidth(10),
                        fit: BoxFit.fill,
                        color: _focusNodeList[1].hasFocus? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    hintText: getIt<FoxschoolLocalization>().data['text_id_input'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(14),
                        fontFamily: 'Roboto'
                    )
                ),
              ),
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(15),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(50),
              child: TextFormField(
                key: const ValueKey(3),
                focusNode: _focusNodeList[2],
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
                      padding: const EdgeInsets.only(
                          left: 16,
                          top:14,
                          right: 16,
                          bottom: 14
                      ),
                      child: Image.asset('asset/image/icon_lock.png',
                        width: CommonUtils.getInstance(context).getWidth(10),
                        height: CommonUtils.getInstance(context).getWidth(10),
                        fit: BoxFit.fill,
                        color: _focusNodeList[2].hasFocus? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)
                        ),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(
                            color: AppColors.color_999999,
                            width: CommonUtils.getInstance(context).getWidth(1)
                        )
                    ),
                    hintText: getIt<FoxschoolLocalization>().data['text_password_input'],
                    hintStyle: TextStyle(
                        color: AppColors.color_cccccc,
                        fontWeight: FontWeight.normal,
                        fontSize: CommonUtils.getInstance(context).getWidth(14),
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

  Widget _bottomInfoLayout()
  {
    return Positioned(
        left: 0,
        right: 0,
        bottom: CommonUtils.getInstance(context).getHeight(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RobotoBoldText(
                text: getIt<FoxschoolLocalization>().data['message_sign_only_web'],
                fontSize: CommonUtils.getInstance(context).getWidth(15),
                color: AppColors.color_444444
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(20),
            ),
            RobotoNormalText(
                text: getIt<FoxschoolLocalization>().data['message_company_information_from_login'],
                fontSize: CommonUtils.getInstance(context).getWidth(14),
                color: AppColors.color_444444,
                align: TextAlign.center)
          ],
        )
    );
  }


}
