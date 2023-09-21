import 'package:get/get.dart';
import 'NotificationController.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(
      NotificationController(),
    );
  }
}
