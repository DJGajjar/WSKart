import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'SignUpController.dart';
import 'package:flutter/gestures.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    String strMobileNumber = '';
    bool isMobileNumberNull = false;
    String strEmailAddress = '';
    bool isEmailAddressNull = false;
    String strOTP = '';
    bool isOTPNull = false;

    final screenSize = MediaQuery.of(context).size;
    final widthS = screenSize.width - 48;

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
                        text: "WELCOME",
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
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "WELCOME",
                    size: 13,
                    fontWeight: FontWeight.w700,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),*/
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
                Obx(
                  () => Container(
                    height: controller.isDisplayOTP.value == true ? 72 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.heightBox,
                        Container(
                          width: MediaQuery.of(context).size.width - 48,
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            validator: (PhoneOTP) {
                              if (PhoneOTP == null || PhoneOTP.isEmpty) {
                                strOTP = 'No';
                                isOTPNull = false;
                                return null;
                              } else {
                                strOTP = PhoneOTP;
                                isOTPNull = true;
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
                        ),
                        /*Container(
                          height: 35,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Container(
                                    height: 30,
                                    child: CustomeTextStyle(
                                      text: '',
                                      textAlign: TextAlign.left,
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  height: 35,
                                  // color: CustomAppColors.appBGColor,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          CustomAppColors.appBGColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      print('Click E Verify');
                                      String strStoreOTP =
                                          mobileNumber.read('VerifyOTP');

                                      if (strStoreOTP == strOTP) {
                                        controller
                                            .getRegisterOTPVerificationAPICall(
                                                strMobileNumber,
                                                strOTP,
                                                strEmailAddress);
                                      } else {
                                        if (isOTPNull == false) {
                                          Get.defaultDialog(
                                            title: 'Validation',
                                            backgroundColor:
                                                CustomAppColors.appWhiteColor,
                                            middleText: 'Please Enter OTP',
                                            middleTextStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              color:
                                                  CustomAppColors.lblDarkColor,
                                              wordSpacing: 1,
                                              height: 1.2,
                                            ),
                                            titleStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color:
                                                  CustomAppColors.lblOrgColor,
                                              wordSpacing: 1,
                                              height: 1.2,
                                            ),
                                          );
                                        }
                                        Get.defaultDialog(
                                          title: 'Validation',
                                          backgroundColor:
                                              CustomAppColors.appWhiteColor,
                                          middleText: 'Please Enter Valid OTP',
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
                                      // controller.isOTPVerify.value = true;
                                    },
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 1,
                                        height: 1.2,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
                16.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: TextFormField(
                    validator: (EmailAddress) {
                      if (EmailAddress == null || EmailAddress.isEmpty) {
                        strEmailAddress = 'No';
                        isEmailAddressNull = false;
                        return null;
                      } else {
                        strEmailAddress = EmailAddress;
                        isEmailAddressNull = true;
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    controller: null,
                    keyboardType: TextInputType.emailAddress,
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
                      hintText: 'Email address',
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
                ),
                16.heightBox,
                Container(
                  height: 40,
                  // color: CustomAppColors.appBGColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Check Mark Condition');
                            if (controller.isConditionCheckMark.value ==
                                false) {
                              controller.isConditionCheckMark.value = true;
                            } else {
                              controller.isConditionCheckMark.value = false;
                            }
                          },
                          child: Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 16),
                              child: Container(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  controller.isConditionCheckMark.value == false
                                      ? AppImages.UNCheckIcon
                                      : AppImages.CheckIcon,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By signing up, you agree to our ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 1,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Term of Service & Privacy Policy',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: CustomAppColors.lblOrgColor,
                                    wordSpacing: 1,
                                    height: 1.2,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Call Term and service');
                                      controller.TermsAndServiceScrren();
                                    },
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: Obx(
                    () => RoundedButton(
                      btnName: controller.btnTitle.value,
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
                          print('Enter OTP: $strOTP');

                          String strStoreOTP = mobileNumber.read('VerifyOTP');

                          if (isMobileNumberNull == false) {
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
                          } else if (strMobileNumber.length != 10) {
                            Get.defaultDialog(
                              title: 'Validation',
                              backgroundColor: CustomAppColors.appWhiteColor,
                              middleText:
                                  'Please Enter Atlist 10 Digit Of Number',
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
                          } else if (isEmailAddressNull == false) {
                            Get.defaultDialog(
                              title: 'Validation',
                              backgroundColor: CustomAppColors.appWhiteColor,
                              middleText: 'Please Enter Email Address',
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
                          } else if (GetUtils.isEmail(strEmailAddress!) ==
                              false) {
                            Get.defaultDialog(
                              title: 'Validation',
                              backgroundColor: CustomAppColors.appWhiteColor,
                              middleText: 'Please Enter Valid Email Address',
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
                          } else {
                            if (strMobileNumber.trim() != '' &&
                                strEmailAddress.trim() != '') {
                              if (controller.isDisplayOTP.value == false) {
                                controller.getRegisterOTPAPICall(
                                    strMobileNumber, strEmailAddress);
                              } else {
                                if (isOTPNull == false) {
                                  Get.defaultDialog(
                                    title: 'Validation',
                                    backgroundColor:
                                        CustomAppColors.appWhiteColor,
                                    middleText: 'Please Enter OTP',
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
                                } else if (strOTP.trim() == '') {
                                  Get.defaultDialog(
                                    title: 'Validation',
                                    backgroundColor:
                                        CustomAppColors.appWhiteColor,
                                    middleText: 'Please Enter Verify OTP',
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
                                } else if (strStoreOTP != strOTP) {
                                  Get.defaultDialog(
                                    title: 'Validation',
                                    backgroundColor:
                                        CustomAppColors.appWhiteColor,
                                    middleText: 'Please Enter Valid OTP',
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
                                } else if (controller
                                        .isConditionCheckMark.value ==
                                    false) {
                                  Get.defaultDialog(
                                    title: 'Validation',
                                    backgroundColor:
                                        CustomAppColors.appWhiteColor,
                                    middleText: 'Please Check Terms & Privacy',
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
                                } else {
                                  controller.getRegisterOTPVerificationAPICall(
                                      strMobileNumber, strOTP, strEmailAddress);
                                }
                              }
                            } else {
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
                                  fontSize: 14,
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
                      },
                    ),
                  ),
                ),
                32.heightBox,
                /*Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 1,
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                InkWell(
                  onTap: () {
                    print('Skip Now');
                    controller.LoginScreen();
                  },
                  child: Container(
                    child: CustomeTextStyle(
                      text: "Skip for now",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 1,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
