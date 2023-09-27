import 'package:get/get.dart';
import 'ReturnOrderController.dart';

class ReturnOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReturnOrderController>(
      ReturnOrderController(),
    );
  }
}
