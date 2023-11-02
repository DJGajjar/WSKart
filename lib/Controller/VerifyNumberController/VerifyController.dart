import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import '../../Constants/query.dart';
import '../../Service/Helper/RequestHelper.dart';
import '../../Service/Model/ProductModel/LoginOtp.dart';
import '../../Service/Model/ProductModel/Register.dart';

class VerifyController extends GetxController {
  var isLoading = true.obs;

  final getStorge = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();

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

  void getMobileOTPAPICall(String strMobile) async {
    isLoading(true);

    print('Mobile Number: $strMobile');

    final loginParam = {
      "wc-ml-reg-phone-cc": "+91",
      "wc-ml-reg-phone": strMobile,
    };

    print('Param: $loginParam');

    try {
      LoginOtp loginInfo = await _requestHelper.getLoginOtpAPI(
          queryParameters: preQueryParameters(loginParam));

      if (loginInfo.otp_sent == 1) {
        getStorge.write("VerifyOTP", loginInfo.otp);
      } else {
        print('Api Call Fail');
      }
      print('Login Info DataList : ${loginInfo.phone_code}');

      isLoading(false);
    } catch (e) {
      print('Get categories error.');
      isLoading(false);
    }
  }

  /*void getOTPVerificationAPICall(String strMobile, String strOTP) async {
    isLoading(true);

    print('Mobile Number: $strMobile');

    final loginParam = {
      "wc-ml-reg-phone-cc": "+91",
      "wc-ml-reg-phone": strMobile,
      "otp": strOTP,
    };

    print('Param: $loginParam');

    try {
      RegisterUser registerInfo = await _requestHelper.getOTPVerifyAPI(
          queryParameters: preQueryParameters(loginParam));

      if (registerInfo.status == true) {
        getStorge.write("UserID", registerInfo.user_id);
        String strStoreUserID = getStorge.read('UserID');
        print('UserID: $strStoreUserID');
      }

      //controller.BottomTabBarController();
      isLoading(false);
    } catch (e) {
      print('Get Register categories error.');
      isLoading(false);
    }
  }*/

  void getOTPVerificationAPICall(String strMobile, String strOTP) async {
    isLoading(true);

    print('Mobile Number: $strMobile');

    final loginParam = {
      "wc-ml-reg-phone-cc": "+91",
      "wc-ml-reg-phone": strMobile,
      "otp": strOTP,
    };

    print('Param: $loginParam');

    try {
      RegisterUser registerInfo = await _requestHelper.getOTPVerifyAPI(
          queryParameters: preQueryParameters(loginParam));

      print('Login Info DataList : ${registerInfo.user_id}');
      print('Login Info DataList : ${registerInfo.status}');

      if (registerInfo.status == true) {
        getStorge.write("UserID", registerInfo.user_id);
        getStorge.write("isLogin", "Yes");
        int intStoreUserID = getStorge.read('UserID');
        print('UserID: $intStoreUserID');
        Get.offAllNamed(Routes.TABBARROUTES);
      }

      //controller.BottomTabBarController();
      isLoading(false);
    } catch (e) {
      print('Get categories error.');
      isLoading(false);
    }
  }
}
