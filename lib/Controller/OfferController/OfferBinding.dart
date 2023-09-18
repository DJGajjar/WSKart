import 'package:get/get.dart';
import 'OfferController.dart';

class OfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OfferController>(
      OfferController(),
    );
  }
}
