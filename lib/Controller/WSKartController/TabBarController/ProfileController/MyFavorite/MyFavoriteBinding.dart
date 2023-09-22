import 'package:get/get.dart';
import 'MyFavoriteController.dart';

class MyFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyFavoriteController>(
      MyFavoriteController(),
    );
  }
}
