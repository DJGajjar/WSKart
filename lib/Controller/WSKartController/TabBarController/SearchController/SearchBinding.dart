import 'package:get/get.dart';
import 'SearchTabController.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchTabController>(
      SearchTabController(),
    );
  }
}
