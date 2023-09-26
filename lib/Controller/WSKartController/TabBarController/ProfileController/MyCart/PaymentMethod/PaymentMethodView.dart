import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'PaymentMethodController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    var arrCreditCardList = [
      {
        'CardID': '1',
        'CartName': 'Mastercard - 9904',
        'CardImg': '',
        'isSelected': '1',
      },
      {
        'CardID': '2',
        'CartName': 'Visa - 1111',
        'CardImg': '',
        'isSelected': '0',
      },
      {
        'CardID': '3',
        'CartName': 'American Express - 0006',
        'CardImg': '',
        'isSelected': '0',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Pay with",
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          Container(
            width: (screenSize.width),
            height: (arrCreditCardList.length * 60) + 356 > (screenSize.height)
                ? (screenSize.height - 356)
                : (arrCreditCardList.length * 60),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: arrCreditCardList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: (screenSize.width),
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            child: arrCreditCardList[index]['isSelected']
                                        .toString() ==
                                    '1'
                                ? Image.asset(
                                    AppImages.ProfileCheckCreditCartIcon,
                                    height: 24,
                                    width: 28,
                                  )
                                : Image.asset(
                                    AppImages.ProfileUnCheckIconIcon,
                                    height: 24,
                                    width: 28,
                                  ),
                          ),
                          12.widthBox,
                          Container(
                            height: 20,
                            // color: Colors.red,
                            child: CustomeTextStyle(
                              text: arrCreditCardList[index]['CartName']
                                  .toString(),
                              size: 13,
                              fontWeight: FontWeight.w500,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                          12.widthBox,
                          Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ProfileCreditCardIcon,
                              height: 24,
                              width: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 12),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 1,
              width: (MediaQuery.of(context).size.width - 48),
              color: CustomAppColors.borderColor,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 32),
            child: Container(
              width: (screenSize.width - 48),
              height: 168,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('Credit debit card: ${screenSize.height}');
                    },
                    child: Container(
                      width: (screenSize.width),
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              AppImages.ProfileAddCardIcon,
                              height: 24,
                              width: 28,
                            ),
                          ),
                          12.widthBox,
                          Container(
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: CustomeTextStyle(
                                text: 'New debit/credit card',
                                size: 13,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          12.widthBox,
                          Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ProfilePayment,
                              height: 24,
                              width: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.heightBox,
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('Banking Internet');
                    },
                    child: Container(
                      width: (screenSize.width),
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              AppImages.ProfileAddCardIcon,
                              height: 24,
                              width: 28,
                            ),
                          ),
                          12.widthBox,
                          Container(
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: CustomeTextStyle(
                                text: 'ATM / Internet banking',
                                size: 13,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          12.widthBox,
                          Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ProfileBankingIcon,
                              height: 24,
                              width: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.heightBox,
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('PayPal Click');
                    },
                    child: Container(
                      width: (screenSize.width),
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              AppImages.ProfileAddCardIcon,
                              height: 24,
                              width: 28,
                            ),
                          ),
                          12.widthBox,
                          Container(
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: CustomeTextStyle(
                                text: 'Paypal',
                                size: 13,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          12.widthBox,
                          Container(
                            width: 80,
                            height: 24,
                            child: Image.asset(
                              AppImages.ProfilePayPalIcon,
                              height: 24,
                              width: 28,
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
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
