import 'package:get/get.dart';
import 'PhoneController.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PhoneController>(
      PhoneController(),
    );
  }
}