import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainUserInformationCubit.dart';
import 'package:foxschool/bloc/main/factory/state/MainUserInformationState.dart';
import 'package:foxschool/data/login/user_info_section/UserInfoSectionResult.dart';
import 'package:foxschool/data/main/main_story_infomation/MainStoryInformationResult.dart';
import 'package:foxschool/enum/MainMenuDrawerType.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/SearchScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainMyBooksSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainSongSubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/MainStorySubScreen.dart';
import 'package:foxschool/view/screen/sub_screen/main/menu/MainMenuDrawerView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../bloc/main/MainFactoryController.dart';
import '../../common/Common.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../data/login/LoginInformationResult.dart';
import '../../data/main/MainInformationResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
import '../widget/MainScreenTitleView.dart';
import '../widget/TopTitleView.dart';
import '../../common/Preference.dart' as Preference;
import '../dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/common/PageNavigator.dart' as Page;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late MainFactoryController _factoryController;
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      MainStorySubScreen(factoryController: _factoryController),
      MainSongSubScreen(factoryController: _factoryController),
      MainMyBooksSubScreen(factoryController: _factoryController)
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

    _factoryController = MainFactoryController(context: context);
    _factoryController.init();

    _controller = PersistentTabController(initialIndex: 0);
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_1fb77c,
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<MainUserInformationCubit, MainUserInformationState>(builder: (context, state) {
                return MainScreenTitleView(
                  title: state.userSchoolName,
                  onMenuPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  onSearchPressed: () {
                    _factoryController.onClickSearch();
                  },
                );
              }),
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
                  duration: Duration(milliseconds: Common.DURATION_SHORT),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: Common.DURATION_SHORT),
                ),
                navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
              ))
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: BlocBuilder<MainUserInformationCubit, MainUserInformationState>(builder: (context, state) {
          return MainMenuDrawerView(
            userName: state.userName,
            userClass: state.userClass,
            onSelected: (type) async {
              checkDrawerItem(type);
            },
          );
        }),
      ),

    );
  }

  void checkDrawerItem(MainMenuDrawerType type) async
  {
    switch (type) {
      case MainMenuDrawerType.LOG_OUT:
        await FoxSchoolDialog.showSelectDialog(
            context: context,
            message: getIt<FoxschoolLocalization>().data['message_try_logout'],
            buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
            onSelected: () async {
              Logger.d("Logout Selected");
              _scaffoldKey.currentState?.closeDrawer();
              await Future.delayed(Duration(
                  milliseconds: Common.DURATION_LONG
              ));

              _factoryController.onClickLogout();
            });
        break;
      case MainMenuDrawerType.STUDY_LOG:
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {

    _factoryController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
