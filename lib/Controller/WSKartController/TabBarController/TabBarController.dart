import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class TabBarController extends GetxController {
  var tabIndex = 0.obs;
  int selectedIndex = 0;

  var navigationTitle = 'Home'.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    selectedIndex = index;

    print('index>>>>> $index');
    print('selectedIndex>>>> $selectedIndex');

    print('Check Value of tabbar Controller: ${tabIndex.value}');

    if (index == selectedIndex) {
      if (index == 0) {
        navigationTitle = 'Home'.obs;
        homeScrollController.animateTo(0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
      }
      if (index == 1) {
        // Search page may sometimes doesn't have a scroll controller, so we need to check it
        print('Search');
        navigationTitle = 'Search'.obs;
        try {
          searchScrollController.animateTo(0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
          // ignore: empty_catches
        } catch (e) {}
      }
      if (index == 2) {
        print('Notification');
        navigationTitle = 'Notification'.obs;
        // collection page may sometimes doesn't have a scroll controller, so we need to check it
        try {
          listsScrollController.animateTo(0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
          // ignore: empty_catches
        } catch (e) {}
      }
      if (index == 3) {
        print('Profile');
        navigationTitle = 'Profile'.obs;
        profileScrollController.animateTo(0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
      }
    } else {
      selectedIndex = index;
    }
    update();
  }

  // Main pages scroll controller
  ScrollController homeScrollController = ScrollController();
  ScrollController searchScrollController = ScrollController();
  ScrollController listsScrollController = ScrollController();
  ScrollController profileScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  HomeScreen() {
    Get.offAllNamed(Routes.HOMEROUTES);
  }

  SearchBarScreen() {
    Get.offAllNamed(Routes.SEARCHROUTES);
  }

  NotificationScrren() {
    Get.offAllNamed(Routes.NOTIFICATIONROUTES);
  }

  ProfileScreen() {
    Get.offAllNamed(Routes.PROFILEROUTES);
  }
}
