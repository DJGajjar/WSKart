import 'package:get/get.dart';
import 'ShippingAddressController.dart';

class ShippingAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShippingAddressController>(
      ShippingAddressController(),
    );
  }
}
