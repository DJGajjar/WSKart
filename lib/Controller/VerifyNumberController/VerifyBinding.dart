import 'package:get/get.dart';
import 'VerifyController.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerifyController>(
      VerifyController(),
    );
  }
}
