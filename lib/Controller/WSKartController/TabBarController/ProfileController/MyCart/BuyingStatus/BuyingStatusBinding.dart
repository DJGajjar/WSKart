import 'package:get/get.dart';
import 'BuyingStatusController.dart';

class BuyingStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuyingStatusController>(
      BuyingStatusController(),
    );
  }
}
