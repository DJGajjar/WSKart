import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/WSKartIcon.dart';
import '../../../ExtraClass/Routes/AppPages.dart';
import 'TabBarController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:badges/src/badge.dart' as badge;

import 'package:wskart/Controller/WSKartController/TabBarController/HomeController/HomeView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/NotificationController/NotificationView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/ProfileView.dart';

class TabBarView extends GetView<TabBarController> {
  const TabBarView({Key? key}) : super(key: key);

  // static final TextStyle unselectedLabelStyle = TextStyle(
  //     color: Colors.white.withOpacity(0.5),
  //     fontWeight: FontWeight.w500,
  //     fontSize: 12);
  //
  // final TextStyle selectedLabelStyle =
  //     TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  /*buildBottomNavigationMenu(context, TabBarController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: TabBarController.changeTabIndex,
            currentIndex: TabBarController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }*/

  @override
  Widget build(BuildContext context) {
    // final TabBarController tabController = Get.put(TabBarController(), permanent: false);

    const List<Widget> pages = <Widget>[
      HomeView(),
      SearchView(),
      NotificationView(),
      ProfileView(),
    ];

    return GetBuilder<TabBarController>(builder: (_) {
      print('Value oF Tab bar Index: ${_.tabIndex.value}');

      return Obx(
        () => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: CustomAppColors.appWhiteColor,
            title: _.tabIndex.value == 0
                ? Image.asset(
                    AppImages.WSKartIcon,
                    fit: BoxFit.contain,
                    height: 24,
                    width: 115,
                  )
                : Text(
                    _.navigationTitle.value,
                    style: TextStyle(
                      color: CustomAppColors.lblDarkColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      wordSpacing: 1,
                      height: 1.2,
                    ),
                  ),
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leading: _.tabIndex.value == 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(AppImages.appLogo),
                  )
                : null,
            actions: <Widget>[
              _.tabIndex.value == 2
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: badge.Badge(
                          badgeContent: CustomeTextStyle(
                            text: "5",
                            size: 10,
                            fontWeight: FontWeight.w500,
                            color: CustomAppColors.appWhiteColor,
                            wordSpacing: 0.5,
                          ),
                          badgeStyle: BadgeStyle(
                              badgeColor: CustomAppColors.badgeBGColor),
                          child: Image.asset(
                            AppImages.ProfileHeart,
                            fit: BoxFit.contain,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        // Icon(Icons.person),
                        onPressed: () {
                          print('Click My Favourite');
                        },
                      ),
                    )
                  : _.tabIndex.value == 1
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: badge.Badge(
                              badgeContent: CustomeTextStyle(
                                text: "2",
                                size: 10,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.appWhiteColor,
                                wordSpacing: 0.5,
                              ),
                              badgeStyle: BadgeStyle(
                                  badgeColor: CustomAppColors.badgeBGColor),
                              child: Image.asset(
                                AppImages.ProductFilterIcon,
                                fit: BoxFit.contain,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            // Icon(Icons.person),
                            onPressed: () {
                              print('Click Filter');
                              _.ProductFilterScreen();
                            },
                          ),
                        )
                      : IconButton(
                          icon: Image.asset(
                            AppImages.ProfileAvtar,
                            height: 0,
                            width: 0,
                          ),
                          // Icon(Icons.person),
                          onPressed: () {
                            _.MYProfileScreen();
                          },
                        ),
              if (_.tabIndex.value == 0)
                IconButton(
                  icon: Image.asset(
                    AppImages.HomeProfile,
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                  // Icon(Icons.person),
                  onPressed: () => null,
                ),
              if (_.tabIndex.value == 1)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: badge.Badge(
                      badgeContent: CustomeTextStyle(
                        text: "5",
                        size: 10,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.appWhiteColor,
                        wordSpacing: 0.5,
                      ),
                      badgeStyle:
                          BadgeStyle(badgeColor: CustomAppColors.badgeBGColor),
                      child: Image.asset(
                        AppImages.ProfileHeart,
                        fit: BoxFit.contain,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    // Icon(Icons.person),
                    onPressed: () {
                      print('Click My Favourite');
                    },
                  ),
                ),
              if (_.tabIndex.value == 2)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: badge.Badge(
                      badgeContent: CustomeTextStyle(
                        text: "10",
                        size: 10,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.appWhiteColor,
                        wordSpacing: 0.5,
                      ),
                      badgeStyle:
                          BadgeStyle(badgeColor: CustomAppColors.badgeBGColor),
                      child: Image.asset(
                        AppImages.ProfileCart,
                        fit: BoxFit.contain,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    // Icon(Icons.person),
                    onPressed: () {
                      print('Click My Cart Btn');
                    },
                  ),
                ),
              if (_.tabIndex.value == 3)
                IconButton(
                  icon: Image.asset(
                    AppImages.ProfileAvtar,
                    fit: BoxFit.contain,
                    height: 38,
                    width: 38,
                  ),
                  // Icon(Icons.person),
                  onPressed: () {
                    _.MYProfileScreen();
                  },
                ),
            ],
          ),
          /*AppBar(
          centerTitle: true,
          // elevation: 10,
          // shadowColor: CustomAppColors.lblOrgColor,
          automaticallyImplyLeading: false,
          backgroundColor: CustomAppColors.lblOrgColor,
          title: CustomeTextStyle(
            text: 'Home',
            size: 18,
            color: CustomAppColors.lblDarkColor,
            wordSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.topRight,
          //       colors: <Color>[
          //         CustomAppColors.lblDarkColor,
          //         CustomAppColors.lblDarkColor,
          //       ],
          //     ),
          //   ),
          // ),
        ),*/
          body: pages.elementAt(_.selectedIndex),
          bottomNavigationBar: FlashyTabBar(
            selectedIndex: _.selectedIndex,
            animationCurve: Curves.linear,
            showElevation: true,
            backgroundColor: CustomAppColors.lblDarkColor,
            animationDuration: const Duration(milliseconds: 250),
            iconSize: 27.5,
            height: 64,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.75),
                blurRadius: 7.5,
                offset: const Offset(0, 0),
              ),
            ],
            onItemSelected: (index) => _.changeTabIndex(index),
            items: [
              FlashyTabBarItem(
                icon: const Icon(
                  // Icons.home_outlined,
                  WSKartIcon.home,
                  size: 16,
                ),
                activeColor: CustomAppColors.lblOrgColor,
                inactiveColor: CustomAppColors.txtPlaceholderColor,
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: const Icon(
                  WSKartIcon.shop,
                  size: 16,
                ),
                activeColor: CustomAppColors.lblOrgColor,
                inactiveColor: CustomAppColors.txtPlaceholderColor,
                title: const Text(
                  'Shop',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: const Icon(
                  WSKartIcon.notification,
                  size: 16,
                ),
                activeColor: CustomAppColors.lblOrgColor,
                inactiveColor: CustomAppColors.txtPlaceholderColor,
                title: const Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: const Icon(
                  WSKartIcon.user,
                  size: 16,
                ),
                activeColor: CustomAppColors.lblOrgColor,
                inactiveColor: CustomAppColors.txtPlaceholderColor,
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    /*final TabBarController tabController =
        Get.put(TabBarController(), permanent: false);
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: tabController.tabIndex.value,
            children: [
              HomeView(),
              SearchView(),
              NotificationView(),
              ProfileView(),
              tabController.HomeScreen(),
              tabController.SearchBarScreen(),
              tabController.NotificationScrren(),
              tabController.ProfileScreen()
            ],
          ),
        ),
        //bottomNavigationBar: buildBottomNavigationMenu(context, tabController),
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: tabController.tabIndex.value,
          animationCurve: Curves.linear,
          showElevation: true,
          backgroundColor: CustomAppColors.appBGColor,
          animationDuration: const Duration(milliseconds: 250),
          iconSize: 27.5,
          height: 70,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75),
              blurRadius: 7.5,
              offset: const Offset(0, 0),
            ),
          ],
          onItemSelected: (index) => _.changeTabIndex(index),
          items: [
            FlashyTabBarItem(
              icon: const Icon(
                Icons.home_max_rounded,
              ),
              activeColor: Colors.white,
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            FlashyTabBarItem(
              icon: const Icon(
                Icons.search_rounded,
              ),
              activeColor: Colors.white,
              title: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            FlashyTabBarItem(
              icon: const Icon(
                Icons.bookmark_outline_rounded,
              ),
              activeColor: Colors.white,
              title: const Text(
                'Lists',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            FlashyTabBarItem(
              icon: const Icon(
                Icons.podcasts_rounded,
              ),
              activeColor: Colors.white,
              inactiveColor: const Color(0xff9496c1),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}

/*
class TabBarView extends GetView<TabBarController> {
  const TabBarView({Key? key}) : super(key: key);

  static final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, TabBarController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: TabBarController.changeTabIndex,
            currentIndex: TabBarController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final TabBarController tabController =
        Get.put(TabBarController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, tabController),
      body: Obx(() => IndexedStack(
            index: tabController.tabIndex.value,
            children: [
              tabController.HomeScreen(),
              tabController.SearchBarScreen(),
              tabController.NotificationScrren(),
              tabController.ProfileScreen()
            ],
          )),
    ));
  }
}*/
