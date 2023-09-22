import 'package:get/get.dart';
import 'ProfileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ProfileController());
    Get.put(() => ProfileController());
    // Get.put<ProfileController>(
    //   ProfileController(),
    // );
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    // );
  }
}

// class RootBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return [
//       Bind.lazyPut<RootController>(
//             () => RootController(),
//       )
//     ];
//   }
// }

// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//
//   }
// }
