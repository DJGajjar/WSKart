import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'ShippingAddressController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class ShippingAddressView extends GetView<ShippingAddressController> {
  const ShippingAddressView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    var arrShippingAddressList = [
      {
        'ShippingID': '1',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      },
      {
        'ShippingID': '0',
      }
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Shipping Address",
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
          Container(
            width: (screenSize.width),
            height: (screenSize.height - 200),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: arrShippingAddressList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: (screenSize.width),
                    height: 164,
                    color: arrShippingAddressList[index]['ShippingID']
                                .toString() ==
                            '1'
                        ? CustomAppColors.cardBGColor
                        : CustomAppColors.appWhiteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          12.heightBox,
                          Container(
                            width: 172,
                            height: 25,
                            decoration: BoxDecoration(
                              color: CustomAppColors.switchOrgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Image.asset(
                                    AppImages.ProfileDeliveredLocationIcon,
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                2.widthBox,
                                CustomeTextStyle(
                                  text: "Delivered to address",
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 4,
                                ),
                              ],
                            ),
                          ),
                          12.heightBox,
                          Container(
                            height: 35,
                            width: (screenSize.width - 48),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 35,
                                  width: (screenSize.width - 280),
                                  // color: Colors.red,
                                  child: CustomeTextStyle(
                                    text: "Guy Hawkins",
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    height: 12,
                                    width: 1,
                                    color: CustomAppColors.txtPlaceholderColor,
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: (screenSize.width - 170),
                                  // color: Colors.tealAccent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: CustomeTextStyle(
                                          text: "(+91) 98659 89898",
                                          size: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 38,
                            width: (screenSize.width - 48),
                            // color: Colors.red,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 38,
                                  width: (screenSize.width - 48),
                                  // color: Colors.blue,
                                  child: Container(
                                    // color: Colors.teal,
                                    child: Container(
                                      child: CustomeTextStyle(
                                        text:
                                            "61 Dien Bien Phu Ward 15, HCMC, Vietnam",
                                        size: 15,
                                        fontWeight: FontWeight.w400,
                                        color: CustomAppColors.lblColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.blue,
                            height: 30,
                            width: 254,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    print('Change Address');
                                  },
                                  child: Container(
                                    width: 82,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.cardBGColor,
                                      border: Border.all(
                                        width: 1,
                                        color: CustomAppColors.borderColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "Change",
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
                                    print('Shipping address');
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.cardBGColor,
                                      border: Border.all(
                                        width: 1,
                                        color: CustomAppColors.borderColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "Shipping addresses",
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.heightBox,
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const MySeparator(
                      color: CustomAppColors.borderColor,
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
            child: Container(
              width: (screenSize.width - 48),
              height: 56,
              decoration: BoxDecoration(
                color: CustomAppColors.borderColor,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: CustomAppColors.lblOrgColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, top: 1),
                      child: CustomeTextStyle(
                        text: "+",
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                  10.widthBox,
                  Container(
                    child: CustomeTextStyle(
                      text: "New billing address",
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.lblOrgColor,
                      wordSpacing: 0.5,
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
