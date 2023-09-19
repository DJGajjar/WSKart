import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'VerificationOTPController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class VerificationOTPView extends GetView<VerificationOTPController> {
  const VerificationOTPView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    String strMobileNumber = mobileNumber.read('MobileNumber');

    String strOTP = '';
    bool isOTPNull = false;

    final node = FocusScope.of(context);

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
                        text: "Reset password",
                        size: 13,
                        fontWeight: FontWeight.w700,
                        color: CustomAppColors.lblDarkColor,
                        wordSpacing: 1,
                      ),
                    ),
                  ],
                ),
                44.heightBox,
                Container(
                  width: 124,
                  height: 92,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.appLogo),
                    ),
                  ),
                ),
                44.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 1,
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "Verification code",
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                20.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text:
                        "Your verification code will be sent  to (+91) ${strMobileNumber}",
                    size: 16,
                    fontWeight: FontWeight.normal,
                    color: CustomAppColors.txtPlaceholderColor,
                    wordSpacing: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                32.heightBox,
                Container(
                  width: (MediaQuery.of(context).size.width - 48),
                  height: 56,
                  // color: CustomAppColors.cardBGColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1) node.nextFocus();
                            },
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
                                  left: 18,
                                  bottom: 0), // add padding to adjust text
                              isDense: true,
                              border: InputBorder.none,
                              hintText: '',
                              counterText: '',
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
                      ),
                      16.widthBox,
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1) node.nextFocus();
                            },
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
                                  left: 18,
                                  bottom: 0), // add padding to adjust text
                              isDense: true,
                              border: InputBorder.none,
                              hintText: '',
                              counterText: '',
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
                      ),
                      16.widthBox,
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1) node.nextFocus();
                            },
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
                                  left: 18,
                                  bottom: 0), // add padding to adjust text
                              isDense: true,
                              border: InputBorder.none,
                              hintText: '',
                              counterText: '',
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
                      ),
                      16.widthBox,
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: TextFormField(
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1) node.unfocus();
                            },
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
                                  left: 18,
                                  bottom: 0), // add padding to adjust text
                              isDense: true,
                              border: InputBorder.none,
                              hintText: '',
                              counterText: '',
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
                      ),
                    ],
                  ),
                ),
                16.heightBox,
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
                    callback: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        print('Enter mobile number: $strMobileNumber');
                        if (isOTPNull == false) {
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
                            controller.SetNewPassword();
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
      ),
    );
  }
}
