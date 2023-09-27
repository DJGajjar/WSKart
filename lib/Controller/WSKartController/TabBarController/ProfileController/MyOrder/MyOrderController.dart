import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class MyOrderController extends GetxController {
  var isProcessingIconSelect = true.obs;
  var isDeliveringIconSelect = false.obs;
  var isCompletedIconSelect = false.obs;
  var isReturnedIconSelect = false.obs;
  var isCancelledIconSelect = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
