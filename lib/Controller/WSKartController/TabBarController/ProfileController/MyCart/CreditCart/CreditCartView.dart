import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'CreditCartController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class CreditCartView extends GetView<CreditCartController> {
  const CreditCartView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    String strMobileNumber = '';
    bool isMobileNumberNull = false;
    String strEmailAddress = '';
    bool isEmailAddressNull = false;
    String strOTP = '';
    bool isOTPNull = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "New card",
          size: 16,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(
          onTap: () {
            print('Click Back Button');
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(AppImages.BackIcon),
          ),
        ),
        actions: <Widget>[
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              print('Click Add New Card');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomeTextStyle(
                text: "Add",
                size: 14,
                fontWeight: FontWeight.w600,
                color: CustomAppColors.lblOrgColor,
                wordSpacing: 4,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                5.heightBox,
                Container(
                  width: (screenSize.width - 48),
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: (screenSize.width - 90),
                        height: 56,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          validator: (MobileNumber) {
                            if (MobileNumber == null || MobileNumber.isEmpty) {
                              strMobileNumber = 'No';
                              isMobileNumberNull = false;
                              return null;
                            } else {
                              strMobileNumber = MobileNumber;
                              isMobileNumberNull = true;
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.txtPlaceholderColor,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 12,
                                left: 16,
                                bottom: 0), // add padding to adjust text
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Enter Card Number',
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
                      Image.asset(
                        AppImages.ProfilePayment,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ),
                8.heightBox,
                Container(
                  width: (screenSize.width - 48),
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56,
                        width: (screenSize.width - 58) / 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomAppColors.borderColor),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: TextFormField(
                          validator: (MobileNumber) {
                            if (MobileNumber == null || MobileNumber.isEmpty) {
                              strMobileNumber = 'No';
                              isMobileNumberNull = false;
                              return null;
                            } else {
                              strMobileNumber = MobileNumber;
                              isMobileNumberNull = true;
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          controller: null,
                          keyboardType: TextInputType.name,
                          cursorColor: CustomAppColors.txtPlaceholderColor,
                          cursorWidth: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.txtPlaceholderColor,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 12,
                                left: 16,
                                bottom: 0), // add padding to adjust text
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'MM / DD',
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
                      8.widthBox,
                      Container(
                        height: 56,
                        width: (screenSize.width - 58) / 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomAppColors.borderColor),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: (screenSize.width - 138) / 2,
                              height: 56,
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
                                cursorColor:
                                    CustomAppColors.txtPlaceholderColor,
                                cursorWidth: 2,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: CustomAppColors.txtPlaceholderColor,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 12,
                                      left: 16,
                                      bottom: 0), // add padding to adjust text
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: 'CVV',
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
                            Image.asset(
                              AppImages.ProfileInfoIcon,
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                8.heightBox,
                Container(
                  width: (screenSize.width - 48),
                  height: 68,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: CustomAppColors.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          width: (screenSize.width - 48),
                          height: 20,
                          child: CustomeTextStyle(
                            text: "Zip code",
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 0.5,
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (MobileNumber) {
                          if (MobileNumber == null || MobileNumber.isEmpty) {
                            strMobileNumber = 'No';
                            isMobileNumberNull = false;
                            return null;
                          } else {
                            strMobileNumber = MobileNumber;
                            isMobileNumberNull = true;
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
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: CustomAppColors.txtPlaceholderColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 2,
                              left: 16,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Zip code',
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
                    ],
                  ),
                ),
                32.heightBox,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  child: RoundedButton(
                    btnName: 'Save',
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
                      print('Credit Card Save Click');
                    },
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
