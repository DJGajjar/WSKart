import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class CancelOrderController extends GetxController {
  var strMessage = ''.obs;
  var isMessage = false.obs;

  var isCancelOrderOption1 = false.obs;
  var isCancelOrderOption2 = false.obs;
  var isCancelOrderOption3 = true.obs;
  var isCancelOrderOption4 = false.obs;
  var isCancelOrderOption5 = false.obs;
  var isCancelOrderOption6 = false.obs;

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
