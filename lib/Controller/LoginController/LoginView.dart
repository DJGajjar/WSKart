import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'LoginController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    String strMobileNumber = '';
    bool isMobileNumberNull = false;

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: formGlobalKey,
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
                    text: "WELCOME",
                    size: 13,
                    fontWeight: FontWeight.w700,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),
                24.heightBox,
                Container(
                  width: 69,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.appLogo),
                    ),
                  ),
                ),
                24.heightBox,
                Container(
                  width: (MediaQuery.of(context).size.width - 48),
                  height: 120,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomeTextStyle(
                          text: "Sign up for the",
                          size: 28,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                      Center(
                        child: CustomeTextStyle(
                          text: "Best Shopping",
                          size: 28,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblOrgColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                      Center(
                        child: CustomeTextStyle(
                          text: "Experience",
                          size: 28,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblOrgColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          print('Click To Select Country');
                        },
                        child: Container(
                          width: 84,
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Row(
                            children: [
                              CustomeTextStyle(
                                text: "+ 91",
                                size: 16,
                                fontWeight: FontWeight.normal,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                              4.widthBox,
                              Image.asset(
                                AppImages.DownArrowIcon,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 56,
                        color: Colors.white,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 84,
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            validator: (MobileNumber) {
                              if (MobileNumber == null ||
                                  MobileNumber.isEmpty) {
                                strMobileNumber = 'No';
                                isMobileNumberNull = false;
                                return null;
                              } else {
                                strMobileNumber = MobileNumber;
                                isMobileNumberNull = true;
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              hintText: 'Enter your phone number',
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
                              hintText: 'Enter your phone number',
                            ),
                          ),*/
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Sign In',
                    btnBGColor: Colors.transparent,
                    btnStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: CustomAppColors.appWhiteColor,
                      wordSpacing: 1,
                      height: 1.2,
                    ),
                    callback: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        print('Enter mobile number: $strMobileNumber');
                        if (isMobileNumberNull == false) {
                          Get.defaultDialog(
                            title: 'Validation',
                            backgroundColor: CustomAppColors.appWhiteColor,
                            middleText: 'Please Enter Valid Phone Number',
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
                              fontSize: 16,
                              color: CustomAppColors.lblOrgColor,
                              wordSpacing: 1,
                              height: 1.2,
                            ),
                          );
                        } else {
                          if (strMobileNumber.trim() != '') {
                            mobileNumber.write('MobileNumber', strMobileNumber);
                            controller.VerifyMobileNumber();
                          } else {
                            Get.defaultDialog(
                              title: 'Validation',
                              backgroundColor: CustomAppColors.appWhiteColor,
                              middleText: 'Please Enter Valid Phone Number',
                              middleTextStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 1,
                                height: 1.2,
                              ),
                              titleStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 1,
                                height: 1.2,
                              ),
                            );
                          }
                        }
                      } else {
                        print('Validation mobile number');
                        Get.defaultDialog(
                          title: 'Validation',
                          backgroundColor: CustomAppColors.appWhiteColor,
                          middleText: 'Please Enter Valid Phone Number',
                          middleTextStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 1,
                            height: 1.2,
                          ),
                          titleStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: CustomAppColors.lblOrgColor,
                            wordSpacing: 1,
                            height: 1.2,
                          ),
                        );
                      }
                    },
                  ),
                ),
                10.heightBox,
                InkWell(
                  onTap: () {
                    print('Reset Password');
                    controller.ResetPassword();
                  },
                  child: Container(
                    width: (screenSize.width - 48),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomeTextStyle(
                        textAlign: TextAlign.right,
                        text: "Reset password",
                        size: 15,
                        fontWeight: FontWeight.w400,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 1,
                      ),
                    ),
                  ),
                ),
                32.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 1,
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                InkWell(
                  onTap: () {
                    print('Reset Password');
                    controller.SignUpScreen();
                  },
                  child: Container(
                    child: CustomeTextStyle(
                      text: "SignUp",
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
      ),
    );
  }
}
