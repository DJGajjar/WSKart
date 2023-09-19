import 'package:get/get.dart';
import 'PasswordOptionController.dart';

class PasswordOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PasswordOptionController>(
      PasswordOptionController(),
    );
  }
}
