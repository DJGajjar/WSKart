import 'package:get/get.dart';
import 'ProductDetailController.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailController>(
      ProductDetailController(),
    );
  }
}
