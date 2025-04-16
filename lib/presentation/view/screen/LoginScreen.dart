
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/controller/login/LoginFactoryController.dart';
import 'package:foxschool/presentation/controller/login/river_pod/LoginUINotifier.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/presentation/view/widget/RobotoRegularText.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/LightBlueTextButton.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen>
{
  late LoginFactoryController _factoryController;
  final TextEditingController _schoolNameTextController = TextEditingController();
  final int MAX_TEXT_FIELD_COUNT = 3;
  final _formKey = GlobalKey<FormState>();
  late List<FocusNode> _focusNodeList;

  String _userID = "";
  String _userPassword = "";
  String _selectSchoolID = "";
  bool isSchoolListItemSelected = false;

  @override
  void initState() {
    super.initState();
    Logcats.message("initState");
    _factoryController = LoginFactoryController(
        context: context,
        widgetRef: ref);
    _factoryController.init();
    _settingFocusNode();
  }

  @override
  void activate() {
    super.activate();
    Logcats.message("activate");
  }



  void _settingFocusNode() {
    _focusNodeList = List.generate(MAX_TEXT_FIELD_COUNT, (index) => FocusNode());
    for (var focus in _focusNodeList) {
      focus.addListener(() {
        setState(() {});
      });
    }
  }

  void _submitLogin()
  {
    if (_selectSchoolID == "" || _userID == "" || _userPassword == "") {
      if (_selectSchoolID == "") {
        CommonUtils.getInstance(context).showErrorMessage(getIt<FoxschoolLocalization>().data['message_warning_empty_school']);
      } else if (_userID == "") {
        CommonUtils.getInstance(context).showErrorMessage(getIt<FoxschoolLocalization>().data['message_warning_empty_id']);
      } else if (_userPassword == "") {
        CommonUtils.getInstance(context).showErrorMessage(getIt<FoxschoolLocalization>().data['message_warning_empty_password']);
      }
    } else {
      _factoryController.onClickLogin(_userID.trim().toString(), _userPassword.trim().toString(), _selectSchoolID);
    }
  }

  void _disposeFocusNode() {
    for (var focusNode in _focusNodeList) {
      focusNode.dispose();
    }
  }

  void _hideFocusNode()
  {
    for (var focusNode in _focusNodeList) {
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginUINotifierProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.color_47e1ad,
            child: SafeArea(
                child: Column(
                    children: [
                      TopTitleView(
                    title: getIt<FoxschoolLocalization>().data['text_login'],
                    type: TopTitleButtonType.BACK,
                    onPressed: () {
                      _factoryController.onBackPressed();
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
                                    border: Border.all(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2)),
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10))),
                                child: Column(
                                  children: [
                                    _buildInputTextField(),
                                    SizedBox(
                                      height: CommonUtils.getInstance(context).getHeight(50),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _factoryController.onCheckAutoLogin();
                                          },
                                          child: state.isAutoLogin == false
                                              ? Image.asset('assets/image/radio_off.png', width: CommonUtils.getInstance(context).getWidth(60), height: CommonUtils.getInstance(context).getWidth(60))
                                              : Image.asset(
                                            'assets/image/radio_on.png',
                                            width: CommonUtils.getInstance(context).getWidth(60),
                                            height: CommonUtils.getInstance(context).getWidth(60),
                                          ),
                                        ),
                                        SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(20),
                                        ),
                                        Text(
                                          getIt<FoxschoolLocalization>().data['text_auto_login'],
                                          style: TextStyle(color: AppColors.color_444444, fontFamily: 'Roboto', fontSize: CommonUtils.getInstance(context).getWidth(40), fontWeight: FontWeight.normal),
                                        ),
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
                                        _hideFocusNode();
                                        _submitLogin();
                                      },
                                    ),
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
                                          decoration: const BoxDecoration(
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
                            Consumer(builder: ((context, ref, child) {
                              if (state.schoolName.isNotEmpty && _focusNodeList[0].hasFocus)
                              {
                                return _buildSchoolListView();
                              }
                              else
                              {
                                return Container();
                              }
                            })),
                            _buildBottomInfoLayout()
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
  }

  Widget _buildInputTextField() {
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
                  _factoryController.onInitSchoolData();
                  isSchoolListItemSelected = false;
                },
                onFieldSubmitted: (value) {
                  Logcats.message("onSaved : $value");
                  String schoolID = _factoryController.getSchoolID(value);
                  if (schoolID == "") {
                    _schoolNameTextController.clear();
                    _factoryController.onSetSchoolName("");
                  } else {
                    _selectSchoolID = schoolID;
                  }
                },
                onChanged: (value) {
                  _factoryController.onChangeSchoolData(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/image/icon_search_2.png',
                        width: CommonUtils.getInstance(context).getWidth(45),
                        height: CommonUtils.getInstance(context).getHeight(53),
                        fit: BoxFit.contain,
                        color: _focusNodeList[0].hasFocus ? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    suffixIcon:  _focusNodeList[0].hasFocus
                        ?
                    GestureDetector(
                      onTap: () {
                        _schoolNameTextController.clear();
                        _factoryController.onSetSchoolName("");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          'assets/image/btn_tex_del.png',
                          width: CommonUtils.getInstance(context).getWidth(60),
                          height: CommonUtils.getInstance(context).getWidth(60),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                        : null,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
                    contentPadding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(2)),
                    hintText: getIt<FoxschoolLocalization>().data['text_school_search'],
                    hintStyle: TextStyle(color: AppColors.color_cccccc, fontWeight: FontWeight.normal, fontSize: CommonUtils.getInstance(context).getWidth(40), fontFamily: 'Roboto')),
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
                      padding: EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(34),
                          top: CommonUtils.getInstance(context).getWidth(32),
                          right: CommonUtils.getInstance(context).getWidth(34),
                          bottom: CommonUtils.getInstance(context).getWidth(32)),
                      child: Image.asset(
                        'assets/image/icon_id.png',
                        width: CommonUtils.getInstance(context).getWidth(50),
                        height: CommonUtils.getInstance(context).getWidth(52),
                        fit: BoxFit.contain,
                        color: _focusNodeList[1].hasFocus ? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
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
                      padding: EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(34),
                          top: CommonUtils.getInstance(context).getWidth(32),
                          right: CommonUtils.getInstance(context).getWidth(34),
                          bottom: CommonUtils.getInstance(context).getWidth(32)),
                      child: Image.asset(
                        'assets/image/icon_lock.png',
                        width: CommonUtils.getInstance(context).getWidth(50),
                        height: CommonUtils.getInstance(context).getWidth(57),
                        fit: BoxFit.contain,
                        color: _focusNodeList[2].hasFocus ? AppColors.color_26d0df : AppColors.color_cccccc,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                        borderSide: BorderSide(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2))),
                    contentPadding: EdgeInsets.only(top: CommonUtils.getInstance(context).getHeight(2)),
                    hintText: getIt<FoxschoolLocalization>().data['text_password_input'],
                    hintStyle: TextStyle(color: AppColors.color_cccccc, fontWeight: FontWeight.normal, fontSize: CommonUtils.getInstance(context).getWidth(42), fontFamily: 'Roboto')),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolListView() {
    return Positioned(
      top: CommonUtils.getInstance(context).getHeight(195),
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(67)),
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(loginUINotifierProvider);
          if(state.schoolList.isNotEmpty)
          {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(400),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.color_999999, width: CommonUtils.getInstance(context).getWidth(2)),
              ),
              child: ListView.builder(
                itemCount: state.schoolList.length,
                itemBuilder: (context, index) {
                  Logcats.message("index : $index, data : ${state.schoolList[index]}");
                  return Container(
                    height: CommonUtils.getInstance(context).getWidth(100),
                    padding: EdgeInsets.only(left: CommonUtils.getInstance(context).getWidth(100)),
                    child: ListTile(
                      onTap: () {
                        _selectSchoolID = state.schoolList[index].id;
                        _schoolNameTextController.text = state.schoolList[index].name;
                        _factoryController.onSetSchoolName(state.schoolList[index].name);
                        _focusNodeList[0].unfocus();
                      },
                      title: RobotoRegularText(
                        text: state.schoolList[index].name,
                        fontSize: CommonUtils.getInstance(context).getWidth(42),
                        color: AppColors.color_333333,
                      ),
                    ),
                  );
                },),
            );
          }
          else
          {
            return Container();
          }
        },),
        ),
    );
  }

  Widget _buildBottomInfoLayout() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: CommonUtils.getInstance(context).getHeight(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RobotoBoldText(text: getIt<FoxschoolLocalization>().data['message_sign_only_web'], fontSize: CommonUtils.getInstance(context).getWidth(40), color: AppColors.color_444444),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(20),
            ),
            RobotoNormalText(
                text: getIt<FoxschoolLocalization>().data['message_company_information_from_login'],
                fontSize: CommonUtils.getInstance(context).getWidth(40),
                color: AppColors.color_444444,
                align: TextAlign.center)
          ],
        ));
  }

  @override
  void dispose() {
    _factoryController.dispose();
    _schoolNameTextController.dispose();
    _disposeFocusNode();
    super.dispose();
  }
}
