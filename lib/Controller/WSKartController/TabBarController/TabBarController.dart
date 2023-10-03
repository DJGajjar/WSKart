import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'SearchController/SearchTabController.dart';

class TabBarController extends GetxController {
  var tabIndex = 0.obs;
  var selectedIndexxxxxxx = 0.obs;
  int selectedIndex = 0;
  var isLoading = false.obs;

  var navigationTitle = 'Home'.obs;
  // RxList<Product> product = (List<Product>.of([])).obs;

  // final List<Tab> myTabs1 = <Tab>[
  //   HomeTabScreen(),
  //   SearchTabScreen(),
  //   NotificationTabScreen(),
  //   ProfileTabScreen(),
  // ];
  //
  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: 'LEFT'),
  //   Tab(text: 'RIGHT'),
  // ];

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
        navigationTitle = 'Shop'.obs;
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

  // Widget build(BuildContext context) {
  //   const List<Widget> pages = <Widget>[
  //     HomeView(),
  //     SearchView(),
  //     NotificationView(),
  //     ProfileView(),
  //   ];
  @override
  void onInit() {
    super.onInit();
    print("Tab Bar Call");
    //fetchProductShopData();
    Get.find<SearchTabController>().fetchProductShopData();
  }

  fetchProductShopData() async {
    print('Shop View Opne data Call API Tab>>>>');
    print("HHHHHHHHHHH");
    Map<String, String?> queryParams = {
      'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
      'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
    };

    try {
      isLoading(true);
      // _requestHelper?.getWSKartProductsItemList(queryParameters: queryParams);
    } catch (error) {
      print('Store Product Error: $error');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void onClose() {
    super.onClose();
  }

  HomeTabScreen() {
    Get.toNamed(Routes.HOMEROUTES);
  }

  SearchTabScreen() {
    Get.toNamed(Routes.SEARCHROUTES);
  }

  NotificationTabScreen() {
    Get.toNamed(Routes.NOTIFICATIONROUTES);
  }

  ProfileTabScreen() {
    Get.toNamed(Routes.PROFILEROUTES);
  }

  MYProfileScreen() {
    Get.toNamed(Routes.MYPROFILEROUTES);
  }

  ProductFilterScreen() {
    Get.toNamed(Routes.PRODUCTFILTERROUTES);
  }
}
