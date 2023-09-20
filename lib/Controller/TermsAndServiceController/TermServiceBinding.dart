import 'package:get/get.dart';
import 'TermServiceController.dart';

class TermServicenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TermServiceController>(
      TermServiceController(),
    );
  }
}
