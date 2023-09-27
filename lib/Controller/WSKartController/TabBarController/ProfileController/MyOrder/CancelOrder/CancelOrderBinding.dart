import 'package:get/get.dart';
import 'CancelOrderController.dart';

class CancelOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CancelOrderController>(
      CancelOrderController(),
    );
  }
}
