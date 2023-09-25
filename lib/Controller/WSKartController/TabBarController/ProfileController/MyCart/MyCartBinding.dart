import 'package:get/get.dart';
import 'MyCartController.dart';

class MyCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyCartController>(
      MyCartController(),
    );
  }
}
