import 'package:get/get.dart';
import 'StartController.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(
      StartController(),
    );
  }
}
