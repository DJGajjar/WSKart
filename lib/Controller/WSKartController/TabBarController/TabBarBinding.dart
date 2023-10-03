import 'package:get/get.dart';
import 'TabBarController.dart';
import 'HomeController/HomeController.dart';
import 'NotificationController/NotificationController.dart';
import 'ProfileController/ProfileController.dart';
import 'SearchController/SearchTabController.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<TabBarController>(TabBarController());
    print("TabBarBinding   TabBarBinding");
    Get.lazyPut<TabBarController>(() => TabBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchTabController>(() => SearchTabController());
    //Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<ProfileController>(() => ProfileController());

    Get.put<NotificationController>(
      NotificationController(),
    );
  }
}
