import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class MyProfileController extends GetxController {
  var strFirstName = ''.obs;
  var strLastName = ''.obs;
  var strUserName = ''.obs;
  var strEmailAddress = ''.obs;
  var strCurrentPassword = ''.obs;
  var strNewPassword = ''.obs;
  var strConfirmPassword = ''.obs;

  var isFirstName = false.obs;
  var isLastName = false.obs;
  var isUserName = false.obs;
  var isEmailAddress = false.obs;
  var isCurrentPassword = false.obs;
  var isNewPassword = false.obs;
  var isConfirmPassword = false.obs;

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
