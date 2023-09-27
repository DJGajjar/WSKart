import 'package:get/get.dart';
import 'MyOrderController.dart';

class MyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyOrderController>(
      MyOrderController(),
    );
  }
}
