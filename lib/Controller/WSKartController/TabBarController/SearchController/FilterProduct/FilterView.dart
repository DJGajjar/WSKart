import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'FilterController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class FilterView extends GetView<FilterController> {
  const FilterView({Key? key}) : super(key: key);

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

    int step = 1;
    int max = 180;
    int min = 60;

    RangeValues _currentRangeValues = const RangeValues(40, 80);
    double start = 30.0;
    double end = 50.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Filter",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (screenSize.width),
            height: (screenSize.height - 200),
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      Container(
                        width: (screenSize.width - 48),
                        child: CustomeTextStyle(
                          text: "Prices",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 4,
                        ),
                      ),
                      20.heightBox,
                      Container(
                          width: (screenSize.width - 48),
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomeTextStyle(
                                text: "Rs 20",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                              CustomeTextStyle(
                                text: "Rs 20",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                            ],
                          )),
                      RangeSlider(
                        values: RangeValues(start, end),
                        labels: RangeLabels(start.toString(), end.toString()),
                        onChanged: (value) {
                          start = value.start;
                          end = value.end;
                        },
                        min: 10.0,
                        max: 80.0,
                      ),
                      30.heightBox,
                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        height: 1,
                        color: CustomAppColors.borderColor,
                      ),
                      30.heightBox,
                      Container(
                        width: (screenSize.width - 48),
                        child: CustomeTextStyle(
                          text: "Colors",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 4,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(AppImages
                                                .ProductColorSelectIcon),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.appWhiteColor,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.switchOrgColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.cartCountBGColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.badgeBGColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            24.heightBox,
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(AppImages
                                                .ProductColorSelectIcon),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.appWhiteColor,
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.switchOrgColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.cartCountBGColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                  24.widthBox,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.badgeBGColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            30.heightBox,
                            Container(
                              width: MediaQuery.of(context).size.width - 48,
                              height: 1,
                              color: CustomAppColors.borderColor,
                            ),
                          ],
                        ),
                      ),
                      30.heightBox,
                      Container(
                        width: (screenSize.width - 48),
                        child: CustomeTextStyle(
                          text: "Brands",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 4,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        width: (screenSize.width - 48),
                        height: 164,
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      print('All Item');
                                    },
                                    child: Container(
                                      width: (screenSize.width - 80) / 3,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: CustomAppColors.borderColor),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        ),
                                      ),
                                      child: Center(
                                        child: CustomeTextStyle(
                                          textAlign: TextAlign.center,
                                          text: "Nike",
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 4,
                                        ),
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Adidas",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Yame",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            22.heightBox,
                            Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Uniqlo",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Lyos",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Degrey",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            22.heightBox,
                            Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Puman",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "Herms",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                  16.widthBox,
                                  Container(
                                    width: (screenSize.width - 80) / 3,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: CustomAppColors.borderColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "MWC",
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      32.heightBox,
                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        height: 1,
                        color: CustomAppColors.borderColor,
                      ),
                      32.heightBox,
                      Container(
                        width: (screenSize.width - 48),
                        child: CustomeTextStyle(
                          text: "Reviews",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 4,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 36,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 78,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColors.borderColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    14.widthBox,
                                    Image.asset(
                                      AppImages.ProfileRatingIcon,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.widthBox,
                                    CustomeTextStyle(
                                      text: "5.0",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              8.widthBox,
                              Container(
                                width: 78,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColors.borderColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    14.widthBox,
                                    Image.asset(
                                      AppImages.ProfileRatingIcon,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.widthBox,
                                    CustomeTextStyle(
                                      text: "4.0",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              8.widthBox,
                              Container(
                                width: 78,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColors.borderColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    14.widthBox,
                                    Image.asset(
                                      AppImages.ProfileRatingIcon,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.widthBox,
                                    CustomeTextStyle(
                                      text: "3.0",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              8.widthBox,
                              Container(
                                width: 78,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColors.borderColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    14.widthBox,
                                    Image.asset(
                                      AppImages.ProfileRatingIcon,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.widthBox,
                                    CustomeTextStyle(
                                      text: "4.0",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              8.widthBox,
                              Container(
                                width: 78,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColors.borderColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    14.widthBox,
                                    Image.asset(
                                      AppImages.ProfileRatingIcon,
                                      height: 14,
                                      width: 14,
                                    ),
                                    8.widthBox,
                                    CustomeTextStyle(
                                      text: "1.0",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              print('Click To Open New Billing Address');
              // Get.toNamed(Routes.PROFILEPAYMENTLISTROUTES);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
              child: Container(
                width: (screenSize.width - 48),
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Container(
                  child: Center(
                    child: CustomeTextStyle(
                      text: "Show 44 products",
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.appWhiteColor,
                      wordSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
