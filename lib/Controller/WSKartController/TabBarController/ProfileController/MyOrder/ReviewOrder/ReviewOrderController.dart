import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';

class ReviewOrderController extends GetxController {
  var strMessage = ''.obs;
  var isMessage = false.obs;

  var strReviewTitle = ''.obs;
  var isReviewTitle = false.obs;

  var isSelectStar1 = false.obs;
  var isSelectStar2 = false.obs;
  var isSelectStar3 = false.obs;
  var isSelectStar4 = false.obs;
  var isSelectStar5 = false.obs;

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
