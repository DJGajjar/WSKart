import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';

class ReturnOrderController extends GetxController {
  var strMessage = ''.obs;
  var isMessage = false.obs;

  var isCancelOrderOption1 = false.obs;
  var isCancelOrderOption2 = false.obs;
  var isCancelOrderOption3 = true.obs;
  var isCancelOrderOption4 = false.obs;
  var isCancelOrderOption5 = false.obs;
  var isCancelOrderOption6 = false.obs;

  final RequestHelper _requestHelper = RequestHelper();

  @override
  void onInit() {
    super.onInit();
  }

  // productReviewPost() async {
  //   // Map<String, String?> queryParams = {
  //   //   'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
  //   //   'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
  //   // };
  //
  //   try {
  //     // List<Product>? avb = await _requestHelper.getWSKartProductsItemList();
  //     products = await _requestHelper.getWSKartProductsItemList();
  //     print(products!.length.toString());
  //     print(products?[0].id);
  //   } catch (error) {
  //     print('Review Error: $error');
  //   } finally {
  //     print('Finish');
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
