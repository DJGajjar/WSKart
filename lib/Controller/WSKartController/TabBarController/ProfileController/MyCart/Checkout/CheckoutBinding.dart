import 'package:get/get.dart';
import 'CheckoutController.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckoutController>(
      CheckoutController(),
    );
  }
}
