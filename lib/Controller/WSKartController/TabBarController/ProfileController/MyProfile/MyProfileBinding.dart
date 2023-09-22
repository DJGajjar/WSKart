import 'package:get/get.dart';
import 'MyProfileController.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyProfileController>(
      MyProfileController(),
    );
  }
}
