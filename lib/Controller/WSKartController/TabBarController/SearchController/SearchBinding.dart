import 'package:get/get.dart';
import 'SearchController.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchTabController>(
      SearchTabController(),
    );
  }
}
