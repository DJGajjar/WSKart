import 'package:get/get.dart';
import 'OrderDetailController.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderDetailController>(
      OrderDetailController(),
    );
  }
}
