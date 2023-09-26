import 'package:get/get.dart';
import 'CreditCartController.dart';

class CreditCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreditCartController>(
      CreditCartController(),
    );
  }
}
