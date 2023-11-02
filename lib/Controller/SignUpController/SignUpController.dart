import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Model/ProductModel/Register.dart';

import '../../Constants/query.dart';
import '../../ExtraClass/AppColor.dart';
import '../../Service/Helper/RequestHelper.dart';

class SignUpController extends GetxController {
  var isDisplayOTP = false.obs;
  var isOTPVerify = false.obs;
  var isConditionCheckMark = false.obs;

  var isLoading = true.obs;

  var btnTitle = 'Send OTP'.obs;

  final getStorge = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();

  @override
  void onInit() {
    super.onInit();
  }

  void getRegisterOTPAPICall(String strMobile, String strEmail) async {
    isLoading(true);

    print('Mobile Number: $strMobile');

    final loginParam = {
      "wc-ml-reg-phone-cc": "+91",
      "wc-ml-reg-phone": strMobile,
      "wc-ml-reg-email": strEmail,
    };

    print('Param: $loginParam');

    try {
      RegisterUser registerInfo = await _requestHelper.getRegisterOtpAPI(
          queryParameters: preQueryParameters(loginParam));

      if (registerInfo.otp_sent == 1 && registerInfo.error == 0) {
        getStorge.write("VerifyOTP", registerInfo.otp);
        btnTitle.value = 'Verify';
        isDisplayOTP.value = true;
      } else if (registerInfo.error == 1) {
        isDisplayOTP.value = false;

        Get.defaultDialog(
          title: 'Validation',
          backgroundColor: CustomAppColors.appWhiteColor,
          middleText: registerInfo.notice.toString(),
          middleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: CustomAppColors.lblDarkColor,
            wordSpacing: 1,
            height: 1.2,
          ),
          titleStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: CustomAppColors.lblOrgColor,
            wordSpacing: 1,
            height: 1.2,
          ),
        );
      }
      print('Register Info DataList : ${registerInfo.phone_code}');

      isLoading(false);
    } catch (e) {
      print('Get categories error.');
      isLoading(false);
    }
  }

  void getRegisterOTPVerificationAPICall(
      String strMobile, String strOTP, String strEmail) async {
    isLoading(true);

    print('Mobile Number: $strMobile');

    final loginParam = {
      "wc-ml-reg-phone-cc": "+91",
      "wc-ml-reg-phone": strMobile,
      "otp": strOTP,
      "wc-ml-reg-email": strEmail,
    };

    print('Param: $loginParam');

    try {
      RegisterUser registerInfo = await _requestHelper.getOTPVerifyAPI(
          queryParameters: preQueryParameters(loginParam));

      print('Login Info DataList : ${registerInfo.user_id}');

      isOTPVerify.value = true;

      //controller.BottomTabBarController();
      LoginScreen();
      isLoading(false);
    } catch (e) {
      print('Get categories error.');
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

  TermsAndServiceScrren() {
    Get.toNamed(Routes.TERMSPRIVACY);
  }
}
