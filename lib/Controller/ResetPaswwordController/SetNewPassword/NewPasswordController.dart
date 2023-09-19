import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class NewPasswordController extends GetxController {
  final getStorge = GetStorage();

  var isNewPasswordVisible = true.obs;
  var isAgainPasswordVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // CheckNewPasswordVisobleStatus() {
  //   if (isNewPasswordVisible) {
  //     isNewPasswordVisible = false;
  //     print('Vlaue Aeaa caklf F: $isNewPasswordVisible');
  //   } else {
  //     isNewPasswordVisible = true;
  //     print('Vlaue Aeaa caklf T: $isNewPasswordVisible');
  //   }
  //   update();
  // }

  @override
  void onReady() {
    super.onReady();
    // if (getStorge.read("id") != null) {
    //   // Future.delayed(const Duration(milliseconds: 3000), () {
    //   //   Get.offAllNamed(Routes.WELCOME);
    //   // });
    // } else {
    //   // Get.offAllNamed(Routes.LOGIN);
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.WELCOME);
    //   });
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }

  ResetPhoneVerification() {
    Get.toNamed(Routes.RESETOTP);
  }
}
