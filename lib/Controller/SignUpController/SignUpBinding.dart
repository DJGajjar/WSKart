import 'package:get/get.dart';
import 'SignUpController.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(
      SignUpController(),
    );
  }
}
