import 'package:get/get.dart';
import 'NewPasswordController.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewPasswordController>(
      NewPasswordController(),
    );
  }
}
