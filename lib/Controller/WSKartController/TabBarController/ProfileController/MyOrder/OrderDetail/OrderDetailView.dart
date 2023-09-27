import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'OrderDetailController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Order Details",
          size: 16,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(),
        actions: <Widget>[
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              print('Click Close');
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomeTextStyle(
                text: "Close",
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeTextStyle(
                        text: "Nike waffle debut women’s shoes -- Rs 59.99x1",
                        size: 22,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColors.lblDarkColor,
                        wordSpacing: 4,
                      ),
                      16.heightBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CustomeTextStyle(
                              text: "Black",
                              size: 13,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 4,
                            ),
                          ),
                          8.widthBox,
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          8.widthBox,
                          Container(
                            child: CustomeTextStyle(
                              text: "Size: 44",
                              size: 13,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                24.heightBox,
                Container(
                  height: 76,
                  width: (screenSize.width - 48),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 78,
                        width: (screenSize.width - 58) / 2,
                        decoration: BoxDecoration(
                          color: CustomAppColors.cardBGColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            12.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 6),
                              child: Container(
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "Order ID",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblOrgColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Container(
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "#982445",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.widthBox,
                      Container(
                        height: 78,
                        width: (screenSize.width - 58) / 2,
                        decoration: BoxDecoration(
                          color: CustomAppColors.cardBGColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            12.heightBox,
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 6),
                              child: Container(
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "Status",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblOrgColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Container(
                                height: 20,
                                child: CustomeTextStyle(
                                  text: "Processing",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                24.heightBox,
                Container(
                  height: 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: (screenSize.width - 48),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '--- Your order bought ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: CustomAppColors.txtPlaceholderColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: '05/11/2023',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      16.heightBox,
                      Container(
                        width: (screenSize.width - 48),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '--- Estimated delivery time ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: CustomAppColors.txtPlaceholderColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: '05/16/2023',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                18.heightBox,
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('Click To Track Order');
                  },
                  child: Container(
                    width: (screenSize.width - 48),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: CustomAppColors.txtPlaceholderColor,
                      ),
                      color: CustomAppColors.cardBGColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: CustomeTextStyle(
                        textAlign: TextAlign.center,
                        text: "Track Order",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                24.heightBox,
                Container(
                  height: 148,
                  width: (screenSize.width - 48),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomAppColors.txtPlaceholderColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 18),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppImages.ProfileLocation,
                                height: 16,
                                width: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: CustomeTextStyle(
                                  text: "Billing Address",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblOrgColor,
                                  wordSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12),
                        child: Container(
                          child: CustomeTextStyle(
                            text: "Esther Howard",
                            size: 15,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12),
                        child: Container(
                          child: CustomeTextStyle(
                            text: "(704) 555-0127",
                            size: 15,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12),
                        child: Container(
                          child: CustomeTextStyle(
                            text: "4140 Parker Rd. Allentown, New Mexico",
                            size: 15,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.lblDarkColor,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                Container(
                  height: 92,
                  width: (screenSize.width - 48),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomAppColors.txtPlaceholderColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 20),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppImages.ProfilePayment,
                                height: 16,
                                width: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: CustomeTextStyle(
                                  text: "Payment Method",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblOrgColor,
                                  wordSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 12),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 28,
                                height: 24,
                                child: Image.asset(
                                  AppImages.ProfileCreditCardIcon,
                                  height: 24,
                                  width: 28,
                                ),
                              ),
                              12.widthBox,
                              Container(
                                child: CustomeTextStyle(
                                  text: 'Mastercard - 9904',
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                  color: CustomAppColors.lblColor,
                                  wordSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
                Container(
                  height: 132,
                  width: (screenSize.width - 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: (screenSize.width - 48),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              child: CustomeTextStyle(
                                text: "Subtotal",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblColor,
                                wordSpacing: 4,
                              ),
                            ),
                            Container(
                              width: 130,
                              child: CustomeTextStyle(
                                text: "Rs 150.86",
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.heightBox,
                      Container(
                        height: 24,
                        width: (screenSize.width - 48),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              child: CustomeTextStyle(
                                text: "Discount",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblColor,
                                wordSpacing: 4,
                              ),
                            ),
                            Container(
                              width: 130,
                              child: CustomeTextStyle(
                                text: "Rs 00.00",
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.heightBox,
                      Container(
                        height: 24,
                        width: (screenSize.width - 48),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              child: CustomeTextStyle(
                                text: "Delivery fee",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblColor,
                                wordSpacing: 4,
                              ),
                            ),
                            Container(
                              width: 130,
                              child: CustomeTextStyle(
                                text: "Rs 10.00",
                                size: 15,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.heightBox,
                      Container(
                        height: 24,
                        width: (screenSize.width - 48),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              child: CustomeTextStyle(
                                text: "Total",
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 4,
                              ),
                            ),
                            Container(
                              width: 130,
                              child: CustomeTextStyle(
                                text: "Rs 160.86",
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 4,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                25.heightBox,
                Container(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Buy again');
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              border: Border.all(
                                width: 1,
                                color: CustomAppColors.borderColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CustomeTextStyle(
                                text: "Buy again",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        12.widthBox,
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Product rating');
                          },
                          child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              border: Border.all(
                                width: 1,
                                color: CustomAppColors.borderColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CustomeTextStyle(
                                text: "Product rating",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        12.widthBox,
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Cancel order');
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              border: Border.all(
                                width: 1,
                                color: CustomAppColors.borderColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CustomeTextStyle(
                                text: "Cancel order",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblOrgColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        12.widthBox,
                      ],
                    ),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
