import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:tasks_board/constants/colors/colors.dart';
import 'package:tasks_board/constants/icons/app_icons.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../tasks_history_screen/presentation/UI/tasks_history_screen.dart';
import '../../../tasks_screen/presentation/UI/tasks_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true, padding: const NavBarPadding.all(10),
        navBarHeight: 60,
        backgroundColor: AppColors.whiteColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration:  NavBarDecoration(
            colorBehindNavBar: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                spreadRadius: 3,
                blurRadius: 1,
              )
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style7, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const TasksScreen(),
      const TasksHistoryScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppIcons.tasksIconBottom,
            color: AppColors.whiteColor,
          ),
          inactiveIcon: SvgPicture.asset(
            AppIcons.tasksIconBottom,
            color: CupertinoColors.systemGrey,
          ),
          title: "Your Tasks",
          textStyle: AppTextStyles.nunitoRegular(),
          activeColorPrimary: AppColors.blueColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.whiteColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppIcons.historyIconBottom,
            color: AppColors.whiteColor,
          ),
          inactiveIcon: SvgPicture.asset(
            AppIcons.historyIconBottom,
          ),
          title: "History",
          textStyle: AppTextStyles.nunitoRegular(),
          activeColorPrimary: AppColors.blueColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.whiteColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppIcons.searchIconBottom,
            color: AppColors.whiteColor,
          ),
          inactiveIcon: SvgPicture.asset(
            AppIcons.searchIconBottom,
          ),
          title: "Search",
          textStyle: AppTextStyles.nunitoRegular(),
          activeColorPrimary: AppColors.blueColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.whiteColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppIcons.notificationIconBottom,
            color: AppColors.whiteColor,
          ),
          inactiveIcon: SvgPicture.asset(
            AppIcons.notificationIconBottom,
          ),
          title: "Notifications",
          textStyle: AppTextStyles.nunitoRegular(),
          activeColorPrimary: AppColors.blueColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.whiteColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppIcons.userIconBottom,
            color: AppColors.whiteColor,
          ),
          inactiveIcon: SvgPicture.asset(
            AppIcons.userIconBottom,
          ),
          title: "Profile",
          textStyle: AppTextStyles.nunitoRegular(),
          activeColorPrimary: AppColors.blueColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.whiteColor),
    ];
  }
}
