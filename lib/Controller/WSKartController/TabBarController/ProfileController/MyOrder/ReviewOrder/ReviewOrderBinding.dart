import 'package:get/get.dart';
import 'ReviewOrderController.dart';

class ReviewOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReviewOrderController>(
      ReviewOrderController(),
    );
  }
}
