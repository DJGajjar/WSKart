import 'package:get/get.dart';
import 'TabBarController.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TabBarController>(
      TabBarController(),
    );
  }
}
