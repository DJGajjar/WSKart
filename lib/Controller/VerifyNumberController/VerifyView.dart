import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'VerifyController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class VerifyView extends GetView<VerifyController> {
  const VerifyView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    String strMobileNumber = mobileNumber.read('MobileNumber');

    String strOTP = '';
    bool isOTPNull = false;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              44.heightBox,
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Image.asset(AppImages.BackIcon),
                          iconSize: 28,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomeTextStyle(
                      text: "SIGN IN",
                      size: 13,
                      fontWeight: FontWeight.w700,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 1,
                    ),
                  ),
                ],
              ),
              /*Container(
                alignment: Alignment.center,
                color: Colors.red,
                height: 35,
                child: CustomeTextStyle(
                  text: "SIGN IN",
                  size: 13,
                  fontWeight: FontWeight.w700,
                  color: CustomAppColors.lblDarkColor,
                  wordSpacing: 1,
                ),
              ),*/
              46.heightBox,
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 48),
                child: CustomeTextStyle(
                  text: "Verify your number to keep \n your account secure",
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomAppColors.lblDarkColor,
                  wordSpacing: 4,
                  textAlign: TextAlign.center,
                ),
              ),
              24.heightBox,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Enter the verification code that we sent you to ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: CustomAppColors.txtPlaceholderColor,
                        wordSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          '+91 ${strMobileNumber.replaceRange(0, 6, '******')}.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: " If you don't see it, please check spam.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: CustomAppColors.txtPlaceholderColor,
                        wordSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              32.heightBox,
              Container(
                width: MediaQuery.of(context).size.width - 48,
                height: 56,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: CustomAppColors.borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: TextFormField(
                  validator: (OTPNumber) {
                    if (OTPNumber == null || OTPNumber.isEmpty) {
                      strOTP = 'No';
                      isOTPNull = false;
                      return null;
                    } else {
                      strOTP = OTPNumber;
                      isOTPNull = true;
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  controller: null,
                  keyboardType: TextInputType.number,
                  cursorColor: CustomAppColors.txtPlaceholderColor,
                  cursorWidth: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomAppColors.txtPlaceholderColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 4,
                        left: 10,
                        bottom: 0), // add padding to adjust text
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Enter OTP',
                    hintStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: CustomAppColors.txtPlaceholderColor,
                      wordSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
                /*TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 11),
                    filled: true,
                    fillColor: CustomAppColors.appWhiteColor,
                    // border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: CustomAppColors.txtPlaceholderColor,
                      wordSpacing: 1,
                      height: 1.5,
                    ),
                    border: InputBorder.none,
                    hintText: 'Enter OTP',
                  ),
                ),*/
              ),
              32.heightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                height: 56,
                child: RoundedButton(
                  btnName: 'Verify',
                  btnBGColor: Colors.transparent,
                  btnStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: CustomAppColors.appWhiteColor,
                    wordSpacing: 1,
                    height: 1.2,
                  ),
                  callback: () {
                    print('Click Sign In');
                  },
                ),
              ),
              32.heightBox,
              InkWell(
                onTap: () {
                  print('Resend OTP');
                },
                child: Container(
                  child: CustomeTextStyle(
                    text: "Resend",
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: CustomAppColors.lblOrgColor,
                    wordSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
