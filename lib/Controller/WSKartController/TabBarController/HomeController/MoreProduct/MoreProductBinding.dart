import 'package:get/get.dart';
import 'MoreProductController.dart';

class MoreProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MoreProductController>(
      MoreProductController(),
    );
  }
}
