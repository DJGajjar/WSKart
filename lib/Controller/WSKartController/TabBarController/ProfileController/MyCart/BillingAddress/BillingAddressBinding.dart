import 'package:get/get.dart';
import 'BillingAddressController.dart';

class BillingAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BillingAddressController>(
      BillingAddressController(),
    );
  }
}
