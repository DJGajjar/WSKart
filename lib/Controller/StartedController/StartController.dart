import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class StartController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

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

  GetStarted() {
    getStorge.write("id", 1);
    Get.offAllNamed(Routes.LOGIN);
  }
}
