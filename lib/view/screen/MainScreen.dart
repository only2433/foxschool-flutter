import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/data/login/user_info_section/UserInfoSectionResult.dart';
import 'package:foxschool/data/main/main_story_infomation/MainInformationResult.dart';
import 'package:foxschool/enum/MainMenuDrawerType.dart';
import 'package:foxschool/route/RouteHelper.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainMyBooksSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainSongSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainStorySubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/menu/MainMenuDrawerView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../common/Common.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../data/login/LoginInformationResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
import '../widget/MainScreenTitleView.dart';
import '../widget/TopTitleView.dart';
import '../../common/Preference.dart' as Preference;
import '../dialog/FoxSchoolAlertDialog.dart' as FoxSchoolAlertDialog;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentTabController _controller;
  late MainInformationResult _mainData;
  late LoginInformationResult _userData;
  int _selectedIndex = 0;
  String _schoolName = "";
  String _userName = "";
  String _userClass = "";


  Future<void> loadMainData() async
  {
    Object? userObject = await Preference.getObject(Common.PARAMS_USER_API_INFORMATION);
    if (userObject != null) {
      _userData = LoginInformationResult.fromJson(userObject as Map<String, dynamic>);
      setState(() {
        _schoolName = _userData.schoolData!.name;
        _userName = _userData.userData!.name;
        _userClass = _userData.schoolData!.className;
      });
    }

    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    if (mainObject != null) {
      _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
    }
  }

  void _setTabNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      MainStorySubScreen(),
      MainSongSubScreen(),
      MainMyBooksSubScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navigationBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.menu_book_outlined),
          title: ('동화'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.music_note_outlined),
          title: ('동요'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.star_border_outlined),
          title: ('나의 책장'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
    ];
  }


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: _selectedIndex);
    loadMainData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: AppColors.color_47e1ad,
        child: SafeArea(
          child: Column(
            children: [
              MainScreenTitleView(
                title: _schoolName,
                onMenuPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                onSearchPressed: () {

                },
              ),
              Expanded(child: PersistentTabView(
                context,
                controller: _controller,
                screens: _buildScreens(),
                items: _navigationBarItems(),
                confineInSafeArea: true,
                backgroundColor: AppColors.color_f5f5f5,
                // Default is Colors.white.
                handleAndroidBackButtonPress: true,
                // Default is true.
                resizeToAvoidBottomInset: true,
                // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true,
                // Default is true.
                hideNavigationBarWhenKeyboardShows: true,
                // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.


                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
              ))
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: MainMenuDrawerView(
          userName: _userName,
          userClass: _userClass,
          onSelected: (type) async {
            checkDrawerItem(type);
          },
        ),
      ),

    );
  }

  void checkDrawerItem(MainMenuDrawerType type) async
  {
    switch (type) {
      case MainMenuDrawerType.LOG_OUT:
        await FoxSchoolAlertDialog.showSelectDialog(
            context,
            getIt<FoxschoolLocalization>().data['message_try_logout'],
            getIt<FoxschoolLocalization>().data['text_confirm'],
                () async {
              Logger.d("Logout Selected");
              _scaffoldKey.currentState?.closeDrawer();
              await Future.delayed(Duration(
                  milliseconds: Common.DURATION_LONG
              ));
              Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
              Preference.setObject(Common.PARAMS_USER_API_INFORMATION, null);
              Navigator.of(context).pushReplacementNamed(RouteHelper.getLogout());
            });
        break;
      case MainMenuDrawerType.STUDY_LOG:
        break;
      default:
        break;
    }
  }
}
