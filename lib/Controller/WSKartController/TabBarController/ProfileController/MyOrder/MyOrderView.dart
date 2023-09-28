import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'MyOrderController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';

class MyOrderView extends GetView<MyOrderController> {
  const MyOrderView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    var arrMyOrderList = [
      {
        'OrderID': '1',
      },
      {
        'OrderID': '2',
      },
      {
        'OrderID': '3',
      },
      {
        'OrderID': '4',
      },
      {
        'OrderID': '5',
      },
      {
        'OrderID': '6',
      },
      {
        'OrderID': '7',
      },
      {
        'OrderID': '8',
      },
      {
        'OrderID': '9',
      }
    ];
    var strOrderStatusImg = '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "My Orders",
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
          IconButton(
            icon: Image.asset(
              AppImages.ProfileAvtar,
              fit: BoxFit.contain,
              height: 38,
              width: 38,
            ),
            // Icon(Icons.person),
            onPressed: () {
              print('Profile Click');
              Get.toNamed(Routes.MYPROFILEROUTES);
            },
          ),
        ],
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.heightBox,
            Container(
              width: (screenSize.width),
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    24.widthBox,
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Processing');
                        controller.isProcessingIconSelect.value = true;
                        controller.isDeliveringIconSelect.value = false;
                        controller.isCompletedIconSelect.value = false;
                        controller.isReturnedIconSelect.value = false;
                        controller.isCancelledIconSelect.value = false;
                      },
                      child: Container(
                        height: 80,
                        width: 72,
                        decoration:
                            controller.isProcessingIconSelect.value == true
                                ? const BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  )
                                : const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.ProfileProcessingIcon),
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(48)),
                              ),
                            ),
                            8.heightBox,
                            Container(
                              width: 72,
                              height: 16,
                              child: CustomeTextStyle(
                                textAlign: TextAlign.center,
                                text: 'Processing',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    8.widthBox,
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Delivering');
                        controller.isProcessingIconSelect.value = false;
                        controller.isDeliveringIconSelect.value = true;
                        controller.isCompletedIconSelect.value = false;
                        controller.isReturnedIconSelect.value = false;
                        controller.isCancelledIconSelect.value = false;
                      },
                      child: Container(
                        height: 80,
                        width: 72,
                        decoration:
                            controller.isDeliveringIconSelect.value == true
                                ? const BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  )
                                : const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.ProfileDeliveringIcon),
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(48)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.badgeBGColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "1",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.heightBox,
                            Container(
                              width: 72,
                              height: 16,
                              child: CustomeTextStyle(
                                textAlign: TextAlign.center,
                                text: 'Delivering',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    8.widthBox,
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Completed');
                        controller.isProcessingIconSelect.value = false;
                        controller.isDeliveringIconSelect.value = false;
                        controller.isCompletedIconSelect.value = true;
                        controller.isReturnedIconSelect.value = false;
                        controller.isCancelledIconSelect.value = false;
                      },
                      child: Container(
                        height: 80,
                        width: 72,
                        decoration:
                            controller.isCompletedIconSelect.value == true
                                ? const BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  )
                                : const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.ProfileCompletedIcon),
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(48)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.badgeBGColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "4",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.heightBox,
                            Container(
                              width: 72,
                              height: 16,
                              child: CustomeTextStyle(
                                textAlign: TextAlign.center,
                                text: 'Completed',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    8.widthBox,
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Returned');
                        controller.isProcessingIconSelect.value = false;
                        controller.isDeliveringIconSelect.value = false;
                        controller.isCompletedIconSelect.value = false;
                        controller.isReturnedIconSelect.value = true;
                        controller.isCancelledIconSelect.value = false;
                      },
                      child: Container(
                        height: 80,
                        width: 72,
                        decoration:
                            controller.isReturnedIconSelect.value == true
                                ? const BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  )
                                : const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(AppImages.ProfileReturnedIcon),
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(48)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.badgeBGColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        textAlign: TextAlign.center,
                                        text: "6",
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.heightBox,
                            Container(
                              width: 72,
                              height: 16,
                              child: CustomeTextStyle(
                                textAlign: TextAlign.center,
                                text: 'Returned',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    8.widthBox,
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Cancelled');
                        controller.isProcessingIconSelect.value = false;
                        controller.isDeliveringIconSelect.value = false;
                        controller.isCompletedIconSelect.value = false;
                        controller.isReturnedIconSelect.value = false;
                        controller.isCancelledIconSelect.value = true;
                      },
                      child: Container(
                        height: 80,
                        width: 72,
                        decoration:
                            controller.isCancelledIconSelect.value == true
                                ? const BoxDecoration(
                                    color: CustomAppColors.cardBGColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  )
                                : const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.ProfileCancelledIcon),
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(48)),
                              ),
                            ),
                            8.heightBox,
                            Container(
                              width: 72,
                              height: 16,
                              child: CustomeTextStyle(
                                textAlign: TextAlign.center,
                                text: 'Cancelled',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 1,
                // color: CustomAppColors.lblDarkColor,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(child: Container()),
                    const MySeparator(
                      color: CustomAppColors.borderColor,
                    ),
                  ],
                ),
              ),
            ),
            arrMyOrderList.length != 0
                ? Container(
                    width: (screenSize.width),
                    height: (screenSize.height - 248),
                    // color: Colors.red,
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: arrMyOrderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                            child: Container(
                              width: double.infinity,
                              height:
                                  controller.isCompletedIconSelect.value == true
                                      ? 232
                                      : 190,
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: 'ControllerImage',
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Container(
                                                width: 72,
                                                height: 85,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.HomeBestSale),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        24.widthBox,
                                        Container(
                                          height: 90,
                                          // color: Colors.deepPurple,
                                          width: (screenSize.width - 213),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: CustomeTextStyle(
                                                    text:
                                                        "Nike waffle debut women’s shoes",
                                                    size: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 4,
                                                  ),
                                                ),
                                                4.heightBox,
                                                CustomeTextStyle(
                                                  text: "Rs 59.99",
                                                  size: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 4,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: CustomeTextStyle(
                                                          text: "Black",
                                                          size: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: CustomAppColors
                                                              .txtPlaceholderColor,
                                                          wordSpacing: 4,
                                                        ),
                                                      ),
                                                      8.widthBox,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Container(
                                                          width: 6,
                                                          height: 6,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: CustomAppColors
                                                                .switchOrgColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  6),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      8.widthBox,
                                                      Container(
                                                        child: CustomeTextStyle(
                                                          text: "Size: XL",
                                                          size: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: CustomAppColors
                                                              .txtPlaceholderColor,
                                                          wordSpacing: 4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          width: 83,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                child: Container(
                                                  width: 80,
                                                  child: CustomeTextStyle(
                                                    textAlign: TextAlign.right,
                                                    text: "#98244",
                                                    size: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    wordSpacing: 4,
                                                  ),
                                                ),
                                              ),
                                              60.heightBox,
                                              Container(
                                                height: 24,
                                                width: 83,
                                                child: CustomeTextStyle(
                                                  textAlign: TextAlign.right,
                                                  text: "Quantity: 25",
                                                  size: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .txtPlaceholderColor,
                                                  wordSpacing: 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  10.heightBox,
                                  Container(
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        controller.isCancelledIconSelect
                                                    .value ==
                                                true
                                            ? Container()
                                            : InkWell(
                                                focusColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onTap: () {
                                                  print('Cancel order');
                                                  controller.isReturnedIconSelect
                                                              .value ==
                                                          false
                                                      ? Get.toNamed(Routes
                                                          .PROFILEORDERCANCELROUTES)
                                                      : ();
                                                },
                                                child: Container(
                                                  width: controller
                                                              .isReturnedIconSelect
                                                              .value ==
                                                          true
                                                      ? 94
                                                      : 114,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .cardBGColor,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: CustomAppColors
                                                          .borderColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  child: Center(
                                                    child: CustomeTextStyle(
                                                      text: controller
                                                                  .isReturnedIconSelect
                                                                  .value ==
                                                              true
                                                          ? "Buy again"
                                                          : "Cancel order",
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: CustomAppColors
                                                          .lblOrgColor,
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
                                            print('Order details');
                                            Get.toNamed(Routes
                                                .PROFILEORDERDETAILROUTES);
                                          },
                                          child: Container(
                                            width: 114,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  CustomAppColors.cardBGColor,
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    CustomAppColors.borderColor,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            child: Center(
                                              child: CustomeTextStyle(
                                                text: "Order details",
                                                size: 14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    CustomAppColors.lblOrgColor,
                                                wordSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.isCompletedIconSelect.value == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  focusColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    print('Refund/return');
                                                    Get.toNamed(Routes
                                                        .PROFILERETURNORDERROUTES);
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: CustomAppColors
                                                          .cardBGColor,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: CustomAppColors
                                                            .borderColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Center(
                                                      child: CustomeTextStyle(
                                                        text: "Refund/return",
                                                        size: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                12.widthBox,
                                                InkWell(
                                                  focusColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    print('Product rating');
                                                    Get.toNamed(Routes
                                                        .PROFILEREVIEWROUTES);
                                                  },
                                                  child: Container(
                                                    width: 122,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: CustomAppColors
                                                          .cardBGColor,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: CustomAppColors
                                                            .borderColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Center(
                                                      child: CustomeTextStyle(
                                                        text: "Product rating",
                                                        size: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  30.heightBox,
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
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Container(
                      height: (screenSize.height - 248),
                      width: (screenSize.width - 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          48.heightBox,
                          Container(
                            width: 74,
                            height: 64,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.StartIcon),
                              ),
                            ),
                          ),
                          32.heightBox,
                          Container(
                            height: 20,
                            child: CustomeTextStyle(
                              textAlign: TextAlign.center,
                              text: "No orders yet",
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                          20.heightBox,
                          Container(
                            height: 40,
                            width: 260,
                            child: CustomeTextStyle(
                              textAlign: TextAlign.center,
                              text:
                                  "When you cancel the item, the product will appear here",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
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
