import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/enum/MainMenuDrawerType.dart';
import 'package:foxschool/presentation/controller/main/MainFactoryController.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/main/MainMyBooksSubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/main/MainSongSubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/main/MainStorySubScreen.dart';
import 'package:foxschool/presentation/view/screen/sub_screen/main/menu/MainMenuDrawerView.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/MainScreenTitleView.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;


class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen>  {


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
          icon: const Icon(Icons.menu_book_outlined),
          title: ('동화'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.music_note_outlined),
          title: ('동요'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.star_border_outlined),
          title: ('나의 책장'),
          activeColorPrimary: AppColors.color_23cc8a,
          activeColorSecondary: AppColors.color_ffffff,
          inactiveColorPrimary: AppColors.color_707070),
    ];
  }


  @override
  void initState() {
    super.initState();

    _factoryController = MainFactoryController(
        context: context,
        widgetRef: ref);
    _factoryController.init();
    _controller = PersistentTabController(initialIndex: 0);
  }


  @override
  Widget build(BuildContext context) {

    final state = ref.watch(mainUINotifierProvider);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _factoryController.onBackPressed();
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.color_1fb77c,
          child: SafeArea(
            child: Column(
              children: [
                MainScreenTitleView(
                  title: state.userSchoolName,
                  onMenuPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  onSearchPressed: () {
                    _factoryController.onClickSearch();
                  },
                ),
                Expanded(child: PersistentTabView(
                  context,
                  controller: _controller,
                  screens: _buildScreens(),
                  items: _navigationBarItems(),
                  confineToSafeArea: true,
                  backgroundColor: AppColors.color_f5f5f5,
                  // Default is Colors.white.
                  handleAndroidBackButtonPress: true,
                  // Default is true.
                  resizeToAvoidBottomInset: true,
                  // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                  stateManagement: true,
                  // Default is true.
                  hideNavigationBarWhenKeyboardAppears: true,
                  // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

                  popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
                  animationSettings: const NavBarAnimationSettings(
                    navBarItemAnimation: ItemAnimationSettings(
                      duration: Duration(milliseconds: Common.DURATION_SHORT),
                      curve: Curves.ease
                    ),
                    screenTransitionAnimation: ScreenTransitionAnimationSettings(
                      screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
                      animateTabTransition: true,
                      duration: Duration(milliseconds: Common.DURATION_SHORT),
                      curve: Curves.ease
                    )
                  ),

                  navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
                ))
              ],
            ),
          ),
        ),

        drawer: Drawer(
          child: MainMenuDrawerView(
            userName: state.userName,
            userClass: state.userClass,
            onSelected: (type) async {
              checkDrawerItem(type);
            },
          ),
        ),

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
              Logcats.message("Logout Selected");
              _scaffoldKey.currentState?.closeDrawer();
              await Future.delayed(const Duration(
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
