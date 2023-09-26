import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'BillingAddressController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class BillingAddressView extends GetView<BillingAddressController> {
  const BillingAddressView({Key? key}) : super(key: key);

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
          text: "Billing Address",
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
              print('Click Add Billing');
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
                            text: "Full Name",
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
                              top: 2,
                              left: 16,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Full Name',
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
                            text: "Country",
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 0.5,
                          ),
                        ),
                      ),
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          print('Select Country');
                        },
                        child: Container(
                          width: (screenSize.width - 48),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Container(
                                  width: (screenSize.width - 98),
                                  height: 30,
                                  child: CustomeTextStyle(
                                    text: "India",
                                    size: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Image.asset(
                                AppImages.DownArrowIcon,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                8.heightBox,
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
                          height: 68,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: CustomAppColors.borderColor),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: CustomeTextStyle(
                                  text: "+ 91",
                                  size: 16,
                                  fontWeight: FontWeight.normal,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                              6.widthBox,
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
                        height: 68,
                        color: Colors.white,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
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
                                  width: (screenSize.width - 160),
                                  height: 20,
                                  child: CustomeTextStyle(
                                    text: "Phone Number",
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                              ),
                              TextFormField(
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
                                keyboardType: TextInputType.name,
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
                                      top: 2,
                                      left: 16,
                                      bottom: 0), // add padding to adjust text
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: 'Enter Phone Number',
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
                      ),
                    ],
                  ),
                ),
                8.heightBox,
                Container(
                  width: (screenSize.width - 48),
                  height: 68,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 68,
                        width: (screenSize.width - 58) / 2,
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
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "State (Optional)",
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                print('Select State');
                              },
                              child: Container(
                                width: (screenSize.width - 58) / 2,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Container(
                                        width: (screenSize.width - 150) / 2,
                                        height: 30,
                                        child: CustomeTextStyle(
                                          text: "Gujarat",
                                          size: 16,
                                          fontWeight: FontWeight.normal,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      AppImages.DownArrowIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      8.widthBox,
                      Container(
                        height: 68,
                        width: (screenSize.width - 58) / 2,
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
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "Postal code",
                                  size: 12,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                            TextFormField(
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
                                    top: 2,
                                    left: 16,
                                    bottom: 0), // add padding to adjust text
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'Enter Postal Code',
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
                            text: "Address",
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
                              top: 2,
                              left: 16,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Address',
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
                            text: "Company Name (Optional)",
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
                              top: 2,
                              left: 16,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter Company Name',
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
                            text: "GST Number (Optional)",
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
                              top: 2,
                              left: 16,
                              bottom: 0), // add padding to adjust text
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter GST Number',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
