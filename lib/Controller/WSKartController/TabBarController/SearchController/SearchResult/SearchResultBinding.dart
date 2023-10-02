import 'package:get/get.dart';
import 'SearchResultController.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchResultController>(
      SearchResultController(),
    );
  }
}
