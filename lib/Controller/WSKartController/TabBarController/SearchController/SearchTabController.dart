import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Helper/APIHelper.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';

class SearchTabController extends GetxController {
  var isLoading = false.obs;

  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
    print('Shop View Opne data Call');
    fetchProductShopData();
  }

  fetchProductShopData() async {
    print('Shop View Opne data Call API');
    Map<String, String?> queryParams = {
      'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
      'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
    };

    try {
      //isLoading(true);
      List<Product>? avb = await _requestHelper.getWSKartProductsItemList(
          queryParameters: queryParams);
      print(avb!.length.toString());
      print(avb[0].id);
    } catch (error) {
      print('Store Product Error: $error');
    } finally {
      //isLoading(false);
    }
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
