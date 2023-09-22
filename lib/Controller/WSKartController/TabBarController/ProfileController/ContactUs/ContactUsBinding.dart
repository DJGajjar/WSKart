import 'package:get/get.dart';
import 'ContactUsController.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ContactUsController>(
      ContactUsController(),
    );
  }
}
