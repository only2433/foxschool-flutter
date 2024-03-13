import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../values/AppColors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late PersistentTabController _controller;
  int _selectedIndex = 0;

  List<Widget> _buildScreens()
  {
    return [
      Container(
        child: Center(
          child: Text("동화"),
        ),
      ),
      Container(
        child: Center(
          child: Text("동요"),
        ),
      ),
      Container(
        child: Center(
          child: Text("나의 책장"),
        ),
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navigationBarItems()
  {
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

  void setTabNavigations(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navigationBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
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
    );
  }
}
