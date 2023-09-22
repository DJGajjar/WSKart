import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class ContactUsController extends GetxController {
  var strFullName = ''.obs;
  var strEmail = ''.obs;
  var strMessage = ''.obs;

  var isFullName = false.obs;
  var isEmail = false.obs;
  var isMessage = false.obs;

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
