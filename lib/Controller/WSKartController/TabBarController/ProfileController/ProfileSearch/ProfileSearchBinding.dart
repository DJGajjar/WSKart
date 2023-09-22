import 'package:get/get.dart';
import 'ProfileSearchController.dart';

class ProfileSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileSearchController>(
      ProfileSearchController(),
    );
  }
}
