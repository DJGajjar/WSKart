import 'package:get/get.dart';
import 'VerificationOTPController.dart';

class VerificationOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerificationOTPController>(
      VerificationOTPController(),
    );
  }
}
