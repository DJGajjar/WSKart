import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyCart/Checkout/CheckoutView.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'package:wskart/Service/Model/AddToCart/cart.dart';
import 'dart:convert';

class CheckoutController extends GetxController {
  var isDiscountCodeAdd = false.obs;
  var strDiscount = ''.obs;
  var strDiscountStatus = ''.obs;
  var strMsg = ''.obs;
  var isCheckOut = true.obs;
  var isShowAlert = false.obs;
  var strAddress = '';

  final RequestHelper _requestHelper = RequestHelper();

  var isBillingAddressAdd = false.obs;
  var isPaymentMethodAdd = true.obs;
  var isCouponApplied = false.obs;

  late CartProductList addToCartList;

  final getStorage = GetStorage();

  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkOutMyCartProduct();
  }

  checkOutMyCartProduct() async {
    String strUName = getStorage.read('username');
    print("Username: $strUName");

    isCheckOut = true.obs;

    print("Valie Cehck?>>../>>");

    final cartParam = {
      "username": strUName,
    };

    print("Value OF User: $cartParam");

    String username = 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835';
    String password = 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc';

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    print("Basic URL Create: $basicAuth");

    try {
      addToCartList = await _requestHelper.getListOfMyCartProduct(
          queryParameters: cartParam);

      print('CAlue OD: ${addToCartList.message}');
      print('Total Item List: ${addToCartList.cartItems?.length}');
      print('Total Msg: ${addToCartList.cartTotals?.subtotal}');

      if (addToCartList.userData?.shippingData?.first_name != "") {
        isBillingAddressAdd = true.obs;
      }

      if (addToCartList.userData?.shippingData?.address_1 != "") {
        strAddress = addToCartList.userData?.shippingData?.address_1 as String;
      }

      if (addToCartList.userData?.shippingData?.address_2 != "") {
        strAddress = '${strAddress}'
            '${addToCartList.userData?.shippingData?.last_name as String}';
      }

      if (addToCartList.userData?.shippingData?.city != "") {
        strAddress = '${strAddress}'
            '${','}'
            '${addToCartList.userData?.shippingData?.city as String}';
      }

      if (addToCartList.userData?.shippingData?.state != "") {
        strAddress = '${strAddress}'
            '${','}'
            '${addToCartList.userData?.shippingData?.state as String}';
      }

      if (addToCartList.userData?.shippingData?.postcode != "") {
        strAddress = '${strAddress}'
            '${','}'
            '${addToCartList.userData?.shippingData?.postcode as String}'
            '${'.'}';
      }

      if (addToCartList.cartItems?.length != 0) {
        print("Value CJec lascal;df afkljadkls");
        cartItemCount.value = addToCartList.cartItems!.length;
        isCheckOut.value = false;
        print("Calea: $cartItemCount");
      }
    } catch (error) {
      print(error);
      isCheckOut = false.obs;
    }
  }

  applyCouponCode(String? couponCode) async {
    isCheckOut = true.obs;

    print("Valie Cehck?>>../>>");

    final couponParam = {
      "coupon_code": couponCode,
    };

    print("Value OF User: $couponParam");

    try {
      Map<String, dynamic> response =
          await _requestHelper.applyCouponCode(queryParameters: couponParam);
      print('CValue OD: ${response['status']}');
      isShowAlert = true.obs;
      isCouponApplied.value = true;

      if (response['status'] == "error") {
        strDiscountStatus.value = '1';
        strMsg.value = 'Coupon code does not exist';
      } else {
        strDiscountStatus.value = '2';
        strMsg.value = 'Coupon code applied successfully';
        checkOutMyCartProduct();
      }
      print('Value>>>>>++++++>>>>>');
    } catch (error) {
      print(error);
      strDiscountStatus.value = '0';
      strMsg.value = 'Some network issue';
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
