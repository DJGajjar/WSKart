import 'package:get/get.dart';
import 'PaymentMethodController.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentMethodController>(
      PaymentMethodController(),
    );
  }
}
