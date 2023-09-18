import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class WelcomeController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorge.read("id") != null) {
      // Future.delayed(const Duration(milliseconds: 3000), () {
      //   Get.offAllNamed(Routes.OFFER);
      // });
    } else {
      // Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  WelcomeSwipeUp() {
    Get.offAllNamed(Routes.START);
  }
}
