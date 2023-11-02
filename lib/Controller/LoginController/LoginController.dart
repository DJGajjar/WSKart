import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Model/ProductModel/LoginOtp.dart';

import '../../Constants/query.dart';
import '../../Service/Helper/RequestHelper.dart';
import '../../Service/Model/ProductModel/LoginOtp.dart';
import '../../Service/Model/ProductModel/Product.dart';

class LoginController extends GetxController {
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
      //  categories = await _requestHelper.getProductCategoriesList(
      //           queryParameters: preQueryParameters(catParam));

      LoginOtp loginInfo = await _requestHelper.getLoginOtpAPI(
          queryParameters: preQueryParameters(loginParam));

      if (loginInfo.otp_sent == 1) {
        getStorge.write("VerifyOTP", loginInfo.otp);
        VerifyMobileNumber();
      } else {}
      print('Login Info DataList : ${loginInfo.phone_code}');

      isLoading(false);
    } catch (e) {
      print('Get categories error.');
      isLoading(false);
    }
  }

  SignUpScreen() {
    Get.toNamed(Routes.SIGNUP);
  }

  VerifyMobileNumber() {
    Get.toNamed(Routes.VERIFY);
  }

  ResetPassword() {
    Get.toNamed(Routes.RESETPASSWORDOPT);
  }
}
