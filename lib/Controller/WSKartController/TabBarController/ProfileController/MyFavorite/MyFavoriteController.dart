import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Model/WishlistModel/Wishlist.dart';
import 'package:wskart/Service/Model/WishlistModel/Wishlist.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'package:wskart/Constants/query.dart';

import '../../../../../Service/Model/ProductModel/Product.dart';

class MyFavoriteController extends GetxController {
  var isShowCartIcon = false.obs;
  var isLoading = false.obs;
  var isSlowAnimations = true.obs;

  final getStorage = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();

  List<Product>? products = <Product>[];
  var productList = List<Product>.empty(growable: true).obs;

  int wishlistCount = 0;

  @override
  void onInit() {
    super.onInit();
  }

  fetchWishlistProductData() async {
    int intStoreUserID = getStorage.read('UserID');
    print('UserID: $intStoreUserID');

    final userID = {
      "user_id": intStoreUserID.toString(),
    };

    print('userID: $userID');

    try {
      isLoading(true);

      products = await _requestHelper.getWSKartWishlistProductsItem(
          queryParameters: preQueryParameters(userID));

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Wishlist Product ADD : ${productList.length}');
      }

      print('Wishlist Product DataList : ${productList.length}');
      print("Wishlist Product Data List: ${products!.length.toInt()}");

      wishlistCount = productList.length.toInt();
    } catch (error) {
      print('Wishlist Product Error: $error');
      isLoading(false);
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

  LoginScreen() {
    Get.toNamed(Routes.LOGIN);
  }
}
